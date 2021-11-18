import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nasa_app/core/api_constants.dart';
import 'package:nasa_app/provider/nasa_pages_provider.dart';
import 'package:nasa_app/view/components/rover_list_item.dart';
import 'package:provider/provider.dart';

class SpiritPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pagesProvider= Provider.of<NasaPagesProvider>(context,listen: false);
    return FutureBuilder(
      future: pagesProvider.nasaRepository!.getDataSpirit("1000", "1", ApiConstant.apiKey),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CupertinoActivityIndicator(animating: true,radius: 10,));
          case ConnectionState.done:
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: snapshot.data.photos.length,
              itemBuilder: (BuildContext context, int index) {
                return  RoverListItem(
                  fullName: snapshot.data.photos[index].camera.fullName,
                  imagePath:snapshot.data.photos[index].imgSrc,
                  earthDate: snapshot.data.photos[index].earthDate,
                  roverName: snapshot.data.photos[index].rover.name,);
              },
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.fit(2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
            break;
          default:
            return Container();
        }

      },
    );
  }
}
