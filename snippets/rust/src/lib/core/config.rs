//use config::File;
//use config::FileSourceFile;

pub struct ModelConfig {
    configuration: config::File<config::FileSourceFile>
}

impl ModelConfig {
    pub fn new(file: String) -> ModelConfig {
        ModelConfig {
            configuration: config::File::with_name(&file.to_string())
        }

    }

    pub fn test_config(&self) {
        println!("Test Config");
    }

    pub fn get_int_config(&self, key: String) -> u32 {
        println!("{:?}", self.configuration);
        return 3306;
    }
}

