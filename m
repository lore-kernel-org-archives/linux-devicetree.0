From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v8 10/17] phy: Add driver for rockchip Display Port PHY
Date: Thu, 12 Nov 2015 10:36:51 +0800
Message-ID: <5643FB43.6090408@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446021033-11537-1-git-send-email-ykk@rock-chips.com>
 <2368662.QeV0VQYq26@phil>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2092948236=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2368662.QeV0VQYq26@phil>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, el.org@NULL.NULL, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kern, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Kukjin Kim <kgene@kernel.org>, robherring2@gmail.com, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, dianders@chromium.org, Kyungmin Park <kyungmin.park@samsung.com>, Kumar Gala <galak@codeaurora.org>, ajaynumb@gmail.com, Andy
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============2092948236==
Content-Type: multipart/alternative;
 boundary="------------050606010006030709050609"

This is a multi-part message in MIME format.
--------------050606010006030709050609
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Heiko,

On 11/12/2015 07:23 AM, Heiko Stuebner wrote:
> Hi Yakir,
>
> Am Mittwoch, 28. Oktober 2015, 16:30:33 schrieb Yakir Yang:
>> Add phy driver for the Rockchip DisplayPort PHY module. This
>> is required to get DisplayPort working in Rockchip SoCs.
>>
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> a general thing I have been pondering, we should probably move the
> dp-phy under the GRF. Similar to the new power-domains being
> a full child of the PMU, the dp-phy is a full child-device of the GRF.
>
> That would include:
> - making the GRF a simply-mfd (just adding that property)
> - moving the dts node under it
> - making the driver get its regmap from its parent (just like
>    drivers/soc/rockchip/pm_domains.c does)
>
>
> The usbphy is another example of that, and I think I'll be moving it
> below the grf as well.

Sounds great, pretty cool to collect those scattered "GRF" driver,
if you want me do some rebase on your changes, please note me :)

- Yakir

