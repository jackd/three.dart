library three_postprocessing;

/*
 * Three.js Postprocessing Library
 *
 * Ported to Dart from JS by:
 * @author Christopher Grabowski / https://github.com/cgrabowski
 */

import 'dart:html';
import 'dart:web_gl' as gl;
import 'package:three/three.dart';
import 'package:three/extras/shaders/shaders.dart';

part 'bokeh_pass.dart';
part 'effect_composer.dart';
part 'pass.dart';
part 'render_pass.dart';
part 'shader_pass.dart';
