Return-Path: <SRS0=GrzW=YU=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1483694164-7668-4-git-send-email-baoyou.xie@linaro.org>
References: <1483694164-7668-1-git-send-email-baoyou.xie@linaro.org> <1483694164-7668-4-git-send-email-baoyou.xie@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Fri, 6 Jan 2017 17:20:17 +0800
Message-ID: <CA+DQWkyC4fcH_pJyx6KNzhU6xJ=_KyGJ5rMViqfLLZgrwxpj+A@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] soc: zte: pm_domains: Prepare for supporting ARMv8
 zx2967 family
Content-Type: multipart/alternative; boundary=001a113f7318b717300545698692
To: Jun Nie <jun.nie@linaro.org>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Greg KH <gregkh@linuxfoundation.org>, davem@davemloft.net, geert+renesas@glider.be, akpm@linux-foundation.org, mchehab@kernel.org, krzk@kernel.org, Arnd Bergmann <arnd@arndb.de>, claudiu.manoil@nxp.com, amit daniel <amitdanielk@gmail.com>, pankaj.dubey@samsung.com, yangbo.lu@nxp.com, scott.branden@broadcom.com, simon.horman@netronome.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baoyou Xie <baoyou.xie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a113f7318b717300545698692
Content-Type: text/plain; charset=UTF-8

+ Shawn

On 6 January 2017 at 17:16, Baoyou Xie <baoyou.xie@linaro.org> wrote:

