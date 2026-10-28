use clap::Parser;

#[derive(Parser, Debug)]
#[command(
    name = "tsuzure-wiki",
    version,
    about = "Tsuzure Wiki for the Tomet ecosystem."
)]
struct Args {
    #[arg(default_value = ".")]
    path: std::path::PathBuf,
}

fn main() -> anyhow::Result<()> {
    let args = Args::parse();
    println!("tsuzure-wiki initialized at: {:?}", args.path);
    Ok(())
}
