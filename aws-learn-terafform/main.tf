module "autoscaling" {
  source      = "./modules/autoscaling"          
  namespace   = var.namespace
  ssh_keypair = var.ssh_keypair
  
  /*input arguments for the 
    autoscaling module, set by 
    other module’s outputs */

  vpc       = module.networking.vpc          
  sg        = module.networking.sg          
  db_config = module.database.db_config           
}
module "database" {
  source    = "./modules/database"           
  namespace = var.namespace 

  /* Data bubbles up from the networking module 
     and trickles down into the database module. */

  vpc = module.networking.vpc           
  sg  = module.networking.sg         
}
module "networking" {
  source    = "./modules/networking"           
  namespace = var.namespace          
}