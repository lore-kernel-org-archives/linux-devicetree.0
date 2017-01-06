Return-Path: <SRS0=GrzW=YU=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170105073846.GD4667@x250>
References: <1483530494-14177-1-git-send-email-baoyou.xie@linaro.org>
 <1483530494-14177-5-git-send-email-baoyou.xie@linaro.org> <20170105073846.GD4667@x250>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Fri, 6 Jan 2017 16:23:41 +0800
Message-ID: <CA+DQWkwt3oGe1mZppeTkYJptakJYjrahSKdn+kn_FpQGDUgAxA@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] soc: zte: pm_domains: Add support for zx296718
Content-Type: multipart/alternative; boundary=001a114abf4a4c2487054568bc4f
To: Shawn Guo <shawnguo@kernel.org>
Cc: Jun Nie <jun.nie@linaro.org>, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, krzk@kernel.org, Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>, amit daniel <amitdanielk@gmail.com>, claudiu.manoil@nxp.com, yangbo.lu@nxp.com, pankaj.dubey@samsung.com, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a114abf4a4c2487054568bc4f
Content-Type: text/plain; charset=UTF-8

On 5 January 2017 at 15:38, Shawn Guo <shawnguo@kernel.org> wrote:

> On Wed, Jan 04, 2017 at 07:48:14PM +0800, Baoyou Xie wrote:
> > This patch introduces the power domain driver of zx296718
> > which belongs to zte's zx2967 family.
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> > Reviewed-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/soc/zte/Makefile              |   1 +
> >  drivers/soc/zte/zx296718_pm_domains.c | 181
> ++++++++++++++++++++++++++++++++++
> >  2 files changed, 182 insertions(+)
> >  create mode 100644 drivers/soc/zte/zx296718_pm_domains.c
> >
> > diff --git a/drivers/soc/zte/Makefile b/drivers/soc/zte/Makefile
> > index 8a37f2f..96b7cd4 100644
> > --- a/drivers/soc/zte/Makefile
> > +++ b/drivers/soc/zte/Makefile
> > @@ -2,3 +2,4 @@
> >  # ZTE SOC drivers
> >  #
> >  obj-$(CONFIG_ZX2967_PM_DOMAINS) += zx2967_pm_domains.o
> > +obj-$(CONFIG_ZX2967_PM_DOMAINS) += zx296718_pm_domains.o
> > diff --git a/drivers/soc/zte/zx296718_pm_domains.c
> b/drivers/soc/zte/zx296718_pm_domains.c
> > new file mode 100644
> > index 0000000..52003ee
> > --- /dev/null
> > +++ b/drivers/soc/zte/zx296718_pm_domains.c
> > @@ -0,0 +1,181 @@
> > +/*
> > + * Copyright (C) 2017 ZTE Ltd.
> > + *
> > + * Author: Baoyou Xie <baoyou.xie@linaro.org>
> > + * License terms: GNU General Public License (GPL) version 2
> > + */
>
> Please have a newline between licence declaration and headers to improve
> the readability.  Same for zx2967_pm_domains.c.
>
> > +#include <dt-bindings/soc/zte,pm_domains.h>
> > +#include "zx2967_pm_domains.h"
> > +
> > +static u16 zx296718_offsets[REG_ARRAY_SIZE] = {
> > +     [REG_CLKEN] = 0x18,
> > +     [REG_ISOEN] = 0x1c,
> > +     [REG_RSTEN] = 0x20,
> > +     [REG_PWREN] = 0x24,
> > +     [REG_ACK_SYNC] = 0x28,
> > +};
> > +
> > +enum {
> > +     PCU_DM_VOU = 0,
> > +     PCU_DM_SAPPU,
> > +     PCU_DM_VDE,
> > +     PCU_DM_VCE,
> > +     PCU_DM_HDE,
> > +     PCU_DM_VIU,
> > +     PCU_DM_USB20,
> > +     PCU_DM_USB21,
> > +     PCU_DM_USB30,
> > +     PCU_DM_HSIC,
> > +     PCU_DM_GMAC,
> > +     PCU_DM_TS,
> > +};
>
> I think we can save this enum completely by defining those
> DM_ZX296718_xxx constants in zte,pm_domains.h in the same order of this
> enum (hardware bit position order), so that DM_ZX296718_xxx can directly
> be used as .bit field of struct zx2967_pm_domain.
>
> we should not replace PCU_DM_XX with DM_ZX296718_xxx, their means are
different,
one is the array index, but another is the bit index.

I suggest to keep them strongly.


