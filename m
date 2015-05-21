From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH trivial] OF: Spelling/grammar s/rationalle of/rationale for/
Date: Thu, 21 May 2015 14:16:00 +0200
Message-ID: <1432210560-23444-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Fixes: 3685943b0970e33c ("OF: DT-Overlay configfs interface (v4)")
---
Against Pantelis' linux-beagle-track-mainline.git/bbb-overlays.

 Documentation/devicetree/configfs-overlays.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/configfs-overlays.txt b/Documentation/devicetree/configfs-overlays.txt
index 5fa43e0643072c79..185d85ef52e49074 100644
--- a/Documentation/devicetree/configfs-overlays.txt
+++ b/Documentation/devicetree/configfs-overlays.txt
@@ -25,7 +25,7 @@ To remove it simply rmdir the directory.
 
 	# rmdir /config/device-tree/overlays/foo
 
-The rationalle of the dual interface (firmware & direct copy) is that each is
+The rationale for the dual interface (firmware & direct copy) is that each is
 better suited to different use patterns. The firmware interface is what's
 intended to be used by hardware managers in the kernel, while the copy interface
 make sense for developers (since it avoids problems with namespaces).
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
