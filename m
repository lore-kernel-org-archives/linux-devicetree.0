From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 1/5] dt-bindings: video: Add Ingenic jz4780-drm binding
Date: Wed, 4 Mar 2015 15:37:47 +0000
Message-ID: <1425483471-59808-2-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1425483471-59808-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425483471-59808-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

This patch adds a display susbsytem for the Ingenic JZ4780 SoC

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
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
