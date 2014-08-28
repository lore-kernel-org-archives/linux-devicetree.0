From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/2] soc/rockchip: io-domain: add driver handling io domains
Date: Thu, 28 Aug 2014 12:19:21 -0700
Message-ID: <1409253562-8907-3-git-send-email-dianders@chromium.org>
References: <1409253562-8907-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409253562-8907-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, santosh.shilimkar-l0cyMroinI0@public.gmane.org, sandeep_n-l0cyMroinI0@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=46rom: Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

IO domain voltages on some Rockchip SoCs are variable but need to be
kept in sync between the regulators and a special register.

Signed-off-by: Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 .../devicetree/bindings/arm/rockchip/io-domain.txt |  60 ++++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/rockchip/Kconfig                       |  10 +
 drivers/soc/rockchip/Makefile                      |   1 +
 drivers/soc/rockchip/io-domain.c                   | 333 +++++++++++++=
++++++++
 6 files changed, 406 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/io-d=
omain.txt
 create mode 100644 drivers/soc/rockchip/Kconfig
 create mode 100644 drivers/soc/rockchip/Makefile
 create mode 100644 drivers/soc/rockchip/io-domain.c

diff --git a/Documentation/devicetree/bindings/arm/rockchip/io-domain.t=
xt b/Documentation/devicetree/bindings/arm/rockchip/io-domain.txt
new file mode 100644
index 0000000..20b4965
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/rockchip/io-domain.txt
@@ -0,0 +1,60 @@
+Rockchip SRAM for IO Voltage Domains:
+-------------------------------------
+
+IO domain voltages on some Rockchip SoCs are variable but need to be
+kept in sync between the regulators and a special register.
+
+We can specify which regulator is associated with which IO Voltage
+Domain and then we can automatically adjust the register to match
+what's actually being provided on the rails.
+
+Required properties:
+- compatible: should be one of:
+  - "rockchip,rk3188-iodomain" for rk3188
+  - "rockchip,rk3288-iodomain" for rk3288
+
+You specify supplies using the standard regulator bindings by includin=
g
+a phandle the the relevant regulator.  All specified supplies must be =
able
+to report their voltage.  The IO Voltage Domain for any non-specified
+supplies will be not be touched.
+
+Possible supplies for rk3188:
+- ap0-supply:    The supply connected to AP0_VCC.
+- ap1-supply:    The supply connected to AP1_VCC.
+- cif-supply:    The supply connected to CIF_VCC.
+- flash-supply:  The supply connected to FLASH_VCC.
+- lcdc0-supply:  The supply connected to LCD0_VCC.
+- lcdc1-supply:  The supply connected to LCD1_VCC.
+- vccio0-supply: The supply connected to VCCIO0.
+- vccio1-supply: The supply connected to VCCIO1.
+                 Sometimes also labeled VCCIO1 and VCCIO2.
+
+Possible supplies for rk3288:
+- audio-supply:  The supply connected to APIO4_VDD.
+- bb-supply:     The supply connected to APIO5_VDD.
+- dvp-supply:    The supply connected to DVPIO_VDD.
+- flash0-supply: The supply connected to FLASH0_VDD.  Typically for eM=
MC
+- flash1-supply: The supply connected to FLASH1_VDD.  Also known as SD=
IO1.
+- gpio30-supply: The supply connected to APIO1_VDD.
+- gpio1830       The supply connected to APIO2_VDD.
+- lcdc-supply:   The supply connected to LCDC_VDD.
+- sdcard-supply: The supply connected to SDMMC0_VDD.
+- wifi-supply:   The supply connected to APIO3_VDD.  Also known as SDI=
O0.
+
+
+Example:
+
+	io-domains {
+		compatible =3D "rockchip,rk3288-iodomain";
+		rockchip,grf =3D <&grf>;
+
+		audio-supply =3D <&vcc18_codec>;
+		bb-supply =3D <&vcc33_io>;
+		dvp-supply =3D <&vcc_18>;
+		flash0-supply =3D <&vcc18_flashio>;
+		gpio1830-supply =3D <&vcc33_io>;
+		gpio30-supply =3D <&vcc33_pmuio>;
+		lcdc-supply =3D <&vcc33_lcd>;
+		sdcard-supply =3D <&vccio_sd>;
+		wifi-supply =3D <&vcc18_wl>;
+	};
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index c854385..443d946 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -1,5 +1,6 @@
 menu "SOC (System On Chip) specific Drivers"
