From: Randy Li <ayaka@soulik.info>
Subject: [PATCH 2/4] phy: rockchip-usb: use rockchip_usb_phy_reset to reset phy during wakeup
Date: Thu,  8 Sep 2016 22:27:14 +0800
Message-ID: <1473344836-26707-3-git-send-email-ayaka@soulik.info>
References: <1473344836-26707-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473344836-26707-1-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: John.Youn@synopsys.com, kishon@ti.com, felipe.balbi@linux.intel.com, mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, randy.li@rock-chips.com, Randy Li <ayaka@soulik.info>
List-Id: devicetree@vger.kernel.org

It is a hardware bug in RK3288, the only way to solve it is to
reset the phy.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 .../devicetree/bindings/phy/rockchip-usb-phy.txt     |  3 +++
 drivers/phy/phy-rockchip-usb.c                       | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
index cc6be96..57dc388 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
@@ -27,6 +27,9 @@ Optional Properties:
 - clocks : phandle + clock specifier for the phy clocks
 - clock-names: string, clock name, must be "phyclk"
 - #clock-cells: for users of the phy-pll, should be 0
+- reset-names: Only allow the following entries:
+ - phy-reset
+- resets: Must contain an entry for each entry in reset-names.
 
 Example:
 
diff --git a/drivers/phy/phy-rockchip-usb.c b/drivers/phy/phy-rockchip-usb.c
index 2a7381f..734987f 100644
--- a/drivers/phy/phy-rockchip-usb.c
+++ b/drivers/phy/phy-rockchip-usb.c
@@ -29,6 +29,7 @@
 #include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
+#include <linux/delay.h>
 
 static int enable_usb_uart;
 
@@ -64,6 +65,7 @@ struct rockchip_usb_phy {
 	struct clk_hw	clk480m_hw;
 	struct phy	*phy;
 	bool		uart_enabled;
+	struct reset_control *reset;
 };
 
 static int rockchip_usb_phy_power(struct rockchip_usb_phy *phy,
@@ -144,9 +146,23 @@ static int rockchip_usb_phy_power_on(struct phy *_phy)
 	return clk_prepare_enable(phy->clk480m);
 }
 
+static int rockchip_usb_phy_reset(struct phy *_phy)
+{
+	struct rockchip_usb_phy *phy = phy_get_drvdata(_phy);
+
+	if (phy->reset) {
+		reset_control_assert(phy->reset);
+		udelay(10);
+		reset_control_deassert(phy->reset);
+	}
+
+	return 0;
+}
+
 static const struct phy_ops ops = {
 	.power_on	= rockchip_usb_phy_power_on,
 	.power_off	= rockchip_usb_phy_power_off,
+	.reset		= rockchip_usb_phy_reset,
 	.owner		= THIS_MODULE,
 };
 
@@ -185,6 +201,10 @@ static int rockchip_usb_phy_init(struct rockchip_usb_phy_base *base,
 		return -EINVAL;
 	}
 
+	rk_phy->reset = of_reset_control_get(child, "phy-reset");
+	if (IS_ERR(rk_phy->reset))
+		rk_phy->reset = NULL;
+
 	rk_phy->reg_offset = reg_offset;
 
 	rk_phy->clk = of_clk_get_by_name(child, "phyclk");
-- 
2.7.4
