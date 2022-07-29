

import 'package:flutter/material.dart';
import 'package:tok_tok/screen/nav_bar/add_vedio_screen.dart';
import 'package:tok_tok/screen/nav_bar/profile_screen.dart';
import 'package:tok_tok/screen/nav_bar/search_screen.dart';
import 'package:tok_tok/screen/nav_bar/vedio_screen.dart';
import 'package:tok_tok/widget/brand_colors.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVedioScreen(),
  Text('Messages Screen'),
  ProfileScreen(uid: authController.user.uid),
];