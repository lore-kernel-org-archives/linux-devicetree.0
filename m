From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/2] drm/panel: simple: Add Documentation for Sharp LQ101K1LY04
Date: Wed,  1 Jun 2016 08:35:51 -0700
Message-ID: <1464795351-11668-2-git-send-email-stillcompiling@gmail.com>
References: <1464795351-11668-1-git-send-email-stillcompiling@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464795351-11668-1-git-send-email-stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document basic simple-panel support for Sharp LQ101K1LY04

Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/display/panel/sharp,lq101k1ly04.txt        | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt
new file mode 100644
index 0000000..4aff25b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101k1ly04.txt
@@ -0,0 +1,7 @@
+Sharp Display Corp. LQ101K1LY04 10.07" WXGA TFT LCD panel
+
+Required properties:
+- compatible: should be "sharp,lq101k1ly04"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
