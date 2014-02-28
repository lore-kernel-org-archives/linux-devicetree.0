From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 2/2] checkpatch: fix spurious vendor compatible
 warnings
Date: Fri, 28 Feb 2014 13:06:11 -0800
Message-ID: <1393621571.10280.49.camel@joe-AO722>
References: <1393604742-14317-1-git-send-email-florian.vaussard@epfl.ch>
	 <1393604742-14317-3-git-send-email-florian.vaussard@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393604742-14317-3-git-send-email-florian.vaussard@epfl.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Vaussard <florian.vaussard@epfl.ch>
Cc: Andy Whitcroft <apw@canonical.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi.

A couple of suggestions and a couple of questions.

I made the patch below against your patches to.

o Look for ".compatible = "foo" strings in .c and .h files too
o Improve the vendor name match in vendor-prefix.txt by only
  matching the exact vendor name at the beginning of lines.

I then produced a file of all the compatible uses in dts
and used checkpatch on it.  It's a long list and a longer
checkpatch warning list.

$ git ls-files | grep -E "\.dtsi?$" | \
  xargs grep -hE "^\s*compatible\s*="| \
  sed -r -e 's/^\s*//' -e 's/\s*=\s*/ = /'| sort | uniq > tmp.dts
$ .scripts/checkpatch.pl -f tmp.dts

A couple of questions:

How does the $compat2 variable actually work?
What is it supposed to do?

				my $compat2 = $compat;
				$compat2 =~ s/\,[a-z]*\-/\,<\.\*>\-/;

For instance:
WARNING: DT compatible string "marvell,tauros2-cache" appears un-documented -- check ./Documentation/devicetree/bindings/

The prefix "tauros2-" doesn't match '=~ s/[a-z]*-/

Should it?  Should the '[a-z]*' be '[a-zA-Z0-9-]+'
like the other test?

Also the grep used when $compat2 is different than $compat
has <.*>

There aren't any descriptions I see in binding/ that have
any <foo> like uses with the angle brackets.

Are the angle brackets "<" and ">" necessary?

I think the code block should look more like:

				my $compat2 = $compat;
				$compat2 =~ s/\,[a-zA-Z0-9]*\-/\,\.\*\-/g;
				my $grepfor = "\Q$compat\E";
				$grepfor .= "|\Q$compat2\E" if ($compat2 ne $compat);
				`grep -Erq "$grepfor" $dt_path`;

so that there's only 1 grep pattern when
$compat2 is the same as $compat and the
strings are escape quoted.

There are a _lot_ of missing entries:

o 164 vendor names
o 2408 device names (maybe due to bad compat2 greps?)

What, if anything, should be done about them?

---
 scripts/checkpatch.pl | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4b5e7b3..7a9eed9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2051,29 +2051,29 @@ sub process {
 		}
 
 # check for DT compatible documentation
-		if (defined $root && $realfile =~ /\.dts/ &&
-		    $rawline =~ /^\+\s*compatible\s*=/) {
+		if (defined $root &&
+		    (($realfile =~ /\.dtsi?$/ && $line =~ /^\+\s*compatible\s*=\s*\"/) ||
+		     ($realfile =~ /\.[ch]$/ && $line =~ /^\+.*\.compatible\s*=\s*\"/))) {
+
 			my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,\.\+_]+)\"/g;
 
+			my $dt_path = $root . "/Documentation/devicetree/bindings/";
+			my $vp_file = $root . "/Documentation/devicetree/bindings/vendor-prefixes.txt";
+
 			foreach my $compat (@compats) {
 				my $compat2 = $compat;
-				my $dt_path =  $root . "/Documentation/devicetree/bindings/";
 				$compat2 =~ s/\,[a-z]*\-/\,<\.\*>\-/;
 				`grep -Erq "$compat|$compat2" $dt_path`;
 				if ( $? >> 8 ) {
 					WARN("UNDOCUMENTED_DT_STRING",
 					     "DT compatible string \"$compat\" appears un-documented -- check $dt_path\n" . $herecurr);
 				}
-
-				my $vendor = $compat;
-				my $vendor_path = $dt_path . "vendor-prefixes.txt";
-				next if (! -f $vendor_path);
-				next if not $vendor =~ /^[a-zA-Z0-9\-]+\,.*/;
-				$vendor =~ s/^([a-zA-Z0-9\-]+)\,.*/$1/;
-				`grep -Eq "$vendor" $vendor_path`;
+				next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
+				my $vendor = $1;
+				`grep -Eq "^$vendor\\b" $vp_file`;
 				if ( $? >> 8 ) {
 					WARN("UNDOCUMENTED_DT_STRING",
-					     "DT compatible string vendor \"$vendor\" appears un-documented -- check $vendor_path\n" . $herecurr);
+					     "DT compatible string vendor \"$vendor\" appears un-documented -- check $vp_file\n" . $herecurr);
 				}
 			}
 		}
---
