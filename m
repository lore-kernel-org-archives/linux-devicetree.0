From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH] Documentation: devicetree: "linux,usable-memory" property
Date: Fri, 23 Dec 2016 17:17:47 +0100
Message-ID: <20161223161747.9986-1-xypron.glpk@gmx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Memory nodes may have a "linux,usable-memory" property
overriding the reg property.

This patch adds the missing documentation.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 Documentation/devicetree/booting-without-of.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentation/devicetree/booting-without-of.txt
index 280d283304bb..92712c5604b0 100644
--- a/Documentation/devicetree/booting-without-of.txt
+++ b/Documentation/devicetree/booting-without-of.txt
@@ -981,6 +981,10 @@ compatibility.
       removed later. The kernel can take this into consideration when
       doing nonmovable allocations and when laying out memory zones.
 
+    - linux,usable-memory : This property overrides the reg property.
+      It can be used if the bootloader changes the reg property to
+      improper values.
+
   e) The /chosen node
 
   This node is a bit "special". Normally, that's where Open Firmware
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
