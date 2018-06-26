From: Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH v4 1/2] devicetree/bindings: display: Add document for rockchip RGB output
Date: Tue, 26 Jun 2018 15:15:39 +0800
Message-ID: <1529997340-156879-2-git-send-email-hjc@rock-chips.com>
References: <1529997340-156879-1-git-send-email-hjc@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529997340-156879-1-git-send-email-hjc@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: seanpaul@chromium.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This path add support rv1108 and px30 rgb output interface driver.

Signed-off-by: Sandy Huang <hjc@rock-chips.com>
Link: https://patchwork.freedesktop.org/patch/msgid/1509522765-118759-1-git-send-email-hjc@rock-chips.com
---

Changes in v4: Add support px30
Changes in v3: None
Changes in v2: None

.../bindings/display/rockchip/rockchip-rgb.txt     | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-rgb.txt

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-rgb.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-rgb.txt
new file mode 100644
index 0000000..077b9ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-rgb.txt
@@ -0,0 +1,73 @@
+Rockchip RV1108 RGB interface
+================================
+
+Required properties:
+- compatible: matching the soc type:
+	- "rockchip,px30-rgb";
+	- "rockchip,rv1108-rgb";
+
+Optional properties:
+- pinctrl-names: should be a "lcdc" entry or a "default" entry.
+- pinctrl-0: pin control group to be used for this interface.
+
+The rgb has two video ports described by:
+	Documentation/devicetree/bindings/media/video-interfaces.txt
+Their connections are modeled using the OF graph bindings specified in
+	Documentation/devicetree/bindings/graph.txt.
+
+- video port 0 for the VOP input, the remote endpoint maybe vopb/vopl/vop
+- video port 1 for either a panel or subsequent encoder
+
+the panel described by:
+	Documentation/devicetree/bindings/display/panel/simple-panel.txt
+rgb-mode nodes described by:
+	Documentation/devicetree/bindings/display/panel/panel-rgb.txt
+Panel other required properties:
+- ports for remote rgb output.
+
+Example:
+
+panel: panel {
+	compatible = "auo,b101ean01";
+	enable-gpios = <&gpio7 21 GPIO_ACTIVE_HIGH>;
+	rgb-mode = "p888";
+
+	ports {
+		panel_in_rgb: endpoint {
+			remote-endpoint = <&rgb_out_panel>;
+		};
+	};
+};
+
+For Rockchip RV1108:
+
+	rgb: rgb {
+		compatible = "rockchip,rv1108-rgb";
+		pinctrl-names = "lcdc";
+		pinctrl-0 = <&lcdc_ctl>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			rgb_in: port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rgb_in_vop: endpoint {
+					remote-endpoint = <&vop_out_rgb>;
+				};
+			};
+
+			rgb_out: port@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rgb_out_panel: endpoint {
+					remote-endpoint = <&panel_in_rgb>;
+				};
+			};
+		};
+	};
-- 
2.7.4
