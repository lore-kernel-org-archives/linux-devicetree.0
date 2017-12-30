From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: [PATCH 2/3] mfd: axp20x: Add support for backup battery charging
Date: Sat, 30 Dec 2017 16:23:29 +0100
Message-ID: <20171230152330.28946-3-contact@paulk.fr>
References: <20171230152330.28946-1-contact@paulk.fr>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC75HK6WUAEBBM67T3JAKGQEG3U6QEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171230152330.28946-1-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support for backup battery charging for axp20x PMICs, that is
configured through a dedicated device-tree property.

It supports 4 different charging voltages and as many charging currents.
This is especially useful to allow the on-chip RTC (on the SoC side) to
be powered when the rest of the system is off.

Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 2468b431bb22..7847f5d0b979 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -34,6 +34,16 @@
 #define AXP806_REG_ADDR_EXT_ADDR_MASTER_MODE	0
 #define AXP806_REG_ADDR_EXT_ADDR_SLAVE_MODE	BIT(4)
 
+#define AXP20X_CHRG_BAK_CTRL_ENABLE		BIT(7)
+#define AXP20X_CHRG_BAK_VOLTAGE_3100_MV		(0 << 5)
+#define AXP20X_CHRG_BAK_VOLTAGE_3000_MV		(1 << 5)
+#define AXP20X_CHRG_BAK_VOLTAGE_3600_MV		(2 << 5)
+#define AXP20X_CHRG_BAK_VOLTAGE_2500_MV		(3 << 5)
+#define AXP20X_CHRG_BAK_CURRENT_50_UA		(0 << 0)
+#define AXP20X_CHRG_BAK_CURRENT_100_UA		(1 << 0)
+#define AXP20X_CHRG_BAK_CURRENT_200_UA		(2 << 0)
+#define AXP20X_CHRG_BAK_CURRENT_400_UA		(3 << 0)
+
 static const char * const axp20x_model_names[] = {
 	"AXP152",
 	"AXP202",
@@ -894,6 +904,63 @@ static void axp20x_power_off(void)
 	msleep(500);
 }
 
+static void axp20x_backup_setup(struct axp20x_dev *axp20x)
+{
+	u32 backup[2];
+	int reg;
+	int ret;
+
+	ret = of_property_read_u32_array(axp20x->dev->of_node, "backup", backup,
+					 2);
+	if (ret != 0)
+		return;
+
+	switch (axp20x->variant) {
+	case AXP202_ID:
+	case AXP209_ID:
+		reg = AXP20X_CHRG_BAK_CTRL_ENABLE;
+
+		/* Charging voltage. */
+		switch (backup[0]) {
+		case 2500:
+			reg |= AXP20X_CHRG_BAK_VOLTAGE_2500_MV;
+			break;
+		case 3000:
+			reg |= AXP20X_CHRG_BAK_VOLTAGE_3000_MV;
+			break;
+		case 3100:
+			reg |= AXP20X_CHRG_BAK_VOLTAGE_3100_MV;
+			break;
+		case 3600:
+			reg |= AXP20X_CHRG_BAK_VOLTAGE_3600_MV;
+			break;
+		default:
+			return;
+		}
+
+		/* Charging current. */
+		switch (backup[1]) {
+		case 50:
+			reg |= AXP20X_CHRG_BAK_CURRENT_50_UA;
+			break;
+		case 100:
+			reg |= AXP20X_CHRG_BAK_CURRENT_100_UA;
+			break;
+		case 200:
+			reg |= AXP20X_CHRG_BAK_CURRENT_200_UA;
+			break;
+		case 400:
+			reg |= AXP20X_CHRG_BAK_CURRENT_400_UA;
+			break;
+		default:
+			return;
+		}
+
+		regmap_write(axp20x->regmap, AXP20X_CHRG_BAK_CTRL, reg);
+		break;
+	}
+}
+
 int axp20x_match_device(struct axp20x_dev *axp20x)
 {
 	struct device *dev = axp20x->dev;
@@ -1023,6 +1090,9 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
 				     AXP806_REG_ADDR_EXT_ADDR_SLAVE_MODE);
 	}
 
+	/* Backup RTC battery. */
+	axp20x_backup_setup(axp20x);
+
 	ret = regmap_add_irq_chip(axp20x->regmap, axp20x->irq,
 			  IRQF_ONESHOT | IRQF_SHARED | axp20x->irq_flags,
 			   -1, axp20x->regmap_irq_chip, &axp20x->regmap_irqc);
-- 
2.15.1
