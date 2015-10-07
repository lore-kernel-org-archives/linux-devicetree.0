From: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Subject: [PATCH 2/3] of: add URT UMSH-8596MD-xT panel DT bindings
Date: Wed, 07 Oct 2015 23:00:51 +0200
Message-ID: <56158803.9000300@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds DT bindings for United Radiant Technology
UMSH-8596MD-xT 7.0" WVGA TFT LCD panels.

Signed-off-by: Maciej Szmigiero <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
---
 Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt

diff --git a/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
new file mode 100644
index 0000000..57c5fa4
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
@@ -0,0 +1,12 @@
+United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
+
+Supported are LVDS versions (-11T, -19T) and parallel ones
+(-T, -1T, -7T, -20T).
+
+Required properties:
+- compatible: should be one of:
+  "urt,umsh-8596md-t", "urt,umsh-8596md-1t", "urt,umsh-8596md-7t",
+  "urt,umsh-8596md-11t", "urt,umsh-8596md-19t" or "urt,umsh-8596md-20t".
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