> #define DM_ZX296718_VOU         0
> #define DM_ZX296718_SAPPU       1
> #define DM_ZX296718_VDE         2  /* g1v6 */
> #define DM_ZX296718_VCE         3  /* h1v6 */
> #define DM_ZX296718_HDE         4  /* g2v2 */
> #define DM_ZX296718_VIU         5
> #define DM_ZX296718_USB20       6
> #define DM_ZX296718_USB21       7
> #define DM_ZX296718_USB30       8
> #define DM_ZX296718_HSIC        9
> #define DM_ZX296718_GMAC        10
> #define DM_ZX296718_TS          11
>
> > +
> > +static struct zx2967_pm_domain vou_domain = {
> > +     .dm = {
> > +             .name           = "vou_domain",
> > +     },
> > +     .bit = PCU_DM_VOU,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain sappu_domain = {
> > +     .dm = {
> > +             .name           = "sappu_domain",
> > +     },
> > +     .bit = PCU_DM_SAPPU,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain vde_domain = {
> > +     .dm = {
> > +             .name           = "vde_domain",
> > +     },
> > +     .bit = PCU_DM_VDE,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain vce_domain = {
> > +     .dm = {
> > +             .name           = "vce_domain",
> > +     },
> > +     .bit = PCU_DM_VCE,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain hde_domain = {
> > +     .dm = {
> > +             .name           = "hde_domain",
> > +     },
> > +     .bit = PCU_DM_HDE,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain viu_domain = {
> > +     .dm = {
> > +             .name           = "viu_domain",
> > +     },
> > +     .bit = PCU_DM_VIU,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain usb20_domain = {
> > +     .dm = {
> > +             .name           = "usb20_domain",
> > +     },
> > +     .bit = PCU_DM_USB20,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain usb21_domain = {
> > +     .dm = {
> > +             .name           = "usb21_domain",
> > +     },
> > +     .bit = PCU_DM_USB21,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain usb30_domain = {
> > +     .dm = {
> > +             .name           = "usb30_domain",
> > +     },
> > +     .bit = PCU_DM_USB30,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain hsic_domain = {
> > +     .dm = {
> > +             .name           = "hsic_domain",
> > +     },
> > +     .bit = PCU_DM_HSIC,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain gmac_domain = {
> > +     .dm = {
> > +             .name           = "gmac_domain",
> > +     },
> > +     .bit = PCU_DM_GMAC,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct zx2967_pm_domain ts_domain = {
> > +     .dm = {
> > +             .name           = "ts_domain",
> > +     },
> > +     .bit = PCU_DM_TS,
> > +     .polarity = PWREN,
> > +     .reg_offset = zx296718_offsets,
> > +};
> > +
> > +static struct generic_pm_domain *zx296718_pm_domains[] = {
> > +     [DM_ZX296718_SAPPU] = &sappu_domain.dm,
> > +     [DM_ZX296718_VDE] = &vde_domain.dm,
> > +     [DM_ZX296718_VCE] = &vce_domain.dm,
> > +     [DM_ZX296718_HDE] = &hde_domain.dm,
> > +     [DM_ZX296718_VIU] = &viu_domain.dm,
> > +     [DM_ZX296718_USB20] = &usb20_domain.dm,
> > +     [DM_ZX296718_USB21] = &usb21_domain.dm,
> > +     [DM_ZX296718_USB30] = &usb30_domain.dm,
> > +     [DM_ZX296718_HSIC] = &hsic_domain.dm,
> > +     [DM_ZX296718_GMAC] = &gmac_domain.dm,
> > +     [DM_ZX296718_TS] = &ts_domain.dm,
> > +     [DM_ZX296718_VOU] = &vou_domain.dm,
>
> If you update the order of DM_ZX296718_xxx in zte,pm_domains.h, it would
> be nice to update this list accordingly as well.
>
> > +};
> > +
> > +static int zx296718_pd_probe(struct platform_device *pdev)
> > +{
> > +     return zx2967_pd_probe(pdev,
> > +                       zx296718_pm_domains,
> > +                       ARRAY_SIZE(zx296718_pm_domains));
> > +}
> > +
> > +static const struct of_device_id zx296718_pm_domain_matches[] = {
> > +     { .compatible = "zte,zx296718-pcu", },
> > +     { },
> > +};
> > +
> > +static struct platform_driver zx296718_pd_driver = {
> > +     .driver = {
> > +             .name = "zx-powerdomain",
>
> This is a zx296718 specific driver.  So zx296718-powerdomain should
> be a better name?
>
> Shawn
>
> > +             .owner = THIS_MODULE,
> > +             .of_match_table = zx296718_pm_domain_matches,
> > +     },
> > +     .probe = zx296718_pd_probe,
> > +};
> > +
> > +static int __init zx296718_pd_init(void)
> > +{
> > +     return platform_driver_register(&zx296718_pd_driver);
> > +}
> > +subsys_initcall(zx296718_pd_init);
> > --
> > 2.7.4
> >
>

--001a114abf4a4c2487054568bc4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 5 January 2017 at 15:38, Shawn Guo <span dir=3D"ltr">&lt;<a href=3D"=
mailto:shawnguo@kernel.org" target=3D"_blank">shawnguo@kernel.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div clas=
s=3D"gmail-HOEnZb"><div class=3D"gmail-h5">On Wed, Jan 04, 2017 at 07:48:14=
PM +0800, Baoyou Xie wrote:<br>
&gt; This patch introduces the power domain driver of zx296718<br>
&gt; which belongs to zte&#39;s zx2967 family.<br>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
>baoyou.xie@linaro.org</a>&gt;<br>
&gt; Reviewed-by: Jun Nie &lt;<a href=3D"mailto:jun.nie@linaro.org">jun.nie=
@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/soc/zte/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/soc/zte/zx296718_pm_<wbr>domains.c | 181 +++++++++++++++=
+++++++++++++++<wbr>++++<br>
&gt;=C2=A0 2 files changed, 182 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/soc/zte/zx296718_pm_<wbr>domains.c<br=
>
&gt;<br>
&gt; diff --git a/drivers/soc/zte/Makefile b/drivers/soc/zte/Makefile<br>
&gt; index 8a37f2f..96b7cd4 100644<br>
&gt; --- a/drivers/soc/zte/Makefile<br>
&gt; +++ b/drivers/soc/zte/Makefile<br>
&gt; @@ -2,3 +2,4 @@<br>
&gt;=C2=A0 # ZTE SOC drivers<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 obj-$(CONFIG_ZX2967_PM_<wbr>DOMAINS) +=3D zx2967_pm_domains.o<br=
>
&gt; +obj-$(CONFIG_ZX2967_PM_<wbr>DOMAINS) +=3D zx296718_pm_domains.o<br>
&gt; diff --git a/drivers/soc/zte/zx296718_pm_<wbr>domains.c b/drivers/soc/=
zte/zx296718_pm_<wbr>domains.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..52003ee<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/soc/zte/zx296718_pm_<wbr>domains.c<br>
&gt; @@ -0,0 +1,181 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2017 ZTE Ltd.<br>
&gt; + *<br>
&gt; + * Author: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">ba=
oyou.xie@linaro.org</a>&gt;<br>
&gt; + * License terms: GNU General Public License (GPL) version 2<br>
&gt; + */<br>
<br>
</div></div>Please have a newline between licence declaration and headers t=
o improve<br>
the readability.=C2=A0 Same for zx2967_pm_domains.c.<br>
<div><div class=3D"gmail-h5"><br>
&gt; +#include &lt;dt-bindings/soc/zte,pm_<wbr>domains.h&gt;<br>
&gt; +#include &quot;zx2967_pm_domains.h&quot;<br>
&gt; +<br>
&gt; +static u16 zx296718_offsets[REG_ARRAY_<wbr>SIZE] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[REG_CLKEN] =3D 0x18,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[REG_ISOEN] =3D 0x1c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[REG_RSTEN] =3D 0x20,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[REG_PWREN] =3D 0x24,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[REG_ACK_SYNC] =3D 0x28,<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_VOU =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_SAPPU,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_VDE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_VCE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_HDE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_VIU,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_USB20,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_USB21,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_USB30,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_HSIC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_GMAC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PCU_DM_TS,<br>
&gt; +};<br>
<br>
</div></div>I think we can save this enum completely by defining those<br>
DM_ZX296718_xxx constants in zte,pm_domains.h in the same order of this<br>
enum (hardware bit position order), so that DM_ZX296718_xxx can directly<br=
>
be used as .bit field of struct zx2967_pm_domain.<br>
<br></blockquote><div>we should not replace PCU_DM_XX with DM_ZX296718_xxx,=
 their means are different,<br></div><div>one is the array index, but anoth=
er is the bit index.<br><br></div><div>I suggest to keep them strongly.<br>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
#define DM_ZX296718_VOU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
#define DM_ZX296718_SAPPU=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
#define DM_ZX296718_VDE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02=C2=A0 /* g1v6 */=
<br>
#define DM_ZX296718_VCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03=C2=A0 /* h1v6 */=
<br>
#define DM_ZX296718_HDE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04=C2=A0 /* g2v2 */=
<br>
#define DM_ZX296718_VIU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05<br>
#define DM_ZX296718_USB20=C2=A0 =C2=A0 =C2=A0 =C2=A06<br>
#define DM_ZX296718_USB21=C2=A0 =C2=A0 =C2=A0 =C2=A07<br>
#define DM_ZX296718_USB30=C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
#define DM_ZX296718_HSIC=C2=A0 =C2=A0 =C2=A0 =C2=A0 9<br>
#define DM_ZX296718_GMAC=C2=A0 =C2=A0 =C2=A0 =C2=A0 10<br>
#define DM_ZX296718_TS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11<br>
<div><div class=3D"gmail-h5"><br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain vou_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vou_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_VOU,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain sappu_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;sappu_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_SAPPU,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain vde_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vde_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_VDE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain vce_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vce_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_VCE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain hde_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;hde_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_HDE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain viu_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;viu_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_VIU,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain usb20_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;usb20_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_USB20,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain usb21_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;usb21_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_USB21,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain usb30_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;usb30_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_USB30,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain hsic_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;hsic_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_HSIC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain gmac_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;gmac_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_GMAC,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct zx2967_pm_domain ts_domain =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.dm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;ts_domain&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bit =3D PCU_DM_TS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.polarity =3D PWREN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_offset =3D zx296718_offsets,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct generic_pm_domain *zx296718_pm_domains[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_SAPPU] =3D &amp;<a href=3D"http://sa=
ppu_domain.dm" rel=3D"noreferrer" target=3D"_blank">sappu_domain.dm</a>,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_VDE] =3D &amp;<a href=3D"http://vde_=
domain.dm" rel=3D"noreferrer" target=3D"_blank">vde_domain.dm</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_VCE] =3D &amp;<a href=3D"http://vce_=
domain.dm" rel=3D"noreferrer" target=3D"_blank">vce_domain.dm</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_HDE] =3D &amp;<a href=3D"http://hde_=
domain.dm" rel=3D"noreferrer" target=3D"_blank">hde_domain.dm</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_VIU] =3D &amp;<a href=3D"http://viu_=
domain.dm" rel=3D"noreferrer" target=3D"_blank">viu_domain.dm</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_USB20] =3D &amp;<a href=3D"http://us=
b20_domain.dm" rel=3D"noreferrer" target=3D"_blank">usb20_domain.dm</a>,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_USB21] =3D &amp;<a href=3D"http://us=
b21_domain.dm" rel=3D"noreferrer" target=3D"_blank">usb21_domain.dm</a>,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_USB30] =3D &amp;<a href=3D"http://us=
b30_domain.dm" rel=3D"noreferrer" target=3D"_blank">usb30_domain.dm</a>,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_HSIC] =3D &amp;<a href=3D"http://hsi=
c_domain.dm" rel=3D"noreferrer" target=3D"_blank">hsic_domain.dm</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_GMAC] =3D &amp;<a href=3D"http://gma=
c_domain.dm" rel=3D"noreferrer" target=3D"_blank">gmac_domain.dm</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_TS] =3D &amp;<a href=3D"http://ts_do=
main.dm" rel=3D"noreferrer" target=3D"_blank">ts_domain.dm</a>,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[DM_ZX296718_VOU] =3D &amp;<a href=3D"http://vou_=
domain.dm" rel=3D"noreferrer" target=3D"_blank">vou_domain.dm</a>,<br>
<br>
</div></div>If you update the order of DM_ZX296718_xxx in zte,pm_domains.h,=
 it would<br>
be nice to update this list accordingly as well.<br>
<span class=3D"gmail-"><br>
&gt; +};<br>
&gt; +<br>
&gt; +static int zx296718_pd_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return zx2967_pd_probe(pdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0zx296718_pm_domains,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ARRAY_SIZE(zx296718_pm_<wbr>domains));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id zx296718_pm_domain_matches[] =3D {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;zte,zx296718-pcu&quot;, }=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ },<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct platform_driver zx296718_pd_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;zx-po=
werdomain&quot;,<br>
<br>
</span>This is a zx296718 specific driver.=C2=A0 So zx296718-powerdomain sh=
ould<br>
be a better name?<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
Shawn<br>
</font></span><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =3D THIS_MODUL=
E,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D z=
x296718_pm_domain_matches,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D zx296718_pd_probe,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init zx296718_pd_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return platform_driver_register(&amp;<wbr>zx29671=
8_pd_driver);<br>
&gt; +}<br>
&gt; +subsys_initcall(zx296718_pd_<wbr>init);<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114abf4a4c2487054568bc4f--
