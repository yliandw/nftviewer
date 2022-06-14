import 'package:flutter/material.dart';
import 'package:nftview/provider/nft_provider.dart';
import 'package:provider/provider.dart';

class NFTScreen extends StatefulWidget {
  const NFTScreen({Key? key}) : super(key: key);

  @override
  State<NFTScreen> createState() => _NFTScreenState();
}

class _NFTScreenState extends State<NFTScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFT View',
            style: TextStyle(
                color: Color.fromARGB(255, 14, 13, 7),
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Consumer<NFTProvider>(
        // ignore: non_constant_identifier_names
        builder: (context, provider, NFTScreenState) {
          return ListView.builder(
              itemCount: provider.nftModel.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            provider.nftModel.data![index].imageLink!,
                            fit: BoxFit.cover,
                          )),
                      Text(
                        provider.nftModel.data![index].name!,
                        style: const TextStyle(fontSize: 26),
                      ),
                      Text(provider.nftModel.data![index].description!),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
