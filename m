Return-Path: <kesavan.abhilash@gmail.com>
MIME-Version: 1.0
In-Reply-To: <002101cf79a0$50fba0f0$f2f2e2d0$@samsung.com>
References: <1399307221-8659-1-git-send-email-a.kesavan@samsung.com>
	<1399307221-8659-6-git-send-email-a.kesavan@samsung.com>
	<201405271307.56729.arnd@arndb.de>
	<002101cf79a0$50fba0f0$f2f2e2d0$@samsung.com>
Date: Tue, 27 May 2014 19:55:57 +0530
Message-ID: <CAM4voam6COBcjZQkqkCC-yYB3dOw1UPNTyDgFNZHJyr3tD3VFA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] arm: exynos: Add MCPM call-back functions
From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c2bb4c667a9f04fa6279f5
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Martin <Dave.Martin@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Tomasz Figa <t.figa@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, "inderpal.s@samsung.com" <inderpal.s@samsung.com>, "mark.rutland" <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, robh+dt <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a11c2bb4c667a9f04fa6279f5
Content-Type: text/plain; charset=UTF-8

Hi Kukjin and Arnd,

On Tue, May 27, 2014 at 5:09 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> Arnd Bergmann wrote:
> >
> > On Monday 05 May 2014, Abhilash Kesavan wrote:
> > > +static const struct mcpm_platform_ops exynos_power_ops = {
> > > +       .power_up               = exynos_power_up,
> > > +       .power_down             = exynos_power_down,
> > > +       .power_down_finish      = exynos_power_down_finish,
> > > +};
> >
> >
> > I'm getting a build error in linux-next because there is
> > no .power_down_finish
> > member in mcpm_platform_ops here.
> >
> Yeah, commit 166aaf39 ("ARM: 8029/1: mcpm: Rename the power_down_finish()
> functions to be less confusing") changed the name to
> wait_for_cpu_powerdown...
>
> So need to change it accordingly...
>
> diff --git a/arch/arm/mach-exynos/mcpm-exynos.c
> b/arch/arm/mach-exynos/mcpm-exynos.c
> index 1ac618c..34c4e6f 100644
> --- a/arch/arm/mach-exynos/mcpm-exynos.c
> +++ b/arch/arm/mach-exynos/mcpm-exynos.c
> @@ -235,7 +235,7 @@ static void exynos_power_down(void)
>         /* Not dead at this point?  Let our caller cope. */
>  }
>
> -static int exynos_power_down_finish(unsigned int cpu, unsigned int
> cluster)
> +static int exynos_wait_for_powerdown(unsigned int cpu, unsigned int
> cluster)
>  {
>         unsigned int tries = 100;
>         unsigned int cpunr = cpu + (cluster * EXYNOS5420_CPUS_PER_CLUSTER);
> @@ -261,7 +261,7 @@ static int exynos_power_down_finish(unsigned int cpu,
> unsigned int cluster)
>  static const struct mcpm_platform_ops exynos_power_ops = {
>         .power_up               = exynos_power_up,
>         .power_down             = exynos_power_down,
> -       .power_down_finish      = exynos_power_down_finish,
> +       .wait_for_powerdown     = exynos_wait_for_powerdown,
>  };
>
>  static void __init exynos_mcpm_usage_count_init(void)
>

The above change seems fine. Will this be directly applied or do I need to
send out a patch ?

Regards,
Abhilash

--001a11c2bb4c667a9f04fa6279f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Kukjin and Arnd,<div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Tue, May 27, 2014 at 5:09 PM, Kukjin Kim <span dir=3D=
"ltr">&lt;<a href=3D"mailto:kgene.kim@samsung.com" target=3D"_blank">kgene.=
kim@samsung.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">Arnd=
 Bergmann wrote:<br>
&gt;<br>
&gt; On Monday 05 May 2014, Abhilash Kesavan wrote:<br>
&gt; &gt; +static const struct mcpm_platform_ops exynos_power_ops =3D {<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 .power_up =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D exynos_power_up,<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 .power_down =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D exynos_power_down,<br>
&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 .power_down_finish =C2=A0 =C2=A0 =C2=A0=3D=
 exynos_power_down_finish,<br>
&gt; &gt; +};<br>
&gt;<br>
&gt;<br>
&gt; I&#39;m getting a build error in linux-next because there is<br>
&gt; no .power_down_finish<br>
&gt; member in mcpm_platform_ops here.<br>
&gt;<br>
</div></div>Yeah, commit 166aaf39 (&quot;ARM: 8029/1: mcpm: Rename the powe=
r_down_finish()<br>
functions to be less confusing&quot;) changed the name to<br>
wait_for_cpu_powerdown...<br>
<br>
So need to change it accordingly...<br>
<br>
diff --git a/arch/arm/mach-exynos/mcpm-exynos.c<br>
b/arch/arm/mach-exynos/mcpm-exynos.c<br>
index 1ac618c..34c4e6f 100644<br>
--- a/arch/arm/mach-exynos/mcpm-exynos.c<br>
+++ b/arch/arm/mach-exynos/mcpm-exynos.c<br>
@@ -235,7 +235,7 @@ static void exynos_power_down(void)<br>
<div class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Not dead at this point? =C2=
=A0Let our caller cope. */<br>
=C2=A0}<br>
<br>
</div><div class=3D"">-static int exynos_power_down_finish(unsigned int cpu=
, unsigned int cluster)<br>
</div>+static int exynos_wait_for_powerdown(unsigned int cpu, unsigned int<=
br>
cluster)<br>
=C2=A0{<br>
<div class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int tries =3D 100;<br>
</div><div class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int cpunr =3D cp=
u + (cluster * EXYNOS5420_CPUS_PER_CLUSTER);<br>
</div>@@ -261,7 +261,7 @@ static int exynos_power_down_finish(unsigned int =
cpu,<br>
unsigned int cluster)<br>
<div class=3D"">=C2=A0static const struct mcpm_platform_ops exynos_power_op=
s =3D {<br>
</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 .power_up =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D exynos_power_up,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .power_down =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D exynos_power_down,<br>
- =C2=A0 =C2=A0 =C2=A0 .power_down_finish =C2=A0 =C2=A0 =C2=A0=3D exynos_po=
wer_down_finish,<br>
+ =C2=A0 =C2=A0 =C2=A0 .wait_for_powerdown =C2=A0 =C2=A0 =3D exynos_wait_fo=
r_powerdown,<br>
=C2=A0};<br>
<br>
=C2=A0static void __init exynos_mcpm_usage_count_init(void)<br></blockquote=
><div><br></div><div>The above change seems fine. Will this be directly app=
lied or do I need to send out a patch ?=C2=A0</div><div><br></div><div>Rega=
rds,</div>
<div>Abhilash</div></div><br></div></div>

--001a11c2bb4c667a9f04fa6279f5--
