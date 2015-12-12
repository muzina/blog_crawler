#!/usr/bin/perl -

#===============================================================================
#
#[[Information]]
# TITLE:	higurashi.pl
# DESCRIPTION:	ひぐらし製作日記（http://07th-expansion.net/Cgi/clip/clip.cgi）に掲載された画像をダウンロードする
# AUTHOR:	muzina (https://github.com/muzina)
# VERSION:	2015/12/12
#
#[[Methods]]
#1 http://07th-expansion.net/Cgi/clip/Up_cg/114.jpg　から、連番で画像をダウンロードします 
#2 連番の最大値は最新の記事番号を入力してください。
#
#[[Disclaimer]]
#* http://07th-expansion.net/faq.htm に従います。
#
#[[Memo]]
#
#===============================================================================

use LWP::Simple;#モジュール設定

my $i=114;
my $uribase='http://07th-expansion.net/Cgi/clip/Up_cg/';
my $uri='null';
my $maxnumber=613;#記事番号の最大値

for ($i = 114; $i < $maxnumber; $i++){
 $uri="$uribase"."$i"."\.jpg";
 print "$uri downloading...\n";
 $image=get($uri);
 if ($image ne ""){#ダウンロードしたデータが空でなければ
  if (!open(IMAGE,">>$i.jpg")) { &error(bad_file); }
  binmode IMAGE;
  print IMAGE "$image";
  print "downloading $uri \n";
  close(IMAGE);
 }
 sleep 1;
}
print "finished";
exit;
