async function main(){
    const MULTIPLENFT =await ethers.getContractFactory("multiNFT");
    const HardhatNFT= await MULTIPLENFT.deploy();
    console.log("address required",await HardhatNFT.getAddress());

}
main()
    .then(()=>process.exit(0))
    .catch((error)=>{
        console.error(error);
        process.exit(1);
    });