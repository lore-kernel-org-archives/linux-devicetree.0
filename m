Return-Path: <SRS0=GrzW=YU=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1483694164-7668-5-git-send-email-baoyou.xie@linaro.org>
References: <1483694164-7668-1-git-send-email-baoyou.xie@linaro.org> <1483694164-7668-5-git-send-email-baoyou.xie@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Fri, 6 Jan 2017 17:20:43 +0800
Message-ID: <CA+DQWkyhQ5RXJLn2hGpoME1R6QUFDaEP2MA-3aq8hLHdr8Q0Sw@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] soc: zte: pm_domains: Add support for zx296718
Content-Type: multipart/alternative; boundary=001a1140b0fa44623405456988d4
To: Jun Nie <jun.nie@linaro.org>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Greg KH <gregkh@linuxfoundation.org>, davem@davemloft.net, geert+renesas@glider.be, akpm@linux-foundation.org, mchehab@kernel.org, krzk@kernel.org, Arnd Bergmann <arnd@arndb.de>, claudiu.manoil@nxp.com, amit daniel <amitdanielk@gmail.com>, pankaj.dubey@samsung.com, yangbo.lu@nxp.com, scott.branden@broadcom.com, simon.horman@netronome.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baoyou Xie <baoyou.xie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a1140b0fa44623405456988d4
Content-Type: text/plain; charset=UTF-8

+ Shawn

On 6 January 2017 at 17:16, Baoyou Xie <baoyou.xie@linaro.org> wrote:

