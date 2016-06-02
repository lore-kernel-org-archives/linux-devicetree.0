From: Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH 1/2 v16] Documentation: bridge: Add documentation for ps8640 DT properties
Date: Thu, 2 Jun 2016 17:57:24 +0800
Message-ID: <1464861445-11086-1-git-send-email-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jitao Shi <jitao.shi@mediatek.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Sean Paul <seanpaul@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, cawa.cheng@mediatek.com, bibby.hsieh@media
List-Id: devicetree@vger.kernel.org

Add documentation for DT properties supported by
ps8640 DSI-eDP converter.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v15:
 - No change.

Changes since v14:
 - change mode-sel-gpios as optional.
---
 .../devicetree/bindings/display/bridge/ps8640.txt  |   44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ps8640.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.txt b/Documentation/devicetree/bindings/display/bridge/ps8640.txt
new file mode 100644
index 0000000..7b13f92
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ps8640.txt
@@ -0,0 +1,44 @@
+ps8640-bridge bindings
+
+Required properties:
+	- compatible: "parade,ps8640"
+	- reg: first page address of the bridge.
+	- sleep-gpios: OF device-tree gpio specification for PD pin.
+	- reset-gpios: OF device-tree gpio specification for reset pin.
+	- vdd12-supply: OF device-tree regulator specification for 1.2V power.
+	- vdd33-supply: OF device-tree regulator specification for 3.3V power.
+	- ports: The device node can contain video interface port nodes per
+		 the video-interfaces bind[1]. For port@0,set the reg = <0> as
+		 ps8640 dsi in and port@1,set the reg = <1> as ps8640 eDP out.
+
+Optional properties:
+	- mode-sel-gpios: OF device-tree gpio specification for mode-sel pin.
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+	edp-bridge@18 {
+		compatible = "parade,ps8640";
+		reg = <0x18>;
+		sleep-gpios = <&pio 116 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&pio 115 GPIO_ACTIVE_LOW>;
+		mode-sel-gpios = <&pio 92 GPIO_ACTIVE_HIGH>;
+		vdd12-supply = <&ps8640_fixed_1v2>;
+		vdd33-supply = <&mt6397_vgp2_reg>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				ps8640_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				ps8640_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
-- 
1.7.9.5
