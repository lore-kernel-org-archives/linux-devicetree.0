Return-Path: <SRS0=tIwT=ZP=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAP=VYLqhAEKAdnO7skBU7V+NxbQqXs_UbOO0J1hYHmCq3aKQow@mail.gmail.com>
References: <1484623377-16208-1-git-send-email-baoyou.xie@linaro.org>
 <1484623377-16208-3-git-send-email-baoyou.xie@linaro.org> <CAP=VYLqhAEKAdnO7skBU7V+NxbQqXs_UbOO0J1hYHmCq3aKQow@mail.gmail.com>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Thu, 2 Feb 2017 11:35:14 +0800
Message-ID: <CA+DQWkxP4KJbJgVtSRMez0rfzgfxhZBKvzoBvVyRVR7DhyZOjQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] reset: zx2967: add reset controller driver for
 ZTE's zx2967 family
Content-Type: multipart/alternative; boundary=001a1140338a7d5382054783da96
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Jun Nie <jun.nie@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--001a1140338a7d5382054783da96
Content-Type: text/plain; charset=UTF-8

Hi, paul:
   Could you give more detailed log?

On 2 February 2017 at 10:37, Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:

> On Mon, Jan 16, 2017 at 10:22 PM, Baoyou Xie <baoyou.xie@linaro.org>
> wrote:
> > This patch adds reset controller driver for ZTE's zx2967 family.
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> > ---
> >  drivers/reset/Kconfig        |   6 +++
> >  drivers/reset/Makefile       |   1 +
> >  drivers/reset/reset-zx2967.c | 106 ++++++++++++++++++++++++++++++
> +++++++++++++
> >  3 files changed, 113 insertions(+)
> >  create mode 100644 drivers/reset/reset-zx2967.c
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 172dc96..f4cdfe9 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -86,6 +86,12 @@ config RESET_UNIPHIER
> >           Say Y if you want to control reset signals provided by System
> Control
> >           block, Media I/O block, Peripheral Block.
> >
> > +config RESET_ZX2967
> > +       bool "ZTE ZX2967 Reset Driver"
>
> This new driver just tripped my linux-next testing for non-modular code
> that is using modular infrastructure.  Is there any value in having this
> driver as a tristate, or should I send a patch to strip out the needless
> references to anything modular?
>
> Thanks,
> Paul.
> --
>
> > +       depends on ARCH_ZX || COMPILE_TEST
> > +       help
> > +         This enables the reset controller driver for ZTE's zx2967
> family.
> > +
> >  config RESET_ZYNQ
> >         bool "ZYNQ Reset Driver" if COMPILE_TEST
> >         default ARCH_ZYNQ
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index 13b346e..2cd3f6c 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -13,4 +13,5 @@ obj-$(CONFIG_RESET_STM32) += reset-stm32.o
> >  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
> >  obj-$(CONFIG_TI_SYSCON_RESET) += reset-ti-syscon.o
> >  obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
> > +obj-$(CONFIG_RESET_ZX2967) += reset-zx2967.o
> >  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
> > diff --git a/drivers/reset/reset-zx2967.c b/drivers/reset/reset-zx2967.c
> > new file mode 100644
> > index 0000000..5d82151
> > --- /dev/null
> > +++ b/drivers/reset/reset-zx2967.c
> > @@ -0,0 +1,106 @@
> > +/*
> > + * ZTE's zx2967 family reset controller driver
> > + *
> > + * Copyright (C) 2017 ZTE Ltd.
> > + *
> > + * Author: Baoyou Xie <baoyou.xie@linaro.org>
> > + *
> > + * License terms: GNU General Public License (GPL) version 2
> > + */
> > +
> > +#include <linux/module.h>
>
> [...]
>

