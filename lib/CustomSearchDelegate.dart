import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear), 
        onPressed: (){
          query="";
        }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Botao de voltar
    return IconButton(
        icon: Icon(Icons.arrow_back), 
        onPressed: (){
          close(context, "");
        }
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // sugestões de pesquisa
    List<String> suggestionsList = List();

    if (query.isNotEmpty){
      suggestionsList = ["crochê","trico"].where(
        (text) => text.toLowerCase().startsWith(query.toLowerCase())
      ).toList();
      
      return ListView.builder(
        itemCount: suggestionsList.length,
        itemBuilder: (context,index){
          return ListTile(
            onTap: (){close(context,suggestionsList[index]);},
            title: Text(suggestionsList[index])
          );
        }
      );
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }

    
  }
  
}