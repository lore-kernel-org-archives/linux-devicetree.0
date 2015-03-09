From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V2 2/5] dt-bindings: video: Add jz4780-lcd binding
Date: Mon, 9 Mar 2015 12:44:02 +0000
Message-ID: <1425905045-14007-3-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1425905045-14007-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425905045-14007-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

Add DT bindings for the LCD controller on the jz4780 SoC

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
V1 -> V2
Rebased to 4.0-rc3
---
 .../bindings/video/ingenic-jz4780-lcd.txt          | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/ingenic-jz4780-lcd.txt

diff --git a/Documentation/devicetree/bindings/video/ingenic-jz4780-lcd.txt b/Documentation/devicetree/bindings/video/ingenic-jz4780-lcd.txt
new file mode 100644
index 0000000..8512ce3
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/ingenic-jz4780-lcd.txt
@@ -0,0 +1,39 @@
+Bindings for Ingenic JZ4780 LCD Controller
+
+LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
+
+Required properties:
+- compatible: should be "ingenic,jz4780-lcd"
+- reg: Should contain the address & size of the LCD controller registers.
+- interrupts: Should specify the interrupt provided by parent.
+- clocks: Should contain two clock specifiers for the JZ4780_CLK_TVE JZ4780_CLK_LCD0PIXCLK.
+- clock-names : Must be "lcd_clk", "lcd_pixclk";
+- port: A port node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Optional properties:
+- interrupt-parent: phandle to parent interrupt controller
+
+Example:
+
+lcd: jz4780-lcdk@0x13050000 {
+	compatible = "ingenic,jz4780-lcd";
+	reg = <0x13050000 0x1800>;
+
+	clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
+	clock-names = "lcd_clk", "lcd_pixclk";
+
+	interrupt-parent = <&intc>;
+	interrupts = <31>;
+
+	jz4780_lcd_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			jz4780_out_hdmi: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_in_lcd>;
+			};
+		};
+
+};
-- 
1.9.1
