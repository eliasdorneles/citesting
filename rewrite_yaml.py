import yaml

def load_yaml_config(filepath):
    with open(filepath) as f:
        return yaml.load(f)
     
def save_yaml_config(filepath, config):
    with open(filepath, 'w') as f:
        yaml.dump(config, f, default_flow_style=False)
         
config = load_yaml_config('.travis.yml')
save_yaml_config('.travis.yml', config)

