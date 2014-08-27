From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH resend] checkpatch: Enable whitespace checks for DTS files
Date: Wed, 27 Aug 2014 17:08:26 +0200
Message-ID: <1409152106-9424-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When run on *.dtsi or *.dts files, the whitespace checks were skipped,
while they are valid for DTS files.  Hence stop skipping them.

I ran checkpatch on all in-tree DTS files, and didn't notice any error or
warning messages that are inappropriate for DTS files.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 31a731e06f50..ded90b6d7e17 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2338,7 +2338,7 @@ sub process {
 		}
 
 # check we are in a valid source file if not then ignore this hunk
-		next if ($realfile !~ /\.(h|c|s|S|pl|sh)$/);
+		next if ($realfile !~ /\.(h|c|s|S|pl|sh|dtsi|dts)$/);
 
 #line length limit
 		if ($line =~ /^\+/ && $prevrawline !~ /\/\*\*/ &&
@@ -2399,7 +2399,7 @@ sub process {
 		}
 
 # check we are in a valid source file C or perl if not then ignore this hunk
-		next if ($realfile !~ /\.(h|c|pl)$/);
+		next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
 
 # at the beginning of a line any tabs must come first and anything
 # more than 8 must use tabs.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
