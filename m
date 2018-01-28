From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 2/5] phy: amlogic: phy-meson-gxl-usb2: support the clock and reset line
Date: Sun, 28 Jan 2018 21:22:42 +0100
Message-ID: <20180128202245.25021-3-martin.blumenstingl@googlemail.com>
References: <20180128202245.25021-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180128202245.25021-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Meson GXL USB2 PHYs require an additional clock (USB) which has to
be enabled. If that clock is disabled then all PHY registers read 0x0.
Luckily for us that clock is always enabled (either by harddware
defaults, the bootrom, or any of the bootloaders before u-boot/BL3-3).

The OTG capable USB2 PHY additionally has a reset line (USB_OTG, which
is shared with other components, such as the USB3 PHY for example).

Extend the driver so it handles this clock and the shared reset line.
We only trigger the reset during the .init phase since it's a shared
reset line, so triggering it during the driver's .reset implementation
would effectively also only trigger it once anyways.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index e90c4ee25dfe..303b2b46af3c 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -11,11 +11,13 @@
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/of.h>
@@ -99,6 +101,8 @@ struct phy_meson_gxl_usb2_priv {
 	struct regmap		*regmap;
 	enum phy_mode		mode;
 	int			is_enabled;
+	struct clk		*clk;
+	struct reset_control	*reset;
 };
 
 static const struct regmap_config phy_meson_gxl_usb2_regmap_conf = {
@@ -108,6 +112,31 @@ static const struct regmap_config phy_meson_gxl_usb2_regmap_conf = {
 	.max_register = U2P_R3,
 };
 
+static int phy_meson_gxl_usb2_init(struct phy *phy)
+{
+	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = reset_control_reset(priv->reset);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int phy_meson_gxl_usb2_exit(struct phy *phy)
+{
+	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(priv->clk);
+
+	return 0;
+}
+
 static int phy_meson_gxl_usb2_reset(struct phy *phy)
 {
 	struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
@@ -195,6 +224,8 @@ static int phy_meson_gxl_usb2_power_on(struct phy *phy)
 }
 
 static const struct phy_ops phy_meson_gxl_usb2_ops = {
+	.init		= phy_meson_gxl_usb2_init,
+	.exit		= phy_meson_gxl_usb2_exit,
 	.power_on	= phy_meson_gxl_usb2_power_on,
 	.power_off	= phy_meson_gxl_usb2_power_off,
 	.set_mode	= phy_meson_gxl_usb2_set_mode,
@@ -240,6 +271,19 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
+	priv->clk = devm_clk_get(dev, "phy");
+	if (IS_ERR(priv->clk)) {
+		ret = PTR_ERR(priv->clk);
+		if (ret == -ENOENT)
+			priv->clk = NULL;
+		else
+			return ret;
+	}
+
+	priv->reset = devm_reset_control_get_optional_shared(dev, "phy");
+	if (IS_ERR(priv->reset))
+		return PTR_ERR(priv->reset);
+
 	phy = devm_phy_create(dev, NULL, &phy_meson_gxl_usb2_ops);
 	if (IS_ERR(phy)) {
 		dev_err(dev, "failed to create PHY\n");
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
