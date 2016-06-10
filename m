From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: add Sharp LQ123P1JX31 panel binding
Date: Fri, 10 Jun 2016 09:50:30 -0700
Message-ID: <1465577431-20600-1-git-send-email-dianders@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Starry KR122EA0SRA is a 12.2", 1920x1200 TFT-LCD panel connected
using eDP interfaces.

Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 .../devicetree/bindings/display/panel/starry,kr122ea0sra.txt       | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt

diff --git a/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt b/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
new file mode 100644
index 000000000000..1e87fe6078af
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/starry,kr122ea0sra.txt
@@ -0,0 +1,7 @@
+Starry 12.2" (1920x1200 pixels) TFT LCD panel
+
+Required properties:
+- compatible: should be "starry,kr122ea0sra"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
2.8.0.rc3.226.g39d4020

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