> The ARMv8 zx2967 family (296718, 296716 etc) uses different value
> for controlling the power domain on/off registers, Choose the
> value depending on the compatible.
>
> Multiple domains are prepared for the family, this patch prepares
> the common functions.
>
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---
>  drivers/soc/Kconfig                 |   1 +
>  drivers/soc/Makefile                |   1 +
>  drivers/soc/zte/Kconfig             |  13 ++++
>  drivers/soc/zte/Makefile            |   4 +
>  drivers/soc/zte/zx2967_pm_domains.c | 143 ++++++++++++++++++++++++++++++
> ++++++
>  drivers/soc/zte/zx2967_pm_domains.h |  44 +++++++++++
>  6 files changed, 206 insertions(+)
>  create mode 100644 drivers/soc/zte/Kconfig
>  create mode 100644 drivers/soc/zte/Makefile
>  create mode 100644 drivers/soc/zte/zx2967_pm_domains.c
>  create mode 100644 drivers/soc/zte/zx2967_pm_domains.h
>
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index f31bceb..f09023f 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -11,5 +11,6 @@ source "drivers/soc/tegra/Kconfig"
>  source "drivers/soc/ti/Kconfig"
>  source "drivers/soc/ux500/Kconfig"
>  source "drivers/soc/versatile/Kconfig"
> +source "drivers/soc/zte/Kconfig"
>
>  endmenu
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 50c23d0..05eae52 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -16,3 +16,4 @@ obj-$(CONFIG_ARCH_TEGRA)      += tegra/
>  obj-$(CONFIG_SOC_TI)           += ti/
>  obj-$(CONFIG_ARCH_U8500)       += ux500/
>  obj-$(CONFIG_PLAT_VERSATILE)   += versatile/
> +obj-$(CONFIG_ARCH_ZX)          += zte/
> diff --git a/drivers/soc/zte/Kconfig b/drivers/soc/zte/Kconfig
> new file mode 100644
> index 0000000..20bde38
> --- /dev/null
> +++ b/drivers/soc/zte/Kconfig
> @@ -0,0 +1,13 @@
> +#
> +# ZTE SoC drivers
> +#
> +menuconfig SOC_ZTE
> +       bool "ZTE SoC driver support"
> +
> +if SOC_ZTE
> +
> +config ZX2967_PM_DOMAINS
> +       bool "ZX2967 PM domains"
> +       depends on PM_GENERIC_DOMAINS
> +
> +endif
> diff --git a/drivers/soc/zte/Makefile b/drivers/soc/zte/Makefile
> new file mode 100644
> index 0000000..8a37f2f
> --- /dev/null
> +++ b/drivers/soc/zte/Makefile
> @@ -0,0 +1,4 @@
> +#
> +# ZTE SOC drivers
> +#
> +obj-$(CONFIG_ZX2967_PM_DOMAINS) += zx2967_pm_domains.o
> diff --git a/drivers/soc/zte/zx2967_pm_domains.c
> b/drivers/soc/zte/zx2967_pm_domains.c
> new file mode 100644
> index 0000000..61c8d84
> --- /dev/null
> +++ b/drivers/soc/zte/zx2967_pm_domains.c
> @@ -0,0 +1,143 @@
> +/*
> + * Copyright (C) 2017 ZTE Ltd.
> + *
> + * Author: Baoyou Xie <baoyou.xie@linaro.org>
> + * License terms: GNU General Public License (GPL) version 2
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +
> +#include "zx2967_pm_domains.h"
> +
> +#define PCU_DM_CLKEN(zpd)      ((zpd)->reg_offset[REG_CLKEN])
> +#define PCU_DM_ISOEN(zpd)      ((zpd)->reg_offset[REG_ISOEN])
> +#define PCU_DM_RSTEN(zpd)      ((zpd)->reg_offset[REG_RSTEN])
> +#define PCU_DM_PWREN(zpd)      ((zpd)->reg_offset[REG_PWREN])
> +#define PCU_DM_ACK_SYNC(zpd)   ((zpd)->reg_offset[REG_ACK_SYNC])
> +
> +static void __iomem *pcubase;
> +
> +static int zx2967_power_on(struct generic_pm_domain *domain)
> +{
> +       struct zx2967_pm_domain *zpd = (struct zx2967_pm_domain *)domain;
> +       unsigned long loop = 1000;
> +       u32 val;
> +
> +       val = readl_relaxed(pcubase + PCU_DM_PWREN(zpd));
> +       if (zpd->polarity == PWREN)
> +               val |= BIT(zpd->bit);
> +       else
> +               val &= ~BIT(zpd->bit);
> +       writel_relaxed(val, pcubase + PCU_DM_PWREN(zpd));
> +
> +       do {
> +               udelay(1);
> +               val = readl_relaxed(pcubase + PCU_DM_ACK_SYNC(zpd))
> +                                  & BIT(zpd->bit);
> +       } while (--loop && !val);
> +
> +       if (!loop) {
> +               pr_err("Error: %s %s fail\n", __func__, domain->name);
> +               return -EIO;
> +       }
> +
> +       val = readl_relaxed(pcubase + PCU_DM_RSTEN(zpd));
> +       val |= BIT(zpd->bit);
> +       writel_relaxed(val, pcubase + PCU_DM_RSTEN(zpd));
> +       udelay(5);
> +
> +       val = readl_relaxed(pcubase + PCU_DM_ISOEN(zpd));
> +       val &= ~BIT(zpd->bit);
> +       writel_relaxed(val, pcubase + PCU_DM_ISOEN(zpd));
> +       udelay(5);
> +
> +       val = readl_relaxed(pcubase + PCU_DM_CLKEN(zpd));
> +       val |= BIT(zpd->bit);
> +       writel_relaxed(val, pcubase + PCU_DM_CLKEN(zpd));
> +       udelay(5);
> +
> +       pr_debug("poweron %s\n", domain->name);
> +
> +       return 0;
> +}
> +
> +static int zx2967_power_off(struct generic_pm_domain *domain)
> +{
> +       struct zx2967_pm_domain *zpd = (struct zx2967_pm_domain *)domain;
> +       unsigned long loop = 1000;
> +       u32 val;
> +
> +       val = readl_relaxed(pcubase + PCU_DM_CLKEN(zpd));
> +       val &= ~BIT(zpd->bit);
> +       writel_relaxed(val, pcubase + PCU_DM_CLKEN(zpd));
> +       udelay(5);
> +
> +       val = readl_relaxed(pcubase + PCU_DM_ISOEN(zpd));
> +       val |= BIT(zpd->bit);
> +       writel_relaxed(val, pcubase + PCU_DM_ISOEN(zpd));
> +       udelay(5);
> +
> +       val = readl_relaxed(pcubase + PCU_DM_RSTEN(zpd));
> +       val &= ~BIT(zpd->bit);
> +       writel_relaxed(val, pcubase + PCU_DM_RSTEN(zpd));
> +       udelay(5);
> +
> +       val = readl_relaxed(pcubase + PCU_DM_PWREN(zpd));
> +       if (zpd->polarity == PWREN)
> +               val &= ~BIT(zpd->bit);
> +       else
> +               val |= BIT(zpd->bit);
> +       writel_relaxed(val, pcubase + PCU_DM_PWREN(zpd));
> +
> +       do {
> +               udelay(1);
> +               val = readl_relaxed(pcubase + PCU_DM_ACK_SYNC(zpd))
> +                                  & BIT(zpd->bit);
> +       } while (--loop && val);
> +
> +       if (!loop) {
> +               pr_err("Error: %s %s fail\n", __func__, domain->name);
> +               return -EIO;
> +       }
> +
> +       pr_debug("poweroff %s\n", domain->name);
> +
> +       return 0;
> +}
> +
> +int zx2967_pd_probe(struct platform_device *pdev,
> +                   struct generic_pm_domain **zx_pm_domains,
> +                   int domain_num)
> +{
> +       struct genpd_onecell_data *genpd_data;
> +       struct resource *res;
> +       int i;
> +
> +       genpd_data = devm_kzalloc(&pdev->dev, sizeof(*genpd_data),
> GFP_KERNEL);
> +       if (!genpd_data)
> +               return -ENOMEM;
> +
> +       genpd_data->domains = zx_pm_domains;
> +       genpd_data->num_domains = domain_num;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       pcubase = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(pcubase)) {
> +               dev_err(&pdev->dev, "ioremap fail.\n");
> +               return PTR_ERR(pcubase);
> +       }
> +
> +       for (i = 0; i < domain_num; ++i) {
> +               zx_pm_domains[i]->power_on = zx2967_power_on;
> +               zx_pm_domains[i]->power_off = zx2967_power_off;
> +
> +               pm_genpd_init(zx_pm_domains[i], NULL, false);
> +       }
> +
> +       of_genpd_add_provider_onecell(pdev->dev.of_node, genpd_data);
> +       dev_info(&pdev->dev, "powerdomain init ok\n");
> +       return 0;
> +}
> diff --git a/drivers/soc/zte/zx2967_pm_domains.h
> b/drivers/soc/zte/zx2967_pm_domains.h
> new file mode 100644
> index 0000000..cb46595
> --- /dev/null
> +++ b/drivers/soc/zte/zx2967_pm_domains.h
> @@ -0,0 +1,44 @@
> +/*
> + * Header for ZTE's Power Domain Driver support
> + *
> + * Copyright (C) 2017 ZTE Ltd.
> + *
> + * Author: Baoyou Xie <baoyou.xie@linaro.org>
> + * License terms: GNU General Public License (GPL) version 2
> + */
> +
> +#ifndef __ZTE_ZX2967_PM_DOMAIN_H
> +#define __ZTE_ZX2967_PM_DOMAIN_H
> +
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +
> +enum {
> +       REG_CLKEN,
> +       REG_ISOEN,
> +       REG_RSTEN,
> +       REG_PWREN,
> +       REG_PWRDN,
> +       REG_ACK_SYNC,
> +
> +       /* The size of the array - must be last */
> +       REG_ARRAY_SIZE,
> +};
> +
> +enum zx2967_power_polarity {
> +       PWREN,
> +       PWRDN,
> +};
> +
> +struct zx2967_pm_domain {
> +       struct generic_pm_domain dm;
> +       const u16 bit;
> +       const enum zx2967_power_polarity polarity;
> +       const u16 *reg_offset;
> +};
> +
> +int zx2967_pd_probe(struct platform_device *pdev,
> +                   struct generic_pm_domain **zx_pm_domains,
> +                   int domain_num);
> +
> +#endif /* __ZTE_ZX2967_PM_DOMAIN_H */
> --
> 2.7.4
>
>

