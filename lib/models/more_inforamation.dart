import 'package:flutter/material.dart';
import 'dark_mode.dart';

class MoreInformation extends StatelessWidget {
  final BuildContext _ctx;
  final String _imageThumbnail,
      _price,
      _title,
      _brand,
      _rating,
      _description,
      _stock;

  MoreInformation(
    this._ctx,
    this._imageThumbnail,
    this._price,
    this._title,
    this._brand,
    this._rating,
    this._description,
    this._stock,
  );

  final DarkMode _darkMode = DarkMode.getInstance();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      //insetPadding: const EdgeInsets.all(20),
      backgroundColor: _darkMode.mode['text_color'],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 450,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(_ctx).pop();
                },
                icon: Icon(
                  Icons.cancel_outlined,
                  color: _darkMode.mode['main_color'],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            _imageThumbnail,
                          ),
                        ),
                      ),
                      child: ListTile(
                        textColor: _darkMode.mode['main_color'],
                        leading: Chip(
                          backgroundColor: _darkMode.mode['text_color'],
                          labelStyle: TextStyle(color: _darkMode.mode['main_color']),
                          label: Text(
                            "\$$_price",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      textColor: _darkMode.mode['main_color'],
                      title: Text(_title),
                      subtitle: Text(_brand),
                      trailing: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        label: Text(_rating,style: const TextStyle(color: Colors.grey),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                       _description,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    ListTile(
                      textColor: _darkMode.mode['main_color'],
                      title: const Text("Stock"),
                      trailing: Text(
                       _stock,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
