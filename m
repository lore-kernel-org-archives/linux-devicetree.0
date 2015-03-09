From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH_V2 1/5] dt-bindings: video: Add Ingenic jz4780-drm binding
Date: Mon, 9 Mar 2015 12:44:01 +0000
Message-ID: <1425905045-14007-2-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1425905045-14007-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425905045-14007-1-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a display susbsytem for the Ingenic JZ4780 SoC

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

---
V1 -> V2
Rebased to 4.0-rc3
---
 .../devicetree/bindings/video/ingenic-jz4780-drm.txt    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/ingenic-jz4780-drm.txt

diff --git a/Documentation/devicetree/bindings/video/ingenic-jz4780-drm.txt b/Documentation/devicetree/bindings/video/ingenic-jz4780-drm.txt
new file mode 100644
index 0000000..14a65a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/ingenic-jz4780-drm.txt
@@ -0,0 +1,17 @@
+Ingenic JZ4780 DRM master device
+================================
+
+The Ingenic JZ4780 DRM master device is a virtual device needed to list all
+devices or other display interface nodes that comprise the graphics subsystem.
+
+Required properties:
+- compatible: Should be "ingenic,jz4780-display-subsystem"
+- ports: Should contain a list of phandles pointing to display interface port
+  as defined in Documentation/devicetree/bindings/video/rockchip-vop.txt
+
+example:
+
+display-subsystem {
+	compatible = "ingenic,jz4780-display-subsystem";
+	ports = <&jz4780_lcd_out>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