> This patch introduces the power domain driver of zx296718
> which belongs to zte's zx2967 family.
>
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> Reviewed-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/soc/zte/Makefile              |   1 +
>  drivers/soc/zte/zx296718_pm_domains.c | 182
> ++++++++++++++++++++++++++++++++++
>  2 files changed, 183 insertions(+)
>  create mode 100644 drivers/soc/zte/zx296718_pm_domains.c
>
> diff --git a/drivers/soc/zte/Makefile b/drivers/soc/zte/Makefile
> index 8a37f2f..96b7cd4 100644
> --- a/drivers/soc/zte/Makefile
> +++ b/drivers/soc/zte/Makefile
> @@ -2,3 +2,4 @@
>  # ZTE SOC drivers
>  #
>  obj-$(CONFIG_ZX2967_PM_DOMAINS) += zx2967_pm_domains.o
> +obj-$(CONFIG_ZX2967_PM_DOMAINS) += zx296718_pm_domains.o
> diff --git a/drivers/soc/zte/zx296718_pm_domains.c
> b/drivers/soc/zte/zx296718_pm_domains.c
> new file mode 100644
> index 0000000..5ed924f
> --- /dev/null
> +++ b/drivers/soc/zte/zx296718_pm_domains.c
> @@ -0,0 +1,182 @@
> +/*
> + * Copyright (C) 2017 ZTE Ltd.
> + *
> + * Author: Baoyou Xie <baoyou.xie@linaro.org>
> + * License terms: GNU General Public License (GPL) version 2
> + */
> +
> +#include <dt-bindings/soc/zte,pm_domains.h>
> +#include "zx2967_pm_domains.h"
> +
> +static u16 zx296718_offsets[REG_ARRAY_SIZE] = {
> +       [REG_CLKEN] = 0x18,
> +       [REG_ISOEN] = 0x1c,
> +       [REG_RSTEN] = 0x20,
> +       [REG_PWREN] = 0x24,
> +       [REG_ACK_SYNC] = 0x28,
> +};
> +
> +enum {
> +       PCU_DM_VOU = 0,
> +       PCU_DM_SAPPU,
> +       PCU_DM_VDE,
> +       PCU_DM_VCE,
> +       PCU_DM_HDE,
> +       PCU_DM_VIU,
> +       PCU_DM_USB20,
> +       PCU_DM_USB21,
> +       PCU_DM_USB30,
> +       PCU_DM_HSIC,
> +       PCU_DM_GMAC,
> +       PCU_DM_TS,
> +};
> +
> +static struct zx2967_pm_domain vou_domain = {
> +       .dm = {
> +               .name           = "vou_domain",
> +       },
> +       .bit = PCU_DM_VOU,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain sappu_domain = {
> +       .dm = {
> +               .name           = "sappu_domain",
> +       },
> +       .bit = PCU_DM_SAPPU,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain vde_domain = {
> +       .dm = {
> +               .name           = "vde_domain",
> +       },
> +       .bit = PCU_DM_VDE,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain vce_domain = {
> +       .dm = {
> +               .name           = "vce_domain",
> +       },
> +       .bit = PCU_DM_VCE,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain hde_domain = {
> +       .dm = {
> +               .name           = "hde_domain",
> +       },
> +       .bit = PCU_DM_HDE,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain viu_domain = {
> +       .dm = {
> +               .name           = "viu_domain",
> +       },
> +       .bit = PCU_DM_VIU,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain usb20_domain = {
> +       .dm = {
> +               .name           = "usb20_domain",
> +       },
> +       .bit = PCU_DM_USB20,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain usb21_domain = {
> +       .dm = {
> +               .name           = "usb21_domain",
> +       },
> +       .bit = PCU_DM_USB21,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain usb30_domain = {
> +       .dm = {
> +               .name           = "usb30_domain",
> +       },
> +       .bit = PCU_DM_USB30,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain hsic_domain = {
> +       .dm = {
> +               .name           = "hsic_domain",
> +       },
> +       .bit = PCU_DM_HSIC,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain gmac_domain = {
> +       .dm = {
> +               .name           = "gmac_domain",
> +       },
> +       .bit = PCU_DM_GMAC,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct zx2967_pm_domain ts_domain = {
> +       .dm = {
> +               .name           = "ts_domain",
> +       },
> +       .bit = PCU_DM_TS,
> +       .polarity = PWREN,
> +       .reg_offset = zx296718_offsets,
> +};
> +
> +static struct generic_pm_domain *zx296718_pm_domains[] = {
> +       [DM_ZX296718_VOU] = &vou_domain.dm,
> +       [DM_ZX296718_SAPPU] = &sappu_domain.dm,
> +       [DM_ZX296718_VDE] = &vde_domain.dm,
> +       [DM_ZX296718_VCE] = &vce_domain.dm,
> +       [DM_ZX296718_HDE] = &hde_domain.dm,
> +       [DM_ZX296718_VIU] = &viu_domain.dm,
> +       [DM_ZX296718_USB20] = &usb20_domain.dm,
> +       [DM_ZX296718_USB21] = &usb21_domain.dm,
> +       [DM_ZX296718_USB30] = &usb30_domain.dm,
> +       [DM_ZX296718_HSIC] = &hsic_domain.dm,
> +       [DM_ZX296718_GMAC] = &gmac_domain.dm,
> +       [DM_ZX296718_TS] = &ts_domain.dm,
> +};
> +
> +static int zx296718_pd_probe(struct platform_device *pdev)
> +{
> +       return zx2967_pd_probe(pdev,
> +                         zx296718_pm_domains,
> +                         ARRAY_SIZE(zx296718_pm_domains));
> +}
> +
> +static const struct of_device_id zx296718_pm_domain_matches[] = {
> +       { .compatible = "zte,zx296718-pcu", },
> +       { },
> +};
> +
> +static struct platform_driver zx296718_pd_driver = {
> +       .driver = {
> +               .name = "zx296718-powerdomain",
> +               .owner = THIS_MODULE,
> +               .of_match_table = zx296718_pm_domain_matches,
> +       },
> +       .probe = zx296718_pd_probe,
> +};
> +
> +static int __init zx296718_pd_init(void)
> +{
> +       return platform_driver_register(&zx296718_pd_driver);
> +}
> +subsys_initcall(zx296718_pd_init);
> --
> 2.7.4
>
>

--001a1140b0fa44623405456988d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+ Shawn<br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 6 January 2017 at 17:16, Baoyou Xie <span dir=3D"ltr">&=
lt;<a href=3D"mailto:baoyou.xie@linaro.org" target=3D"_blank">baoyou.xie@li=
naro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This pat=
ch introduces the power domain driver of zx296718<br>
which belongs to zte&#39;s zx2967 family.<br>
<br>
Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoy=
ou.xie@linaro.org</a>&gt;<br>
Reviewed-by: Jun Nie &lt;<a href=3D"mailto:jun.nie@linaro.org">jun.nie@lina=
ro.org</a>&gt;<br>
---<br>
=C2=A0drivers/soc/zte/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/soc/zte/zx296718_pm_<wbr>domains.c | 182 ++++++++++++++++++++=
++++++++++<wbr>++++<br>
=C2=A02 files changed, 183 insertions(+)<br>
=C2=A0create mode 100644 drivers/soc/zte/zx296718_pm_<wbr>domains.c<br>
<br>
diff --git a/drivers/soc/zte/Makefile b/drivers/soc/zte/Makefile<br>
index 8a37f2f..96b7cd4 100644<br>
--- a/drivers/soc/zte/Makefile<br>
+++ b/drivers/soc/zte/Makefile<br>
@@ -2,3 +2,4 @@<br>
=C2=A0# ZTE SOC drivers<br>
=C2=A0#<br>
=C2=A0obj-$(CONFIG_ZX2967_PM_<wbr>DOMAINS) +=3D zx2967_pm_domains.o<br>
+obj-$(CONFIG_ZX2967_PM_<wbr>DOMAINS) +=3D zx296718_pm_domains.o<br>
diff --git a/drivers/soc/zte/zx296718_pm_<wbr>domains.c b/drivers/soc/zte/z=
x296718_pm_<wbr>domains.c<br>
new file mode 100644<br>
index 0000000..5ed924f<br>
--- /dev/null<br>
+++ b/drivers/soc/zte/zx296718_pm_<wbr>domains.c<br>
@@ -0,0 +1,182 @@<br>
+/*<br>
+ * Copyright (C) 2017 ZTE Ltd.<br>
+ *<br>
+ * Author: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">baoyou.=
xie@linaro.org</a>&gt;<br>
+ * License terms: GNU General Public License (GPL) version 2<br>
+ */<br>
+<br>
+#include &lt;dt-bindings/soc/zte,pm_<wbr>domains.h&gt;<br>
+#include &quot;zx2967_pm_domains.h&quot;<br>
+<br>
+static u16 zx296718_offsets[REG_ARRAY_<wbr>SIZE] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[REG_CLKEN] =3D 0x18,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[REG_ISOEN] =3D 0x1c,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[REG_RSTEN] =3D 0x20,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[REG_PWREN] =3D 0x24,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[REG_ACK_SYNC] =3D 0x28,<br>
+};<br>
+<br>
+enum {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_VOU =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_SAPPU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_VDE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_VCE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_HDE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_VIU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_USB20,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_USB21,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_USB30,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_HSIC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_GMAC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PCU_DM_TS,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain vou_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vou_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_VOU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain sappu_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;sappu_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_SAPPU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain vde_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vde_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_VDE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain vce_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vce_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_VCE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain hde_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;hde_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_HDE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain viu_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;viu_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_VIU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain usb20_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;usb20_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_USB20,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain usb21_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;usb21_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_USB21,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain usb30_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;usb30_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_USB30,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain hsic_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;hsic_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_HSIC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain gmac_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;gmac_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_GMAC,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct zx2967_pm_domain ts_domain =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;ts_domain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_TS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
+};<br>
+<br>
+static struct generic_pm_domain *zx296718_pm_domains[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_VOU] =3D &amp;<a href=3D"http://vo=
u_domain.dm" rel=3D"noreferrer" target=3D"_blank">vou_domain.dm</a>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_SAPPU] =3D &amp;<a href=3D"http://=
sappu_domain.dm" rel=3D"noreferrer" target=3D"_blank">sappu_domain.dm</a>,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_VDE] =3D &amp;<a href=3D"http://vd=
e_domain.dm" rel=3D"noreferrer" target=3D"_blank">vde_domain.dm</a>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_VCE] =3D &amp;<a href=3D"http://vc=
e_domain.dm" rel=3D"noreferrer" target=3D"_blank">vce_domain.dm</a>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_HDE] =3D &amp;<a href=3D"http://hd=
e_domain.dm" rel=3D"noreferrer" target=3D"_blank">hde_domain.dm</a>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_VIU] =3D &amp;<a href=3D"http://vi=
u_domain.dm" rel=3D"noreferrer" target=3D"_blank">viu_domain.dm</a>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_USB20] =3D &amp;<a href=3D"http://=
usb20_domain.dm" rel=3D"noreferrer" target=3D"_blank">usb20_domain.dm</a>,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_USB21] =3D &amp;<a href=3D"http://=
usb21_domain.dm" rel=3D"noreferrer" target=3D"_blank">usb21_domain.dm</a>,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_USB30] =3D &amp;<a href=3D"http://=
usb30_domain.dm" rel=3D"noreferrer" target=3D"_blank">usb30_domain.dm</a>,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_HSIC] =3D &amp;<a href=3D"http://h=
sic_domain.dm" rel=3D"noreferrer" target=3D"_blank">hsic_domain.dm</a>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_GMAC] =3D &amp;<a href=3D"http://g=
mac_domain.dm" rel=3D"noreferrer" target=3D"_blank">gmac_domain.dm</a>,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[DM_ZX296718_TS] =3D &amp;<a href=3D"http://ts_=
domain.dm" rel=3D"noreferrer" target=3D"_blank">ts_domain.dm</a>,<br>
+};<br>
+<br>
+static int zx296718_pd_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return zx2967_pd_probe(pdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0zx296718_pm_domains,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ARRAY_SIZE(zx296718_pm_<wbr>domains));<br>
+}<br>
+<br>
+static const struct of_device_id zx296718_pm_domain_matches[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;zte,zx296718-pcu&quot;,=
 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ },<br>
+};<br>
+<br>
+static struct platform_driver zx296718_pd_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;zx2=
96718-powerdomain&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =3D THIS_MOD=
ULE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 zx296718_pm_domain_matches,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D zx296718_pd_probe,<br>
+};<br>
+<br>
+static int __init zx296718_pd_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;<wbr>zx296=
718_pd_driver);<br>
+}<br>
+subsys_initcall(zx296718_pd_<wbr>init);<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a1140b0fa44623405456988d4--