--001a1140338a7d5382054783da96
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, paul:<br></div>=C2=A0=C2=A0 Could you give more d=
etailed log?<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On 2 February 2017 at 10:37, Paul Gortmaker <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:paul.gortmaker@windriver.com" target=3D"_blank">paul.gortmake=
r@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Mon, Jan 16, 2017 at 10:22 PM, Baoyou Xie &lt;<a href=3D"m=
ailto:baoyou.xie@linaro.org">baoyou.xie@linaro.org</a>&gt; wrote:<br>
&gt; This patch adds reset controller driver for ZTE&#39;s zx2967 family.<b=
r>
&gt;<br>
&gt; Signed-off-by: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org"=
>baoyou.xie@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/reset/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06=
 +++<br>
&gt;=C2=A0 drivers/reset/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01=
 +<br>
&gt;=C2=A0 drivers/reset/reset-zx2967.c | 106 +++++++++++++++++++++++++++++=
+<wbr>+++++++++++++<br>
&gt;=C2=A0 3 files changed, 113 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/reset/reset-zx2967.c<br>
&gt;<br>
&gt; diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig<br>
&gt; index 172dc96..f4cdfe9 100644<br>
&gt; --- a/drivers/reset/Kconfig<br>
&gt; +++ b/drivers/reset/Kconfig<br>
&gt; @@ -86,6 +86,12 @@ config RESET_UNIPHIER<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y if you want to control r=
eset signals provided by System Control<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block, Media I/O block, Periph=
eral Block.<br>
&gt;<br>
&gt; +config RESET_ZX2967<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ZTE ZX2967 Reset Driver&quot;<b=
r>
<br>
</span>This new driver just tripped my linux-next testing for non-modular c=
ode<br>
that is using modular infrastructure.=C2=A0 Is there any value in having th=
is<br>
driver as a tristate, or should I send a patch to strip out the needless<br=
>
references to anything modular?<br>
<br>
Thanks,<br>
Paul.<br>
--<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_ZX || COMPILE_TEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This enables the reset controller d=
river for ZTE&#39;s zx2967 family.<br>
&gt; +<br>
&gt;=C2=A0 config RESET_ZYNQ<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ZYNQ Reset Driver&quot; if=
 COMPILE_TEST<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default ARCH_ZYNQ<br>
&gt; diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile<br>
&gt; index 13b346e..2cd3f6c 100644<br>
&gt; --- a/drivers/reset/Makefile<br>
&gt; +++ b/drivers/reset/Makefile<br>
&gt; @@ -13,4 +13,5 @@ obj-$(CONFIG_RESET_STM32) +=3D reset-stm32.o<br>
&gt;=C2=A0 obj-$(CONFIG_RESET_SUNXI) +=3D reset-sunxi.o<br>
&gt;=C2=A0 obj-$(CONFIG_TI_SYSCON_RESET) +=3D reset-ti-syscon.o<br>
&gt;=C2=A0 obj-$(CONFIG_RESET_UNIPHIER) +=3D reset-uniphier.o<br>
&gt; +obj-$(CONFIG_RESET_ZX2967) +=3D reset-zx2967.o<br>
&gt;=C2=A0 obj-$(CONFIG_RESET_ZYNQ) +=3D reset-zynq.o<br>
&gt; diff --git a/drivers/reset/reset-zx2967.c b/drivers/reset/reset-zx2967=
.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..5d82151<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/reset/reset-zx2967.c<br>
&gt; @@ -0,0 +1,106 @@<br>
&gt; +/*<br>
&gt; + * ZTE&#39;s zx2967 family reset controller driver<br>
&gt; + *<br>
&gt; + * Copyright (C) 2017 ZTE Ltd.<br>
&gt; + *<br>
&gt; + * Author: Baoyou Xie &lt;<a href=3D"mailto:baoyou.xie@linaro.org">ba=
oyou.xie@linaro.org</a>&gt;<br>
&gt; + *<br>
&gt; + * License terms: GNU General Public License (GPL) version 2<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/module.h&gt;<br>
<br>
</div></div>[...]<br>
</blockquote></div><br></div>

--001a1140338a7d5382054783da96--
