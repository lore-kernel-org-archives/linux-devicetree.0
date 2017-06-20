From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] Documentation: remove overlay-notes reference to non-existent file
Date: Tue, 20 Jun 2017 15:40:53 -0700
Message-ID: <1497998453-1585-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: afaerber-l3A5Bk7waGM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

File dt-object-internal.txt does not exist.  Remove a reference to it
and fix up tags for references to other files.

Reported-by: afaerber-l3A5Bk7waGM@public.gmane.org
Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 Documentation/devicetree/overlay-notes.txt | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
index d418a6ce9812..eb7f2685fda1 100644
--- a/Documentation/devicetree/overlay-notes.txt
+++ b/Documentation/devicetree/overlay-notes.txt
@@ -3,8 +3,7 @@ Device Tree Overlay Notes
 
 This document describes the implementation of the in-kernel
 device tree overlay functionality residing in drivers/of/overlay.c and is a
-companion document to Documentation/devicetree/dt-object-internal.txt[1] &
-Documentation/devicetree/dynamic-resolution-notes.txt[2]
+companion document to Documentation/devicetree/dynamic-resolution-notes.txt[1]
 
 How overlays work
 -----------------
@@ -16,8 +15,7 @@ Since the kernel mainly deals with devices, any new device node that result
 in an active device should have it created while if the device node is either
 disabled or removed all together, the affected device should be deregistered.
 
-Lets take an example where we have a foo board with the following base tree
-which is taken from [1].
+Lets take an example where we have a foo board with the following base tree:
 
 ---- foo.dts -----------------------------------------------------------------
 	/* FOO platform */
@@ -36,7 +34,7 @@ which is taken from [1].
 	};
 ---- foo.dts -----------------------------------------------------------------
 
-The overlay bar.dts, when loaded (and resolved as described in [2]) should
+The overlay bar.dts, when loaded (and resolved as described in [1]) should
 
 ---- bar.dts -----------------------------------------------------------------
 /plugin/;	/* allow undefined label references and record them */
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