=20
 source "drivers/soc/qcom/Kconfig"
+source "drivers/soc/rockchip/Kconfig"
=20
 endmenu
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 3b1b95d..52808bf 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -3,4 +3,5 @@
 #
=20
 obj-$(CONFIG_ARCH_QCOM)		+=3D qcom/
+obj-$(CONFIG_ARCH_ROCKCHIP)	+=3D rockchip/
 obj-$(CONFIG_ARCH_TEGRA)	+=3D tegra/
diff --git a/drivers/soc/rockchip/Kconfig b/drivers/soc/rockchip/Kconfi=
g
new file mode 100644
index 0000000..d25cb53
--- /dev/null
+++ b/drivers/soc/rockchip/Kconfig
@@ -0,0 +1,10 @@
+#
+# Rockchip Soc drivers
+#
+config ROCKCHIP_IODOMAIN
+        tristate "Rockchip IO domain support"
+        depends on ARCH_ROCKCHIP && OF
+        help
+          Say y here to enable support io domains on Rockchip SoCs. It=
 is
+          necessary for the io domain setting of the SoC to match the
+          voltage supplied by the regulators.
diff --git a/drivers/soc/rockchip/Makefile b/drivers/soc/rockchip/Makef=
ile
new file mode 100644
index 0000000..dbf6da9
--- /dev/null
+++ b/drivers/soc/rockchip/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_ROCKCHIP_IODOMAIN)	+=3D	io-domain.o
diff --git a/drivers/soc/rockchip/io-domain.c b/drivers/soc/rockchip/io=
-domain.c
new file mode 100644
index 0000000..f4e0ebc
--- /dev/null
+++ b/drivers/soc/rockchip/io-domain.c
@@ -0,0 +1,333 @@
+/*
+ * Rockchip IO Voltage Domain driver
+ *
+ * Copyright 2014 MundoReader S.L.
+ * Copyright 2014 Google, Inc.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, an=
d
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#define MAX_SUPPLIES		16
+
+#define MAX_VOLTAGE_1_8		1980000
+#define MAX_VOLTAGE_3_3		3600000
+
+struct rockchip_iodomain;
+
+/**
+ * @supplies: voltage settings matching the register bits.
+ */
+struct rockchip_iodomain_soc_data {
+	int grf_offset;
+	const char *supply_names[MAX_SUPPLIES];
+	void (*init)(struct rockchip_iodomain *iod);
+};
+
+struct rockchip_iodomain_supply {
+	struct rockchip_iodomain *iod;
+	struct regulator *reg;
+	struct notifier_block nb;
+	int idx;
+};
+
+struct rockchip_iodomain {
+	struct device *dev;
+	struct regmap *grf;
+	struct rockchip_iodomain_soc_data *soc_data;
+	struct rockchip_iodomain_supply supplies[MAX_SUPPLIES];
+};
+
+static int rockchip_iodomain_write(struct rockchip_iodomain_supply *su=
pply,
+				   int uV)
+{
+	struct rockchip_iodomain *iod =3D supply->iod;
+	u32 val;
+	int ret;
+
+	/* set value bit */
+	val =3D (uV > MAX_VOLTAGE_1_8) ? 0 : 1;
+	val <<=3D supply->idx;
+
+	/* apply hiword-mask */
+	val |=3D (BIT(supply->idx) << 16);
+
+	ret =3D regmap_write(iod->grf, iod->soc_data->grf_offset, val);
+	if (ret)
+		dev_err(iod->dev, "Couldn't write to GRF\n");
+
+	return ret;
+}
+
+static int rockchip_iodomain_notify(struct notifier_block *nb,
+				    unsigned long event,
+				    void *data)
+{
+	struct rockchip_iodomain_supply *supply =3D
+			container_of(nb, struct rockchip_iodomain_supply, nb);
+	int uV;
+	int ret;
+
+	/*
+	 * According to Rockchip it's important to keep the SoC IO domain
+	 * higher than (or equal to) the external voltage.  That means we nee=
d
+	 * to change it before external voltage changes happen in the case
+	 * of an increase.
+	 */
+	if (event & REGULATOR_EVENT_PRE_VOLTAGE_CHANGE) {
+		struct pre_voltage_change_data *pvc_data =3D data;
+
+		uV =3D max_t(unsigned long, pvc_data->old_uV, pvc_data->max_uV);
+	} else if (event & (REGULATOR_EVENT_VOLTAGE_CHANGE |
+			    REGULATOR_EVENT_ABORT_VOLTAGE_CHANGE)) {
+		uV =3D (unsigned long)data;
+	} else {
+		return NOTIFY_OK;
+	}
+
+	dev_dbg(supply->iod->dev, "Setting to %d\n", uV);
+
+	if (uV > MAX_VOLTAGE_3_3) {
+		dev_err(supply->iod->dev, "Voltage too high: %d\n", uV);
+
+		if (event =3D=3D REGULATOR_EVENT_PRE_VOLTAGE_CHANGE)
+			return NOTIFY_BAD;
+	}
+
+	ret =3D rockchip_iodomain_write(supply, uV);
+	if (ret && event =3D=3D REGULATOR_EVENT_PRE_VOLTAGE_CHANGE)
+		return NOTIFY_BAD;
+
+	dev_info(supply->iod->dev, "Setting to %d done\n", uV);
+	return NOTIFY_OK;
+}
+
+#define RK3288_SOC_CON2			0x24c
+#define RK3288_SOC_CON2_FLASH0		BIT(7)
+#define RK3288_SOC_FLASH_SUPPLY_NUM	2
+
+static void rk3288_iodomain_init(struct rockchip_iodomain *iod)
+{
+	int ret;
+	u32 val;
+
+	/* if no flash supply we should leave things alone */
+	if (!iod->supplies[RK3288_SOC_FLASH_SUPPLY_NUM].reg)
+		return;
+
+	/*
+	 * set flash0 iodomain to also use this framework
+	 * instead of a special gpio.
+	 */
+	val =3D RK3288_SOC_CON2_FLASH0 | (RK3288_SOC_CON2_FLASH0 << 16);
+	ret =3D regmap_write(iod->grf, RK3288_SOC_CON2, val);
+	if (ret < 0)
+		dev_warn(iod->dev, "couldn't update flash0 ctrl\n");
+}
+
+/*
+ * On the rk3188 the io-domains are handled by a shared register with =
the
+ * lower 8 bits being still being continuing drive-strength settings.
+ */
+static const struct rockchip_iodomain_soc_data soc_data_rk3188 =3D {
+	.grf_offset =3D 0x104,
+	.supply_names =3D {
+		NULL,
+		NULL,
+		NULL,
+		NULL,
+		NULL,
+		NULL,
+		NULL,
+		NULL,
+		"ap0",
+		"ap1",
+		"cif",
+		"flash",
+		"vccio0",
+		"vccio1",
+		"lcdc0",
+		"lcdc1",
+	},
+};
+
+static const struct rockchip_iodomain_soc_data soc_data_rk3288 =3D {
+	.grf_offset =3D 0x380,
+	.supply_names =3D {
+		"lcdc",		/* LCDC_VDD */
+		"dvp",		/* DVPIO_VDD */
+		"flash0",	/* FLASH0_VDD (emmc) */
+		"flash1",	/* FLASH1_VDD (sdio1) */
+		"wifi",		/* APIO3_VDD  (sdio0) */
+		"bb",		/* APIO5_VDD */
+		"audio",	/* APIO4_VDD */
+		"sdcard",	/* SDMMC0_VDD (sdmmc) */
+		"gpio30",	/* APIO1_VDD */
+		"gpio1830",	/* APIO2_VDD */
+	},
+	.init =3D rk3288_iodomain_init,
+};
+
+static const struct of_device_id rockchip_iodomain_match[] =3D {
+	{
+		.compatible =3D "rockchip,rk3188-iodomain",
+		.data =3D (void *)&soc_data_rk3188
+	},
+	{
+		.compatible =3D "rockchip,rk3288-iodomain",
+		.data =3D (void *)&soc_data_rk3288
+	},
+	{ /* sentinel */ },
+};
+
+static int rockchip_iodomain_probe(struct platform_device *pdev)
+{
+	struct device_node *np =3D pdev->dev.of_node;
+	const struct of_device_id *match;
+	struct rockchip_iodomain *iod;
+	int i, ret;
+
+	if (!np)
+		return -ENODEV;
+
+	iod =3D devm_kzalloc(&pdev->dev, sizeof(*iod), GFP_KERNEL);
+	if (!iod)
+		return -ENOMEM;
+
+	iod->dev =3D &pdev->dev;
+	platform_set_drvdata(pdev, iod);
+
+	match =3D of_match_node(rockchip_iodomain_match, np);
+	iod->soc_data =3D (struct rockchip_iodomain_soc_data *)match->data;
+
+	iod->grf =3D syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
+	if (IS_ERR(iod->grf)) {
+		dev_err(&pdev->dev, "couldn't find grf regmap\n");
+		return PTR_ERR(iod->grf);
+	}
+
+	for (i =3D 0; i < MAX_SUPPLIES; i++) {
+		const char *supply_name =3D iod->soc_data->supply_names[i];
+		struct rockchip_iodomain_supply *supply =3D &iod->supplies[i];
+		struct regulator *reg;
+		int uV;
+
+		if (!supply_name)
+			continue;
+
+		reg =3D devm_regulator_get_optional(iod->dev, supply_name);
+		if (IS_ERR(reg)) {
+			ret =3D PTR_ERR(reg);
+
+			/* If a supply wasn't specified, that's OK */
+			if (ret =3D=3D -ENODEV)
+				continue;
+			else if (ret !=3D -EPROBE_DEFER)
+				dev_err(iod->dev, "couldn't get regulator %s\n",
+					supply_name);
+			goto unreg_notify;
+		}
+
+		/* set initial correct value */
+		uV =3D regulator_get_voltage(reg);
+
+		/* must be a regulator we can get the voltage of */
+		if (uV < 0) {
+			dev_err(iod->dev, "Can't determine voltage: %s\n",
+				supply_name);
+			goto unreg_notify;
+		}
+
+		if (uV > MAX_VOLTAGE_3_3) {
+			dev_crit(iod->dev,
+				 "%d uV is too high. May damage SoC!\n",
+				 uV);
+			ret =3D -EINVAL;
+			goto unreg_notify;
+		}
+
+		/* setup our supply */
+		supply->idx =3D i;
+		supply->iod =3D iod;
+		supply->reg =3D reg;
+		supply->nb.notifier_call =3D rockchip_iodomain_notify;
+
+		ret =3D rockchip_iodomain_write(supply, uV);
+		if (ret) {
+			supply->reg =3D NULL;
+			goto unreg_notify;
+		}
+
+		/* register regulator notifier */
+		ret =3D regulator_register_notifier(reg, &supply->nb);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"regulator notifier request failed\n");
+			supply->reg =3D NULL;
+			goto unreg_notify;
+		}
+	}
+
+	if (iod->soc_data->init)
+		iod->soc_data->init(iod);
+
+	return 0;
+
+unreg_notify:
+	for (i =3D MAX_SUPPLIES - 1; i >=3D 0; i--) {
+		struct rockchip_iodomain_supply *io_supply =3D &iod->supplies[i];
+
+		if (io_supply->reg)
+			regulator_unregister_notifier(io_supply->reg,
+						      &io_supply->nb);
+	}
+
+	return ret;
+}
+
+static int rockchip_iodomain_remove(struct platform_device *pdev)
+{
+	struct rockchip_iodomain *iod =3D platform_get_drvdata(pdev);
+	int i;
+
+	for (i =3D MAX_SUPPLIES - 1; i >=3D 0; i--) {
+		struct rockchip_iodomain_supply *io_supply =3D &iod->supplies[i];
+
+		if (io_supply->reg)
+			regulator_unregister_notifier(io_supply->reg,
+						      &io_supply->nb);
+	}
+
+	return 0;
+}
+
+static struct platform_driver rockchip_iodomain_driver =3D {
+	.probe   =3D rockchip_iodomain_probe,
+	.remove  =3D rockchip_iodomain_remove,
+	.driver  =3D {
+		.name  =3D "rockchip-iodomain",
+		.of_match_table =3D rockchip_iodomain_match,
+	},
+};
+
+module_platform_driver(rockchip_iodomain_driver);
+
+MODULE_DESCRIPTION("Rockchip IO-domain driver");
+MODULE_AUTHOR("Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>");
+MODULE_AUTHOR("Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>");
+MODULE_LICENSE("GPL v2");
--=20
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
