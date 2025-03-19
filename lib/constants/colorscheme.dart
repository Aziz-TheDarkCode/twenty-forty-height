import 'package:flutter/material.dart';

// Background and UI colors
const backgroundColor = Color(0xffF0F7FF); // Light sky blue background
const textColor = Color(0xff4A6572); // Deep slate blue for text
const textColorWhite =
    Color(0xffFCFCFC); // Off-white for text on dark backgrounds
const boardColor = Color(0xff92B6D5); // Soft blue for game board
const emptyTileColor = Color(0xffDCE6F2); // Very light blue for empty tiles
const buttonColor = Color(0xff5D88A3); // Medium blue for buttons
const scoreColor = Color(0xff92B6D5); // Same as boardColor for consistency
const overlayColor =
    Color.fromRGBO(220, 230, 242, 0.8); // Semi-transparent light blue

// Tile colors - bird evolution theme
const color2 = Color(0xffFFF0C9); // Soft yellow for baby chick (🐣)
const color4 = Color(0xffFFE6A7); // Darker yellow for growing chick (🐥)
const color8 = Color(0xffFFD166); // Golden yellow for young chicken (🐤)
const color16 = Color(0xffE79D40); // Orange-brown for chicken (🐔)
const color32 = Color(0xff7A6F9B); // Blue-purple for eagle (🦅)
const color64 = Color(0xff634D70); // Deep purple for owl (🦉)
const color128 = Color(0xff3F88C5); // Vibrant blue for peacock (🦚)
const color256 = Color(0xff32936F); // Green for parrot (🦜)
const color512 = Color(0xffEBF2FA); // White-blue for swan (🦢)
const color1024 = Color(0xff964B00); // Brown for dodo (🦤)
const color2048 = Color(0xffFF9899); // Pink for flamingo (🦩)
const color4096 = Color(0xff2A9D8F); // Teal-green for dragon (🐉)

// Tile colors map
const tileColors = {
  0: emptyTileColor,
  2: color2,
  4: color4,
  8: color8,
  16: color16,
  32: color32,
  64: color64,
  128: color128,
  256: color256,
  512: color512,
  1024: color1024,
  2048: color2048,
  4096: color4096,
};

// Emoji map (unchanged from your original)
const tileEmojis = {
  2: "🐣",
  4: "🐥",
  8: "🐤",
  16: "🐔",
  32: "🦅",
  64: "🦉",
  128: "🦚",
  256: "🦜",
  512: "🦢",
  1024: "🦤",
  2048: "🦩",
  4096: "🐉",
};
