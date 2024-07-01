import wandb
import yaml

if __name__ == "__main__":
    with open("sweep.yaml") as file:
        sweep_configuration = yaml.safe_load(file)

    # Initialize the sweep
    sweep_id = wandb.sweep(sweep=sweep_configuration, project="sweep_example", entity="cisl-bu")

    # Print id
    print(sweep_id)