>
> Heiko
>
>> ---
>> Changes in v8:
>> - Fix the mixed spacers on macro definitions. (Heiko)
>> - Remove the unnecessary empty line after clk_prepare_enable. (Heiko)
>>
>> Changes in v7:
>> - Simply the commit message. (Kishon)
>> - Symmetrical enable/disbale the phy clock and power. (Kishon)
>>
>> Changes in v6: None
>> Changes in v5:
>> - Remove "reg" DT property, cause driver could poweron/poweroff phy via
>>    the exist "grf" syscon already. And rename the example DT node from
>>    "edp_phy: phy@ff770274" to "edp_phy: edp-phy" directly. (Heiko)
>> - Add deivce_node at the front of driver, update phy_ops type from "static
>>    struct" to "static const struct". And correct the input paramters of
>>    devm_phy_create() interfaces. (Heiko)
>>
>> Changes in v4:
>> - Add commit message, and remove the redundant rockchip_dp_phy_init()
>>    function, move those code to probe() method. And remove driver .owner
>>    number. (Kishon)
>>
>> Changes in v3:
>> - Suggest, add rockchip dp phy driver, collect the phy clocks and
>>    power control. (Heiko)
>>
>> Changes in v2: None
>>
>>   drivers/phy/Kconfig           |   7 ++
>>   drivers/phy/Makefile          |   1 +
>>   drivers/phy/phy-rockchip-dp.c | 155 ++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 163 insertions(+)
>>   create mode 100644 drivers/phy/phy-rockchip-dp.c
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index 7eb5859d..7355819 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -319,6 +319,13 @@ config PHY_ROCKCHIP_USB
>>   	help
>>   	  Enable this to support the Rockchip USB 2.0 PHY.
>>   
>> +config PHY_ROCKCHIP_DP
>> +	tristate "Rockchip Display Port PHY Driver"
>> +	depends on ARCH_ROCKCHIP && OF
>> +	select GENERIC_PHY
>> +	help
>> +	  Enable this to support the Rockchip Display Port PHY.
>> +
>>   config PHY_ST_SPEAR1310_MIPHY
>>   	tristate "ST SPEAR1310-MIPHY driver"
>>   	select GENERIC_PHY
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index 075db1a..b1700cd 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -35,6 +35,7 @@ phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
>>   obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
>>   obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
>>   obj-$(CONFIG_PHY_ROCKCHIP_USB) += phy-rockchip-usb.o
>> +obj-$(CONFIG_PHY_ROCKCHIP_DP)		+= phy-rockchip-dp.o
>>   obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
>>   obj-$(CONFIG_PHY_ST_SPEAR1310_MIPHY)	+= phy-spear1310-miphy.o
>>   obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+= phy-spear1340-miphy.o
>> diff --git a/drivers/phy/phy-rockchip-dp.c b/drivers/phy/phy-rockchip-dp.c
>> new file mode 100644
>> index 0000000..c82c22f
>> --- /dev/null
>> +++ b/drivers/phy/phy-rockchip-dp.c
>> @@ -0,0 +1,155 @@
>> +/*
>> + * Rockchip DP PHY driver
>> + *
>> + * Copyright (C) 2015 FuZhou Rockchip Co., Ltd.
>> + * Author: Yakir Yang <ykk@@rock-chips.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License.
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/clk.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define GRF_SOC_CON12                           0x0274
>> +
>> +#define GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK   BIT(4)
>> +#define GRF_EDP_REF_CLK_SEL_INTER               BIT(4)
>> +
>> +#define GRF_EDP_PHY_SIDDQ_HIWORD_MASK           BIT(21)
>> +#define GRF_EDP_PHY_SIDDQ_ON                    0
>> +#define GRF_EDP_PHY_SIDDQ_OFF                   BIT(5)
>> +
>> +struct rockchip_dp_phy {
>> +	struct device  *dev;
>> +	struct regmap  *grf;
>> +	struct clk     *phy_24m;
>> +};
>> +
>> +static int rockchip_set_phy_state(struct phy *phy, bool enable)
>> +{
>> +	struct rockchip_dp_phy *dp = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	if (enable) {
>> +		ret = regmap_write(dp->grf, GRF_SOC_CON12,
>> +				   GRF_EDP_PHY_SIDDQ_HIWORD_MASK |
>> +				   GRF_EDP_PHY_SIDDQ_ON);
>> +		if (ret < 0) {
>> +			dev_err(dp->dev, "Can't enable PHY power %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		ret = clk_prepare_enable(dp->phy_24m);
>> +	} else {
>> +		clk_disable_unprepare(dp->phy_24m);
>> +
>> +		ret = regmap_write(dp->grf, GRF_SOC_CON12,
>> +				   GRF_EDP_PHY_SIDDQ_HIWORD_MASK |
>> +				   GRF_EDP_PHY_SIDDQ_OFF);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int rockchip_dp_phy_power_on(struct phy *phy)
>> +{
>> +	return rockchip_set_phy_state(phy, true);
>> +}
>> +
>> +static int rockchip_dp_phy_power_off(struct phy *phy)
>> +{
>> +	return rockchip_set_phy_state(phy, false);
>> +}
>> +
>> +static const struct phy_ops rockchip_dp_phy_ops = {
>> +	.power_on	= rockchip_dp_phy_power_on,
>> +	.power_off	= rockchip_dp_phy_power_off,
>> +	.owner		= THIS_MODULE,
>> +};
>> +
>> +static int rockchip_dp_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = dev->of_node;
>> +	struct phy_provider *phy_provider;
>> +	struct rockchip_dp_phy *dp;
>> +	struct resource *res;
>> +	struct phy *phy;
>> +	int ret;
>> +
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>> +	if (IS_ERR(dp))
>> +		return -ENOMEM;
>> +
>> +	dp->dev = dev;
>> +
>> +	dp->phy_24m = devm_clk_get(dev, "24m");
>> +	if (IS_ERR(dp->phy_24m)) {
>> +		dev_err(dev, "cannot get clock 24m\n");
>> +		return PTR_ERR(dp->phy_24m);
>> +	}
>> +
>> +	ret = clk_set_rate(dp->phy_24m, 24000000);
>> +	if (ret < 0) {
>> +		dev_err(dp->dev, "cannot set clock phy_24m %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
>> +	if (IS_ERR(dp->grf)) {
>> +		dev_err(dev, "rk3288-dp needs rockchip,grf property\n");
>> +		return PTR_ERR(dp->grf);
>> +	}
>> +
>> +	ret = regmap_write(dp->grf, GRF_SOC_CON12, GRF_EDP_REF_CLK_SEL_INTER |
>> +			   GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK);
>> +	if (ret != 0) {
>> +		dev_err(dp->dev, "Could not config GRF edp ref clk: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	phy = devm_phy_create(dev, np, &rockchip_dp_phy_ops);
>> +	if (IS_ERR(phy)) {
>> +		dev_err(dev, "failed to create phy\n");
>> +		return PTR_ERR(phy);
>> +	}
>> +	phy_set_drvdata(phy, dp);
>> +
>> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +
>> +	return PTR_ERR_OR_ZERO(phy_provider);
>> +}
>> +
>> +static const struct of_device_id rockchip_dp_phy_dt_ids[] = {
>> +	{ .compatible = "rockchip,rk3288-dp-phy" },
>> +	{}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, rockchip_dp_phy_dt_ids);
>> +
>> +static struct platform_driver rockchip_dp_phy_driver = {
>> +	.probe		= rockchip_dp_phy_probe,
>> +	.driver		= {
>> +		.name	= "rockchip-dp-phy",
>> +		.of_match_table = rockchip_dp_phy_dt_ids,
>> +	},
>> +};
>> +
>> +module_platform_driver(rockchip_dp_phy_driver);
>> +
>> +MODULE_AUTHOR("Yakir Yang <ykk@rock-chips.com>");
>> +MODULE_DESCRIPTION("Rockchip DP PHY driver");
>> +MODULE_LICENSE("GPL v2");
>>
>
>
>


--------------050606010006030709050609
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Heiko,<br>
    <br>
    <div class="moz-cite-prefix">On 11/12/2015 07:23 AM, Heiko Stuebner
      wrote:<br>
    </div>
    <blockquote cite="mid:2368662.QeV0VQYq26@phil" type="cite">
      <pre wrap="">Hi Yakir,

Am Mittwoch, 28. Oktober 2015, 16:30:33 schrieb Yakir Yang:
</pre>
      <blockquote type="cite">
        <pre wrap="">Add phy driver for the Rockchip DisplayPort PHY module. This
is required to get DisplayPort working in Rockchip SoCs.

Reviewed-by: Heiko Stuebner <a class="moz-txt-link-rfc2396E" href="mailto:heiko@sntech.de">&lt;heiko@sntech.de&gt;</a>
Signed-off-by: Yakir Yang <a class="moz-txt-link-rfc2396E" href="mailto:ykk@rock-chips.com">&lt;ykk@rock-chips.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="">
a general thing I have been pondering, we should probably move the
dp-phy under the GRF. Similar to the new power-domains being
a full child of the PMU, the dp-phy is a full child-device of the GRF.

That would include:
- making the GRF a simply-mfd (just adding that property)
- moving the dts node under it
- making the driver get its regmap from its parent (just like
  drivers/soc/rockchip/pm_domains.c does)


The usbphy is another example of that, and I think I'll be moving it
below the grf as well.
</pre>
    </blockquote>
    <br>
    Sounds great, pretty cool to collect those
    <meta http-equiv="content-type" content="text/html;
      charset=windows-1252">
    scattered "GRF" driver,<br>
    if you want me do some rebase on your changes, please note me :)<br>
    <br>
    - Yakir<br>
    <br>
    <blockquote cite="mid:2368662.QeV0VQYq26@phil" type="cite">
      <pre wrap="">

Heiko

</pre>
      <blockquote type="cite">
        <pre wrap="">---
Changes in v8:
- Fix the mixed spacers on macro definitions. (Heiko)
- Remove the unnecessary empty line after clk_prepare_enable. (Heiko)

Changes in v7:
- Simply the commit message. (Kishon)
- Symmetrical enable/disbale the phy clock and power. (Kishon)

Changes in v6: None
Changes in v5:
- Remove "reg" DT property, cause driver could poweron/poweroff phy via
  the exist "grf" syscon already. And rename the example DT node from
  "edp_phy: phy@ff770274" to "edp_phy: edp-phy" directly. (Heiko)
- Add deivce_node at the front of driver, update phy_ops type from "static
  struct" to "static const struct". And correct the input paramters of
  devm_phy_create() interfaces. (Heiko)

Changes in v4:
- Add commit message, and remove the redundant rockchip_dp_phy_init()
  function, move those code to probe() method. And remove driver .owner
  number. (Kishon)

Changes in v3:
- Suggest, add rockchip dp phy driver, collect the phy clocks and
  power control. (Heiko)

Changes in v2: None

 drivers/phy/Kconfig           |   7 ++
 drivers/phy/Makefile          |   1 +
 drivers/phy/phy-rockchip-dp.c | 155 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+)
 create mode 100644 drivers/phy/phy-rockchip-dp.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 7eb5859d..7355819 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -319,6 +319,13 @@ config PHY_ROCKCHIP_USB
 	help
 	  Enable this to support the Rockchip USB 2.0 PHY.
 
+config PHY_ROCKCHIP_DP
+	tristate "Rockchip Display Port PHY Driver"
+	depends on ARCH_ROCKCHIP &amp;&amp; OF
+	select GENERIC_PHY
+	help
+	  Enable this to support the Rockchip Display Port PHY.
+
 config PHY_ST_SPEAR1310_MIPHY
 	tristate "ST SPEAR1310-MIPHY driver"
 	select GENERIC_PHY
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 075db1a..b1700cd 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -35,6 +35,7 @@ phy-exynos-usb2-$(CONFIG_PHY_S5PV210_USB2)	+= phy-s5pv210-usb2.o
 obj-$(CONFIG_PHY_EXYNOS5_USBDRD)	+= phy-exynos5-usbdrd.o
 obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
 obj-$(CONFIG_PHY_ROCKCHIP_USB) += phy-rockchip-usb.o
+obj-$(CONFIG_PHY_ROCKCHIP_DP)		+= phy-rockchip-dp.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_ST_SPEAR1310_MIPHY)	+= phy-spear1310-miphy.o
 obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+= phy-spear1340-miphy.o
diff --git a/drivers/phy/phy-rockchip-dp.c b/drivers/phy/phy-rockchip-dp.c
new file mode 100644
index 0000000..c82c22f
--- /dev/null
+++ b/drivers/phy/phy-rockchip-dp.c
@@ -0,0 +1,155 @@
+/*
+ * Rockchip DP PHY driver
+ *
+ * Copyright (C) 2015 FuZhou Rockchip Co., Ltd.
+ * Author: Yakir Yang <a class="moz-txt-link-rfc2396E" href="mailto:ykk@@rock-chips.com">&lt;ykk@@rock-chips.com&gt;</a>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License.
+ */
+
+#include &lt;linux/io.h&gt;
+#include &lt;linux/kernel.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/of.h&gt;
+#include &lt;linux/of_address.h&gt;
+#include &lt;linux/clk.h&gt;
+#include &lt;linux/phy/phy.h&gt;
+#include &lt;linux/regmap.h&gt;
+#include &lt;linux/mfd/syscon.h&gt;
+#include &lt;linux/platform_device.h&gt;
+
+#define GRF_SOC_CON12                           0x0274
+
+#define GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK   BIT(4)
+#define GRF_EDP_REF_CLK_SEL_INTER               BIT(4)
+
+#define GRF_EDP_PHY_SIDDQ_HIWORD_MASK           BIT(21)
+#define GRF_EDP_PHY_SIDDQ_ON                    0
+#define GRF_EDP_PHY_SIDDQ_OFF                   BIT(5)
+
+struct rockchip_dp_phy {
+	struct device  *dev;
+	struct regmap  *grf;
+	struct clk     *phy_24m;
+};
+
+static int rockchip_set_phy_state(struct phy *phy, bool enable)
+{
+	struct rockchip_dp_phy *dp = phy_get_drvdata(phy);
+	int ret;
+
+	if (enable) {
+		ret = regmap_write(dp-&gt;grf, GRF_SOC_CON12,
+				   GRF_EDP_PHY_SIDDQ_HIWORD_MASK |
+				   GRF_EDP_PHY_SIDDQ_ON);
+		if (ret &lt; 0) {
+			dev_err(dp-&gt;dev, "Can't enable PHY power %d\n", ret);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(dp-&gt;phy_24m);
+	} else {
+		clk_disable_unprepare(dp-&gt;phy_24m);
+
+		ret = regmap_write(dp-&gt;grf, GRF_SOC_CON12,
+				   GRF_EDP_PHY_SIDDQ_HIWORD_MASK |
+				   GRF_EDP_PHY_SIDDQ_OFF);
+	}
+
+	return ret;
+}
+
+static int rockchip_dp_phy_power_on(struct phy *phy)
+{
+	return rockchip_set_phy_state(phy, true);
+}
+
+static int rockchip_dp_phy_power_off(struct phy *phy)
+{
+	return rockchip_set_phy_state(phy, false);
+}
+
+static const struct phy_ops rockchip_dp_phy_ops = {
+	.power_on	= rockchip_dp_phy_power_on,
+	.power_off	= rockchip_dp_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static int rockchip_dp_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &amp;pdev-&gt;dev;
+	struct device_node *np = dev-&gt;of_node;
+	struct phy_provider *phy_provider;
+	struct rockchip_dp_phy *dp;
+	struct resource *res;
+	struct phy *phy;
+	int ret;
+
+	if (!np)
+		return -ENODEV;
+
+	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
+	if (IS_ERR(dp))
+		return -ENOMEM;
+
+	dp-&gt;dev = dev;
+
+	dp-&gt;phy_24m = devm_clk_get(dev, "24m");
+	if (IS_ERR(dp-&gt;phy_24m)) {
+		dev_err(dev, "cannot get clock 24m\n");
+		return PTR_ERR(dp-&gt;phy_24m);
+	}
+
+	ret = clk_set_rate(dp-&gt;phy_24m, 24000000);
+	if (ret &lt; 0) {
+		dev_err(dp-&gt;dev, "cannot set clock phy_24m %d\n", ret);
+		return ret;
+	}
+
+	dp-&gt;grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
+	if (IS_ERR(dp-&gt;grf)) {
+		dev_err(dev, "rk3288-dp needs rockchip,grf property\n");
+		return PTR_ERR(dp-&gt;grf);
+	}
+
+	ret = regmap_write(dp-&gt;grf, GRF_SOC_CON12, GRF_EDP_REF_CLK_SEL_INTER |
+			   GRF_EDP_REF_CLK_SEL_INTER_HIWORD_MASK);
+	if (ret != 0) {
+		dev_err(dp-&gt;dev, "Could not config GRF edp ref clk: %d\n", ret);
+		return ret;
+	}
+
+	phy = devm_phy_create(dev, np, &amp;rockchip_dp_phy_ops);
+	if (IS_ERR(phy)) {
+		dev_err(dev, "failed to create phy\n");
+		return PTR_ERR(phy);
+	}
+	phy_set_drvdata(phy, dp);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id rockchip_dp_phy_dt_ids[] = {
+	{ .compatible = "rockchip,rk3288-dp-phy" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, rockchip_dp_phy_dt_ids);
+
+static struct platform_driver rockchip_dp_phy_driver = {
+	.probe		= rockchip_dp_phy_probe,
+	.driver		= {
+		.name	= "rockchip-dp-phy",
+		.of_match_table = rockchip_dp_phy_dt_ids,
+	},
+};
+
+module_platform_driver(rockchip_dp_phy_driver);
+
+MODULE_AUTHOR("Yakir Yang <a class="moz-txt-link-rfc2396E" href="mailto:ykk@rock-chips.com">&lt;ykk@rock-chips.com&gt;</a>");
+MODULE_DESCRIPTION("Rockchip DP PHY driver");
+MODULE_LICENSE("GPL v2");

</pre>
      </blockquote>
      <pre wrap="">



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------050606010006030709050609--


--===============2092948236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============2092948236==--
