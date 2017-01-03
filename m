Return-Path: <SRS0=jQri=YR=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170103113706.GB20956@dragon>
References: <1483434911-29421-1-git-send-email-baoyou.xie@linaro.org> <20170103113706.GB20956@dragon>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Tue, 3 Jan 2017 19:42:53 +0800
Message-ID: <CA+DQWkyYE4X7Cu2e7BgqTpih_V-49syrwVfN6pZZwV_K6oSyrA@mail.gmail.com>
Subject: Re: [PATCH v3] soc: zte: Add header for PM domains specifiers
Content-Type: multipart/alternative; boundary=001a114239ce3a917c05452f2ba6
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Jun Nie <jun.nie@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a114239ce3a917c05452f2ba6
Content-Type: text/plain; charset=UTF-8

On 3 January 2017 at 19:37, Shawn Guo <shawnguo@kernel.org> wrote:

> On Tue, Jan 03, 2017 at 05:15:11PM +0800, Baoyou Xie wrote:
> > This patch adds header with values used for zx96718
> > SoC's power domain driver.
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
>
> There is a hard dependency between this patch and the following one:
>
> [PATCH v4 2/3] soc: zte: pm_domains: Add support for zx296718 board
>
> For example, you renamed the header in this patch, and above one will
> not compile.  So you should either add this patch into power domain
> patch series before the one using the header, or you can just merge it
> into its user.
>
> I will make out a new version of above patch. And modify its dependency.


> Shawn
>
> > ---
> >  include/dt-bindings/soc/zte,pm_domains.h | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 include/dt-bindings/soc/zte,pm_domains.h
> >
> > diff --git a/include/dt-bindings/soc/zte,pm_domains.h
> b/include/dt-bindings/soc/zte,pm_domains.h
> > new file mode 100644
> > index 0000000..a64cfb8
> > --- /dev/null
> > +++ b/include/dt-bindings/soc/zte,pm_domains.h
> > @@ -0,0 +1,23 @@
> > +/*
> > + * Copyright (C) 2015 Linaro Ltd.
> > + *
> > + * Author: Baoyou Xie <baoyou.xie@linaro.org>
> > + * License terms: GNU General Public License (GPL) version 2
> > + */
> > +#ifndef _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H
> > +#define _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H
> > +
> > +#define DM_ZX296718_SAPPU    0
> > +#define DM_ZX296718_VDE              1  /* g1v6 */
> > +#define DM_ZX296718_VCE              2  /* h1v6 */
> > +#define DM_ZX296718_HDE              3  /* g2v2 */
> > +#define DM_ZX296718_VIU              4
> > +#define DM_ZX296718_USB20    5
> > +#define DM_ZX296718_USB21    6
> > +#define DM_ZX296718_USB30    7
> > +#define DM_ZX296718_HSIC     8
> > +#define DM_ZX296718_GMAC     9
> > +#define DM_ZX296718_TS               10
> > +#define DM_ZX296718_VOU              11
> > +
> > +#endif /* _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H */
> > --
> > 2.7.4
> >
>

--001a114239ce3a917c05452f2ba6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 3 January 2017 at 19:37, Shawn Guo <span dir=3D"ltr">&lt;<a href=3D"=
mailto:shawnguo@kernel.org" target=3D"_blank">shawnguo@kernel.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cla=
ss=3D"gmail-">On Tue, Jan 03, 2017 at 05:15:11PM +0800, Baoyou Xie wrote:<b=
r>
&gt; This patch adds header with values used for zx96718<br>
&gt; SoC&#39;s power domain driver.<br>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
>baoyou.xie@linaro.org</a>&gt;<br>
<br>
</span>There is a hard dependency between this patch and the following one:=
<br>
<br>
[PATCH v4 2/3] soc: zte: pm_domains: Add support for zx296718 board<br>
<br>
For example, you renamed the header in this patch, and above one will<br>
not compile.=C2=A0 So you should either add this patch into power domain<br=
>
patch series before the one using the header, or you can just merge it<br>
into its user.<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br></font></span></bl=
ockquote><div>I will make out a new version of above patch. And modify its =
dependency.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><span class=3D"gmail-HOEnZb"><font color=3D"#888888">
Shawn<br>
</font></span><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt; ---<br>
&gt;=C2=A0 include/dt-bindings/soc/zte,<wbr>pm_domains.h | 23 +++++++++++++=
++++++++++<br>
&gt;=C2=A0 1 file changed, 23 insertions(+)<br>
&gt;=C2=A0 create mode 100644 include/dt-bindings/soc/zte,<wbr>pm_domains.h=
<br>
&gt;<br>
&gt; diff --git a/include/dt-bindings/soc/zte,<wbr>pm_domains.h b/include/d=
t-bindings/soc/zte,<wbr>pm_domains.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..a64cfb8<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/dt-bindings/soc/zte,<wbr>pm_domains.h<br>
&gt; @@ -0,0 +1,23 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2015 Linaro Ltd.<br>
&gt; + *<br>
&gt; + * Author: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">ba=
oyou.xie@linaro.org</a>&gt;<br>
&gt; + * License terms: GNU General Public License (GPL) version 2<br>
&gt; + */<br>
&gt; +#ifndef _DT_BINDINGS_SOC_ZTE_PM_<wbr>DOMAINS_H<br>
&gt; +#define _DT_BINDINGS_SOC_ZTE_PM_<wbr>DOMAINS_H<br>
&gt; +<br>
&gt; +#define DM_ZX296718_SAPPU=C2=A0 =C2=A0 0<br>
&gt; +#define DM_ZX296718_VDE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1=C2=A0 /* g1v6 */<br>
&gt; +#define DM_ZX296718_VCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 2=C2=A0 /* h1v6 */<br>
&gt; +#define DM_ZX296718_HDE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 3=C2=A0 /* g2v2 */<br>
&gt; +#define DM_ZX296718_VIU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 4<br>
&gt; +#define DM_ZX296718_USB20=C2=A0 =C2=A0 5<br>
&gt; +#define DM_ZX296718_USB21=C2=A0 =C2=A0 6<br>
&gt; +#define DM_ZX296718_USB30=C2=A0 =C2=A0 7<br>
&gt; +#define DM_ZX296718_HSIC=C2=A0 =C2=A0 =C2=A08<br>
&gt; +#define DM_ZX296718_GMAC=C2=A0 =C2=A0 =C2=A09<br>
&gt; +#define DM_ZX296718_TS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A010<br>
&gt; +#define DM_ZX296718_VOU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 11<br>
&gt; +<br>
&gt; +#endif /* _DT_BINDINGS_SOC_ZTE_PM_<wbr>DOMAINS_H */<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114239ce3a917c05452f2ba6--
