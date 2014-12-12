From: Yunzhi Li <lyz@rock-chips.com>
Subject: [PATCH v7 1/5] Documentation: bindings: add dt documentation for Rockchip usb PHY
Date: Fri, 12 Dec 2014 23:00:09 +0800
Message-ID: <1418396413-27937-2-git-send-email-lyz@rock-chips.com>
References: <1418396413-27937-1-git-send-email-lyz@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418396413-27937-1-git-send-email-lyz@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, jwerner@chromium.org, dianders@chromium.org
Cc: olof@lixom.net, huangtao@rock-chips.com, zyw@rock-chips.com, cf@rock-chips.com, linux-rockchip@lists.infradead.org, Yunzhi Li <lyz@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds a binding that describes the Rockchip usb PHYs
found on Rockchip SoCs usb interface.

Signed-off-by: Yunzhi Li <lyz@rock-chips.com>

---

Changes in v7:
- Update bindings doc

Changes in v6: None
Changes in v5:
- Adjust entry order of example devicetree node in document.

Changes in v4:
- Updata description for phy device tree subnode.

Changes in v3: None

 .../devicetree/bindings/phy/rockchip-usb-phy.txt   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
new file mode 100644
index 0000000..826454a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
@@ -0,0 +1,37 @@
+ROCKCHIP USB2 PHY
+
+Required properties:
+ - compatible: rockchip,rk3288-usb-phy
+ - rockchip,grf : phandle to the syscon managing the "general
+   register files"
+ - #address-cells: should be 1
+ - #size-cells: should be 0
+
+Sub-nodes:
+Each PHY should be represented as a sub-node.
+
+Sub-nodes
+required properties:
+- #phy-cells: should be 0
+- reg: PHY configure reg address offset in GRF
+		"0x320" - for PHY attach to OTG controller
+		"0x334" - for PHY attach to HOST0 controller
+		"0x348" - for PHY attach to HOST1 controller
+
+Optional Properties:
+- clocks : phandle + clock specifier for the phy clocks
+- clock-names: string, clock name, must be "phyclk"
+
+Example:
+
+usbphy: phy {
+	compatible = "rockchip,rk3288-usb-phy";
+	rockchip,grf = <&grf>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	usbphy0: usb-phy0 {
+		#phy-cells = <0>;
+		reg = <0x320>;
+	};
+};
-- 
2.0.0
