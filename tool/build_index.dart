/**
 * Simple script for building example/index.dart based on any html files in
 * the example directory.
 */
import 'dart:io';

void main() {
  var examplePath = 'example';
  var directory = new Directory(examplePath);
  var filenames = directory
      .listSync(recursive: true)
      .map((f) => f.path.substring(examplePath.length + 1))
      .where((p) => p.substring(p.length - 4) == 'html' && p != 'index.html')
      .toList();
  filenames.sort();
  var contents = filenames.map(
    (f) => '<li><a href="$f">$f</a></li>').join('\n      ');
  var html = '''
<html>
  <head>
    <title>three.dart</title>
	<style>
	body {
		font-family: Monospace;
		background-color: #f0f0f0;
		margin: 0px;
		overflow: hidden;
	}
	</style>
  </head>
  <body>
    <ol id="contents">
      $contents
    </ol>
  </body>
</html>
''';

  new File('$examplePath/index.html').create()
    .then((f) => f.openWrite()..write(html)..close())
    .then((_) => print('Done!'));
}
