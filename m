From: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Subject: [PATCH v3 4/4] checkpatch: improve the compatible vendor match
Date: Fri,  7 Mar 2014 14:26:11 +0100
Message-ID: <1394198771-25913-5-git-send-email-florian.vaussard@epfl.ch>
References: <1394198771-25913-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394198771-25913-1-git-send-email-florian.vaussard-p8DiymsW2f8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>

From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>

Improve the vendor name match in vendor-prefix.txt
by only matching the exact vendor name at the beginning of lines.

Signed-off-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
[florian.vaussard-p8DiymsW2f8@public.gmane.org: split patch, commit log]
Signed-off-by: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
---
 scripts/checkpatch.pl | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9205153..5bda9f7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2047,9 +2047,11 @@ sub process {
 
 			my @compats = $rawline =~ /\"([a-zA-Z0-9\-\,\.\+_]+)\"/g;
 
+			my $dt_path = $root . "/Documentation/devicetree/bindings/";
+			my $vp_file = $dt_path . "vendor-prefixes.txt";
+
 			foreach my $compat (@compats) {
 				my $compat2 = $compat;
-				my $dt_path =  $root . "/Documentation/devicetree/bindings/";
 				$compat2 =~ s/\,[a-z]*\-/\,<\.\*>\-/;
 				`grep -Erq "$compat|$compat2" $dt_path`;
 				if ( $? >> 8 ) {
@@ -2057,14 +2059,12 @@ sub process {
 					     "DT compatible string \"$compat\" appears un-documented -- check $dt_path\n" . $herecurr);
 				}
 
-				my $vendor_path = $dt_path . "vendor-prefixes.txt";
-				next if (! -f $vendor_path);
 				next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
 				my $vendor = $1;
-				`grep -Eq "$vendor" $vendor_path`;
+				`grep -Eq "^$vendor\\b" $vp_file`;
 				if ( $? >> 8 ) {
 					WARN("UNDOCUMENTED_DT_STRING",
-					     "DT compatible string vendor \"$vendor\" appears un-documented -- check $vendor_path\n" . $herecurr);
+					     "DT compatible string vendor \"$vendor\" appears un-documented -- check $vp_file\n" . $herecurr);
 				}
 			}
 		}
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
