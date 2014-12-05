From: Yunzhi Li <lyz@rock-chips.com>
Subject: [PATCH v2 2/5] Documentation: bindings: add doc for the Rockchip usb PHY
Date: Fri,  5 Dec 2014 20:52:18 +0800
Message-ID: <1417783941-2418-3-git-send-email-lyz@rock-chips.com>
References: <1417783941-2418-1-git-send-email-lyz@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417783941-2418-1-git-send-email-lyz@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, dianders@chromium.org
Cc: olof@lixom.net, huangtao@rock-chips.com, ulrich.prinz@googlemail.com, zyw@rock-chips.com, cf@rock-chips.com, linux-rockchip@lists.infradead.org, Yunzhi Li <lyz@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the bindings of the Rockchip usb PHY driver.

Signed-off-by: Yunzhi Li <lyz@rock-chips.com>
---

 .../devicetree/bindings/phy/rockchip-usb-phy.txt   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
new file mode 100644
index 0000000..4574696
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
@@ -0,0 +1,22 @@
+ROCKCHIP USB2 PHY
+
+Required properties:
+ - compatible: rockchip,rk3288-usb-phy
+ - rockchip,grf : phandle to the syscon managing the "general
+   register files"
+ - #phy-cells: must be 1
+
+Optional Properties:
+ - clocks : phandle + clock specifier for the phy clocks
+ - clock-names :
+		"usbphy0" - PHY clock for OTG controller
+		"usbphy1" - PHY clock for HOST0 controller
+		"usbphy2" - PHY clock for HOST1 controller
+
+Example:
+
+usbphy: phy {
+	#phy-cells = <1>;
+	compatible = "rockchip,rk3288-usb-phy";
+	rockchip,grf = <&grf>;
+};
-- 
2.0.0
