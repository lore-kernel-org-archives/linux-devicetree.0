From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [PATCH v7 2/4] phy: rockchip-usb: use rockchip_usb_phy_reset to reset
 phy during wakeup
Date: Sun,  4 Sep 2016 05:55:27 +0800
Message-ID: <1472939729-15187-3-git-send-email-ayaka@soulik.info>
References: <1472939729-15187-1-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1472939729-15187-1-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>, randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

It is a hardware bug in RK3288, the only way to solve it is to
reset the phy.

Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
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
