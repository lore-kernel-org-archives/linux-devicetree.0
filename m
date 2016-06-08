From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 1/6] dt-bindings: add LG LP097QX1-SPA1 panel binding
Date: Wed,  8 Jun 2016 19:52:07 +0800
Message-ID: <1465386727-27647-1-git-send-email-ykk@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The LG LP097QX1-SPA1 is an 9.7", 2048x1536 (QXGA) TFT-LCD panel
connected using eDP interfaces.

Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes in v2:
- Add Rob's acked for dt-bindings of LG LP097QX1-SPA1 panel

 .../devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt         | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt

diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt b/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt
new file mode 100644
index 0000000..4214151
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,lp097qx1-spa1.txt
@@ -0,0 +1,7 @@
+LG 9.7" (2048x1536 pixels) TFT LCD panel
+
+Required properties:
+- compatible: should be "lg,lp097qx1-spa1"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