--001a113f7318b717300545698692
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+ Shawn<br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 6 January 2017 at 17:16, Baoyou Xie <span dir=3D"ltr">&=
lt;<a href=3D"mailto:baoyou.xie@linaro.org" target=3D"_blank">baoyou.xie@li=
naro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The ARMv=
8 zx2967 family (296718, 296716 etc) uses different value<br>
for controlling the power domain on/off registers, Choose the<br>
value depending on the compatible.<br>
<br>
Multiple domains are prepared for the family, this patch prepares<br>
the common functions.<br>
<br>
Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoy=
ou.xie@linaro.org</a>&gt;<br>
---<br>
=C2=A0drivers/soc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0drivers/soc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/soc/zte/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 13 ++++<br>
=C2=A0drivers/soc/zte/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +<br>
=C2=A0drivers/soc/zte/zx2967_pm_<wbr>domains.c | 143 ++++++++++++++++++++++=
++++++++<wbr>++++++<br>
=C2=A0drivers/soc/zte/zx2967_pm_<wbr>domains.h |=C2=A0 44 +++++++++++<br>
=C2=A06 files changed, 206 insertions(+)<br>
=C2=A0create mode 100644 drivers/soc/zte/Kconfig<br>
=C2=A0create mode 100644 drivers/soc/zte/Makefile<br>
=C2=A0create mode 100644 drivers/soc/zte/zx2967_pm_<wbr>domains.c<br>
=C2=A0create mode 100644 drivers/soc/zte/zx2967_pm_<wbr>domains.h<br>
<br>
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig<br>
index f31bceb..f09023f 100644<br>
--- a/drivers/soc/Kconfig<br>
+++ b/drivers/soc/Kconfig<br>
@@ -11,5 +11,6 @@ source &quot;drivers/soc/tegra/Kconfig&quot;<br>
=C2=A0source &quot;drivers/soc/ti/Kconfig&quot;<br>
=C2=A0source &quot;drivers/soc/ux500/Kconfig&quot;<br>
=C2=A0source &quot;drivers/soc/versatile/<wbr>Kconfig&quot;<br>
+source &quot;drivers/soc/zte/Kconfig&quot;<br>
<br>
=C2=A0endmenu<br>
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile<br>
index 50c23d0..05eae52 100644<br>
--- a/drivers/soc/Makefile<br>
+++ b/drivers/soc/Makefile<br>
@@ -16,3 +16,4 @@ obj-$(CONFIG_ARCH_TEGRA)=C2=A0 =C2=A0 =C2=A0 +=3D tegra/<=
br>
=C2=A0obj-$(CONFIG_SOC_TI)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D ti/=
<br>
=C2=A0obj-$(CONFIG_ARCH_U8500)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D ux500/<br>
=C2=A0obj-$(CONFIG_PLAT_VERSATILE)=C2=A0 =C2=A0+=3D versatile/<br>
+obj-$(CONFIG_ARCH_ZX)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D zte/<br>
diff --git a/drivers/soc/zte/Kconfig b/drivers/soc/zte/Kconfig<br>
new file mode 100644<br>
index 0000000..20bde38<br>
--- /dev/null<br>
+++ b/drivers/soc/zte/Kconfig<br>
@@ -0,0 +1,13 @@<br>
+#<br>
+# ZTE SoC drivers<br>
+#<br>
+menuconfig SOC_ZTE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ZTE SoC driver support&quot;<br>
+<br>
+if SOC_ZTE<br>
+<br>
+config ZX2967_PM_DOMAINS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ZX2967 PM domains&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on PM_GENERIC_DOMAINS<br>
+<br>
+endif<br>
diff --git a/drivers/soc/zte/Makefile b/drivers/soc/zte/Makefile<br>
new file mode 100644<br>
index 0000000..8a37f2f<br>
--- /dev/null<br>
+++ b/drivers/soc/zte/Makefile<br>
@@ -0,0 +1,4 @@<br>
+#<br>
+# ZTE SOC drivers<br>
+#<br>
+obj-$(CONFIG_ZX2967_PM_<wbr>DOMAINS) +=3D zx2967_pm_domains.o<br>
diff --git a/drivers/soc/zte/zx2967_pm_<wbr>domains.c b/drivers/soc/zte/zx2=
967_pm_<wbr>domains.c<br>
new file mode 100644<br>
index 0000000..61c8d84<br>
--- /dev/null<br>
+++ b/drivers/soc/zte/zx2967_pm_<wbr>domains.c<br>
@@ -0,0 +1,143 @@<br>
+/*<br>
+ * Copyright (C) 2017 ZTE Ltd.<br>
+ *<br>
+ * Author: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoyou.=
xie@linaro.org</a>&gt;<br>
+ * License terms: GNU General Public License (GPL) version 2<br>
+ */<br>
+<br>
+#include &lt;linux/delay.h&gt;<br>
+#include &lt;linux/err.h&gt;<br>
+#include &lt;linux/io.h&gt;<br>
+#include &lt;linux/of.h&gt;<br>
+<br>
+#include &quot;zx2967_pm_domains.h&quot;<br>
+<br>
+#define PCU_DM_CLKEN(zpd)=C2=A0 =C2=A0 =C2=A0 ((zpd)-&gt;reg_offset[REG_CL=
KEN])<br>
+#define PCU_DM_ISOEN(zpd)=C2=A0 =C2=A0 =C2=A0 ((zpd)-&gt;reg_offset[REG_IS=
OEN])<br>
+#define PCU_DM_RSTEN(zpd)=C2=A0 =C2=A0 =C2=A0 ((zpd)-&gt;reg_offset[REG_RS=
TEN])<br>
+#define PCU_DM_PWREN(zpd)=C2=A0 =C2=A0 =C2=A0 ((zpd)-&gt;reg_offset[REG_PW=
REN])<br>
+#define PCU_DM_ACK_SYNC(zpd)=C2=A0 =C2=A0((zpd)-&gt;reg_offset[REG_ACK_<wb=
r>SYNC])<br>
+<br>
+static void __iomem *pcubase;<br>
+<br>
+static int zx2967_power_on(struct generic_pm_domain *domain)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_pm_domain *zpd =3D (struct zx2967=
_pm_domain *)domain;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long loop =3D 1000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(pcubase + PCU_DM_PWREN(zp=
d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (zpd-&gt;polarity =3D=3D PWREN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D BIT(zpd-&g=
t;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ~BIT(z=
pd-&gt;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(val, pcubase + PCU_DM_PWREN(zpd)=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relax=
ed(pcubase + PCU_DM_ACK_SYNC(zpd))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp; BIT(zpd-&gt;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (--loop &amp;&amp; !val);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!loop) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Error:=
 %s %s fail\n&quot;, __func__, domain-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(pcubase + PCU_DM_RSTEN(zp=
d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D BIT(zpd-&gt;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(val, pcubase + PCU_DM_RSTEN(zpd)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(5);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(pcubase + PCU_DM_ISOEN(zp=
d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ~BIT(zpd-&gt;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(val, pcubase + PCU_DM_ISOEN(zpd)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(5);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(pcubase + PCU_DM_CLKEN(zp=
d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D BIT(zpd-&gt;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(val, pcubase + PCU_DM_CLKEN(zpd)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(5);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;poweron %s\n&quot;, domain-&gt;n=
ame);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int zx2967_power_off(struct generic_pm_domain *domain)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct zx2967_pm_domain *zpd =3D (struct zx2967=
_pm_domain *)domain;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long loop =3D 1000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(pcubase + PCU_DM_CLKEN(zp=
d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ~BIT(zpd-&gt;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(val, pcubase + PCU_DM_CLKEN(zpd)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(5);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(pcubase + PCU_DM_ISOEN(zp=
d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D BIT(zpd-&gt;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(val, pcubase + PCU_DM_ISOEN(zpd)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(5);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(pcubase + PCU_DM_RSTEN(zp=
d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ~BIT(zpd-&gt;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(val, pcubase + PCU_DM_RSTEN(zpd)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(5);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relaxed(pcubase + PCU_DM_PWREN(zp=
d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (zpd-&gt;polarity =3D=3D PWREN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val &amp;=3D ~BIT(z=
pd-&gt;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D BIT(zpd-&g=
t;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(val, pcubase + PCU_DM_PWREN(zpd)=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readl_relax=
ed(pcubase + PCU_DM_ACK_SYNC(zpd))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp; BIT(zpd-&gt;bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (--loop &amp;&amp; val);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!loop) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Error:=
 %s %s fail\n&quot;, __func__, domain-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EIO;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;poweroff %s\n&quot;, domain-&gt;=
name);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+int zx2967_pd_probe(struct platform_device *pdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t generic_pm_domain **zx_pm_domains,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int d=
omain_num)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct genpd_onecell_data *genpd_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0genpd_data =3D devm_kzalloc(&amp;pdev-&gt;dev, =
sizeof(*genpd_data), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!genpd_data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0genpd_data-&gt;domains =3D zx_pm_domains;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0genpd_data-&gt;num_domains =3D domain_num;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pcubase =3D devm_ioremap_resource(&amp;pdev-&gt=
;<wbr>dev, res);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(pcubase)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&=
gt;dev, &quot;ioremap fail.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(pcub=
ase);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; domain_num; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx_pm_domains[i]-&g=
t;power_on =3D zx2967_power_on;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx_pm_domains[i]-&g=
t;power_off =3D zx2967_power_off;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_genpd_init(zx_pm=
_domains[i]<wbr>, NULL, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0of_genpd_add_provider_onecell(<wbr>pdev-&gt;dev=
.of_node, genpd_data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(&amp;pdev-&gt;dev, &quot;powerdomain i=
nit ok\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
diff --git a/drivers/soc/zte/zx2967_pm_<wbr>domains.h b/drivers/soc/zte/zx2=
967_pm_<wbr>domains.h<br>
new file mode 100644<br>
index 0000000..cb46595<br>
--- /dev/null<br>
+++ b/drivers/soc/zte/zx2967_pm_<wbr>domains.h<br>
@@ -0,0 +1,44 @@<br>
+/*<br>
+ * Header for ZTE&#39;s Power Domain Driver support<br>
+ *<br>
+ * Copyright (C) 2017 ZTE Ltd.<br>
+ *<br>
+ * Author: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoyou.=
xie@linaro.org</a>&gt;<br>
+ * License terms: GNU General Public License (GPL) version 2<br>
+ */<br>
+<br>
+#ifndef __ZTE_ZX2967_PM_DOMAIN_H<br>
+#define __ZTE_ZX2967_PM_DOMAIN_H<br>
+<br>
+#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/pm_domain.h&gt;<br>
+<br>
+enum {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0REG_CLKEN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0REG_ISOEN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0REG_RSTEN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0REG_PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0REG_PWRDN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0REG_ACK_SYNC,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The size of the array - must be last */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0REG_ARRAY_SIZE,<br>
+};<br>
+<br>
+enum zx2967_power_polarity {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PWRDN,<br>
+};<br>
+<br>
+struct zx2967_pm_domain {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct generic_pm_domain dm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const u16 bit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const enum zx2967_power_polarity polarity;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const u16 *reg_offset;<br>
+};<br>
+<br>
+int zx2967_pd_probe(struct platform_device *pdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struc=
t generic_pm_domain **zx_pm_domains,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int d=
omain_num);<br>
+<br>
+#endif /* __ZTE_ZX2967_PM_DOMAIN_H */<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a113f7318b717300545698692--
