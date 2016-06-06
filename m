From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH v3 1/2] Documentation: bindings: add DT documentation for Rockchip USB2PHY
Date: Mon,  6 Jun 2016 17:20:03 +0800
Message-ID: <1465204804-31161-2-git-send-email-frank.wang@rock-chips.com>
References: <1465204804-31161-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465204804-31161-1-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---

Changes in v3:
 - Added 'clocks' and 'clock-names' optional properties.
 - Specified 'otg-port' and 'host-port' as the sub-node name.

Changes in v2:
 - Changed vbus_host optional property from gpio to regulator.
 - Specified vbus_otg-supply optional property.
 - Specified otg_id and otg_bvalid property.

 .../bindings/phy/phy-rockchip-inno-usb2.txt        |   60 ++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
new file mode 100644
index 0000000..0b4bbbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
@@ -0,0 +1,60 @@
+ROCKCHIP USB2.0 PHY WITH INNO IP BLOCK
+
+Required properties (phy (parent) node):
+ - compatible : should be one of the listed compatibles:
+	* "rockchip,rk3366-usb2phy"
+	* "rockchip,rk3399-usb2phy"
+ - #clock-cells : should be 0.
+ - clock-output-names : specify the 480m output clock name.
+
+Optional properties:
+ - clocks : phandle + phy specifier pair, for the input clock of phy.
+ - clock-names : input clock name of phy, must be "phyclk".
+ - vbus_host-supply : phandle to a regulator that supplies host vbus.
+ - vbus_otg-supply : phandle to a regulator that supplies otg vbus.
+
+Required nodes : a sub-node is required for each port the phy provides.
+		 The sub-node name is used to identify host or otg port,
+		 and shall be the following entries:
+	* "otg-port" : the name of otg port.
+	* "host-port" : the name of host port.
+
+Required properties (port (child) node):
+ - #phy-cells : must be 0. See ./phy-bindings.txt for details.
+ - interrupts : specify an interrupt for each entry in interrupt-names.
+ - interrupt-names : a list which shall be the following entries:
+	* "otg_id" : for the otg id interrupt.
+	* "otg_bvalid" : for the otg vbus interrupt.
+	* "linestate" : for the host/otg linestate interrupt.
+
+Example:
+
+grf: syscon@ff770000 {
+	compatible = "rockchip,rk3366-grf", "syscon", "simple-mfd";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+...
+
+	u2phy: usb2-phy {
+		compatible = "rockchip,rk3366-usb2phy";
+		#clock-cells = <0>;
+		clock-output-names = "sclk_otgphy0_480m";
+
+		u2phy_otg: otg-port {
+			#phy-cells = <0>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "otg_id", "otg_bvalid", "linestate";
+			status = "okay";
+		};
+
+		u2phy_host: host-port {
+			#phy-cells = <0>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "linestate";
+			status = "okay";
+		};
+	};
+};
-- 
1.7.9.5
