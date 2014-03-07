From: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Subject: [PATCH v3 2/4] checkpatch: fix spurious vendor compatible warnings
Date: Fri,  7 Mar 2014 14:26:09 +0100
Message-ID: <1394198771-25913-3-git-send-email-florian.vaussard@epfl.ch>
References: <1394198771-25913-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394198771-25913-1-git-send-email-florian.vaussard-p8DiymsW2f8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

With a compatible string like

compatible = "foo";

checkpatch will currently try to find "foo" in  vendor-prefixes.txt,
which is wrong since the vendor prefix is empty in this specific case.

Skip the vendor test if the compatible is not like

compatible = "vendor,something";

Signed-off-by: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
[joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org: cleaned the implementation]
Signed-off-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e304e77..96f10ba 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2055,10 +2055,10 @@ sub process {
 					     "DT compatible string \"$compat\" appears un-documented -- check $dt_path\n" . $herecurr);
 				}
 
-				my $vendor = $compat;
 				my $vendor_path = $dt_path . "vendor-prefixes.txt";
 				next if (! -f $vendor_path);
-				$vendor =~ s/^([a-zA-Z0-9\-]+)\,.*/$1/;
+				next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
+				my $vendor = $1;
 				`grep -Eq "$vendor" $vendor_path`;
 				if ( $? >> 8 ) {
 					WARN("UNDOCUMENTED_DT_STRING",
-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
