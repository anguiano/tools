use model_config::ModelConfig;


fn main() {
    println!("Rust Snippets - Pako Anguiano");
    //let mut configurations = config::Config::default();
    
    // Add in `./Settings.toml`
    //let settings = config::File::with_name("Settings");

    //configurations.merge(settings).unwrap();

    //println!("{:?}", configurations);
    let config = ModelConfig::new("Settings".to_string());
    config.test_config();
    let port = config.get_int_config("MySQL.port".to_string());
    println!("{}", port);

}
