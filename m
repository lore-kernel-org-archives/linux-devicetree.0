From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v7 7/7] dt-bindings: add document for dw-hdmi
Date: Tue, 11 Nov 2014 20:12:32 +0800
Message-ID: <1415707952-11415-8-git-send-email-andy.yan@rock-chips.com>
References: <1415707952-11415-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415707952-11415-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, Zubair.Kakakhel@imgtec.com, rmk+kernel@arm.linux.org.uk, fabio.estevam@freescale.com, heiko@sntech.de, djkurtz@chromium.org, ykk@rock-chips.com
Cc: Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../devicetree/bindings/drm/bridge/dw-hdmi.txt     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt

diff --git a/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt b/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt
new file mode 100644
index 0000000..aa7ed17
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt
@@ -0,0 +1,38 @@
+DesignWare HDMI bridge bindings
+
+Required properities:
+- compatibel: platform specific such as "fsl,imx6q-hdmi","fsl,imx6dl-hdmi"
+	      "rockchip,rk3288-dw-hdmi"
+- reg: physical base address of the controller and length
+- ddc-i2c-bus: the ddc i2c bus
+- interrupts: The interrupt number to the cpu
+
+Optional properties
+- reg-io-width: the width of the reg:1,4, default set to 1 if not present
+
+Example:
+	hdmi: hdmi@0120000 {
+		compatible = "fsl,imx6q-hdmi";
+		reg = <0x00120000 0x9000>;
+		interrupts = <0 115 0x04>;
+		gpr = <&gpr>;
+		clocks = <&clks 123>, <&clks 124>;
+		clock-names = "iahb", "isfr";
+		ddc-i2c-bus = <&i2c2>;
+
+		port@0 {
+			reg = <0>;
+
+			hdmi_mux_0: endpoint {
+				remote-endpoint = <&ipu1_di0_hdmi>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			hdmi_mux_1: endpoint {
+				remote-endpoint = <&ipu1_di1_hdmi>;
+			};
+		};
+	};
-- 
1.9.1
