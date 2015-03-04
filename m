From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 4/5] dt-bindings: video: Add jz4780-hdmi binding
Date: Wed, 4 Mar 2015 15:37:50 +0000
Message-ID: <1425483471-59808-5-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1425483471-59808-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425483471-59808-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Zubair.Kakakhel@imgtec.com
List-Id: devicetree@vger.kernel.org

Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 .../bindings/video/ingenic-jz4780-hdmi.txt         | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/ingenic-jz4780-hdmi.txt

diff --git a/Documentation/devicetree/bindings/video/ingenic-jz4780-hdmi.txt b/Documentation/devicetree/bindings/video/ingenic-jz4780-hdmi.txt
new file mode 100644
index 0000000..f02e59f
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/ingenic-jz4780-hdmi.txt
@@ -0,0 +1,41 @@
+Device-Tree bindings for Ingenic JZ4780 HDMI Transmitter
+
+The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare HDMI 1.4
+TX controller IP with accompanying PHY IP.
+
+Required properties:
+ - #address-cells : should be <1>
+ - #size-cells : should be <0>
+ - compatible : should be "ingenic,jz4780-hdmi"
+ - reg-io-width: must be <4>
+ - clocks: phandle to isrf and iahb clocks
+ - clock-names : must be "isrf" and "iahb"
+ - ports: Port nodes with endpoint definitions as defined in
+   Documentation/devicetree/bindings/media/video-interfaces.txt,
+
+Optional properties:
+ - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
+
+example:
+
+hdmi: hdmi@10180000 {
+	compatible = "ingenic,jz4780-hdmi";
+	reg = <0x10180000 0x8000>;
+	reg-io-width = <4>;
+	ddc-i2c-bus = <&i2c4>;
+	interrupt-parent = <&intc>;
+	interrupts = <3>;
+	clocks = <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
+	clock-names = "isfr", "iahb";
+
+	ports {
+		hdmi_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			hdmi_in_lcd: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&jz4780_out_hdmi>;
+			};
+		};
+	};
+};
-- 
1.9.1
