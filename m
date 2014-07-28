Return-Path: <michael@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <CAAfyv351g1R6TnmW+JKM1sDQsegEFExV6p9BEN=izOdR4n8zEQ@mail.gmail.com>
References: <1406577213-9642-1-git-send-email-marek@goldelico.com>
	<1406577213-9642-4-git-send-email-marek@goldelico.com>
	<CAOf5uwk=ctww=pP4Ae+1C6i-oOtiYTv2NJbj1GpuPwVSKXB4Hw@mail.gmail.com>
	<CAAfyv35jvhzvjCKMwrpa=RQ1JkfcmthCsGDzwLW9Y6bq3Ww_fg@mail.gmail.com>
	<CAOf5uw=Fm9FXEH5ESqDC8pGjMbn5VQ1+MyPJVXSqGh_9+JRLHw@mail.gmail.com>
	<CAAfyv351g1R6TnmW+JKM1sDQsegEFExV6p9BEN=izOdR4n8zEQ@mail.gmail.com>
Date: Mon, 28 Jul 2014 22:12:00 +0200
Message-ID: <CAOf5uwmjznuK_1au1HnsnYh=BhqC=x+O_tpk6U71bqPv=hFe_A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm: dts: Add gta04a5 model
From: Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: multipart/alternative; boundary=047d7b86e8ba2758a304ff468918
To: Marek Belisko <marek.belisko@gmail.com>
Cc: Kumar Gala <galak@codeaurora.org>, pawel.moll@arm.com, Benoit Cousson <bcousson@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--047d7b86e8ba2758a304ff468918
Content-Type: text/plain; charset=UTF-8

Hi

Il 28/lug/2014 22:06 "Belisko Marek" <marek.belisko@gmail.com> ha scritto:
>
> On Mon, Jul 28, 2014 at 10:04 PM, Michael Trimarchi
> <michael@amarulasolutions.com> wrote:
> > Hi
> >
> > Il 28/lug/2014 22:02 "Belisko Marek" <marek.belisko@gmail.com> ha
scritto:
> >
> >
> >>
> >> Hi Michael,
> >>
> >> On Mon, Jul 28, 2014 at 9:56 PM, Michael Trimarchi
> >> <michael@amarulasolutions.com> wrote:
> >> > Hi Marek
> >> >
> >> > Il 28/lug/2014 21:54 "Marek Belisko" <marek@goldelico.com> ha
scritto:
> >> >
> >> >
> >> >>
> >> >> Add model a5 which have additional jack detection.
> >> >>
> >> >> Signed-off-by: Marek Belisko <marek@goldelico.com>
> >> >> ---
> >> >>  arch/arm/boot/dts/Makefile          |  1 +
> >> >>  arch/arm/boot/dts/omap3-gta04a5.dts | 17 +++++++++++++++++
> >> >>  2 files changed, 18 insertions(+)
> >> >>  create mode 100644 arch/arm/boot/dts/omap3-gta04a5.dts
> >> >>
> >> >> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >> >> index 7d45fde..576c595 100644
> >> >> --- a/arch/arm/boot/dts/Makefile
> >> >> +++ b/arch/arm/boot/dts/Makefile
> >> >> @@ -285,6 +285,7 @@ dtb-$(CONFIG_ARCH_OMAP3) +=
am3517-craneboard.dtb \
> >> >>         omap3-evm-37xx.dtb \
> >> >>         omap3-gta04a3.dtb \
> >> >>         omap3-gta04a4.dtb \
> >> >> +       omap3-gta04a5.dtb \
> >> >>         omap3-igep0020.dtb \
> >> >>         omap3-igep0030.dtb \
> >> >>         omap3-ldp.dtb \
> >> >> diff --git a/arch/arm/boot/dts/omap3-gta04a5.dts
> >> >> b/arch/arm/boot/dts/omap3-gta04a5.dts
> >> >> new file mode 100644
> >> >> index 0000000..210317c3
> >> >> --- /dev/null
> >> >> +++ b/arch/arm/boot/dts/omap3-gta04a5.dts
> >> >> @@ -0,0 +1,17 @@
> >> >> +/*
> >> >> + * Copyright (C) 2014 H. Nikolaus Schaller <hns@goldelico.com>
> >> >> + *
> >> >> + * This program is free software; you can redistribute it and/or
> >> >> modify
> >> >> + * it under the terms of the GNU General Public License version 2
as
> >> >> + * published by the Free Software Foundation.
> >> >> + */
> >> >> +
> >> >> +#include "omap3-gta04.dtsi"
> >> >> +
> >> >> +/ {
> >> >> +       model = "Goldelico GTA04A5;
> >> >> +
> >> >> +       sound {
> >> >> +               ti,jack-det-gpio = <&twl_gpio 2 0>;    /* GTA04A5
only
> >> >> */
> >> >> +       };
> >> >> +};
> >> >> --
> >> >> 1.9.1
> >> >>
> >> >
> >> > Can we have only one dts with status enabled/disabled?
> >> Do you mean to define this node it gta04.dtsi disabled and enable only
> >> for a5 model?
> >> >
> >
> > This should be possible in the bootloader
> Sorry I didn't get that. Can you give me some short example (or
> existing board which using it)?
> Thanks.
> >

http://www.denx.de/wiki/view/DULG/UBootCmdFDT

I just suggest to not create a dts for each board revision but let it
manage by the bootloader. I don't know if there are examples but make sense
to me to avoid to add a lot of dts.

Michael

> > Right?
> >
> > Michael
> >
> >> > Michael
> >> >
> >> >> --
> >> >> To unsubscribe from this list: send the line "unsubscribe
linux-omap"
> >> >> in
> >> >> the body of a message to majordomo@vger.kernel.org
> >> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>
> >> BR,
> >>
> >> marek
> >>
> >> --
> >> as simple and primitive as possible
> >> -------------------------------------------------
> >> Marek Belisko - OPEN-NANDRA
> >> Freelance Developer
> >>
> >> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> >> Tel: +421 915 052 184
> >> skype: marekwhite
> >> twitter: #opennandra
> >> web: http://open-nandra.com
>
> BR,
>
> marek
>
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com

--047d7b86e8ba2758a304ff468918
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi</p>
<p dir=3D"ltr">Il 28/lug/2014 22:06 &quot;Belisko Marek&quot; &lt;<a href=
=3D"mailto:marek.belisko@gmail.com">marek.belisko@gmail.com</a>&gt; ha scri=
tto:<br>
&gt;<br>
&gt; On Mon, Jul 28, 2014 at 10:04 PM, Michael Trimarchi<br>
&gt; &lt;<a href=3D"mailto:michael@amarulasolutions.com">michael@amarulasol=
utions.com</a>&gt; wrote:<br>
&gt; &gt; Hi<br>
&gt; &gt;<br>
&gt; &gt; Il 28/lug/2014 22:02 &quot;Belisko Marek&quot; &lt;<a href=3D"mai=
lto:marek.belisko@gmail.com">marek.belisko@gmail.com</a>&gt; ha scritto:<br=
>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hi Michael,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Mon, Jul 28, 2014 at 9:56 PM, Michael Trimarchi<br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:michael@amarulasolutions.com">michael@a=
marulasolutions.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; Hi Marek<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Il 28/lug/2014 21:54 &quot;Marek Belisko&quot; &lt;<a hr=
ef=3D"mailto:marek@goldelico.com">marek@goldelico.com</a>&gt; ha scritto:<b=
r>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Add model a5 which have additional jack detection.<b=
r>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Signed-off-by: Marek Belisko &lt;<a href=3D"mailto:m=
arek@goldelico.com">marek@goldelico.com</a>&gt;<br>
&gt; &gt;&gt; &gt;&gt; ---<br>
&gt; &gt;&gt; &gt;&gt; =C2=A0arch/arm/boot/dts/Makefile =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A01 +<br>
&gt; &gt;&gt; &gt;&gt; =C2=A0arch/arm/boot/dts/omap3-gta04a5.dts | 17 +++++=
++++++++++++<br>
&gt; &gt;&gt; &gt;&gt; =C2=A02 files changed, 18 insertions(+)<br>
&gt; &gt;&gt; &gt;&gt; =C2=A0create mode 100644 arch/arm/boot/dts/omap3-gta=
04a5.dts<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/b=
oot/dts/Makefile<br>
&gt; &gt;&gt; &gt;&gt; index 7d45fde..576c595 100644<br>
&gt; &gt;&gt; &gt;&gt; --- a/arch/arm/boot/dts/Makefile<br>
&gt; &gt;&gt; &gt;&gt; +++ b/arch/arm/boot/dts/Makefile<br>
&gt; &gt;&gt; &gt;&gt; @@ -285,6 +285,7 @@ dtb-$(CONFIG_ARCH_OMAP3) +=3D am=
3517-craneboard.dtb \<br>
&gt; &gt;&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-evm-37xx.dtb \<br>
&gt; &gt;&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-gta04a3.dtb \<br>
&gt; &gt;&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-gta04a4.dtb \<br>
&gt; &gt;&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 omap3-gta04a5.dtb \<br>
&gt; &gt;&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-igep0020.dtb \<br>
&gt; &gt;&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-igep0030.dtb \<br>
&gt; &gt;&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-ldp.dtb \<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/arch/arm/boot/dts/omap3-gta04a5.dts<br>
&gt; &gt;&gt; &gt;&gt; b/arch/arm/boot/dts/omap3-gta04a5.dts<br>
&gt; &gt;&gt; &gt;&gt; new file mode 100644<br>
&gt; &gt;&gt; &gt;&gt; index 0000000..210317c3<br>
&gt; &gt;&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt;&gt; &gt;&gt; +++ b/arch/arm/boot/dts/omap3-gta04a5.dts<br>
&gt; &gt;&gt; &gt;&gt; @@ -0,0 +1,17 @@<br>
&gt; &gt;&gt; &gt;&gt; +/*<br>
&gt; &gt;&gt; &gt;&gt; + * Copyright (C) 2014 H. Nikolaus Schaller &lt;<a h=
ref=3D"mailto:hns@goldelico.com">hns@goldelico.com</a>&gt;<br>
&gt; &gt;&gt; &gt;&gt; + *<br>
&gt; &gt;&gt; &gt;&gt; + * This program is free software; you can redistrib=
ute it and/or<br>
&gt; &gt;&gt; &gt;&gt; modify<br>
&gt; &gt;&gt; &gt;&gt; + * it under the terms of the GNU General Public Lic=
ense version 2 as<br>
&gt; &gt;&gt; &gt;&gt; + * published by the Free Software Foundation.<br>
&gt; &gt;&gt; &gt;&gt; + */<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt; +#include &quot;omap3-gta04.dtsi&quot;<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt; +/ {<br>
&gt; &gt;&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 model =3D &quot;Goldelico GTA=
04A5;<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 sound {<br>
&gt; &gt;&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
i,jack-det-gpio =3D &lt;&amp;twl_gpio 2 0&gt;; =C2=A0 =C2=A0/* GTA04A5 only=
<br>
&gt; &gt;&gt; &gt;&gt; */<br>
&gt; &gt;&gt; &gt;&gt; + =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt;&gt; &gt;&gt; +};<br>
&gt; &gt;&gt; &gt;&gt; --<br>
&gt; &gt;&gt; &gt;&gt; 1.9.1<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Can we have only one dts with status enabled/disabled?<b=
r>
&gt; &gt;&gt; Do you mean to define this node it gta04.dtsi disabled and en=
able only<br>
&gt; &gt;&gt; for a5 model?<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; This should be possible in the bootloader<br>
&gt; Sorry I didn&#39;t get that. Can you give me some short example (or<br=
>
&gt; existing board which using it)?<br>
&gt; Thanks.<br>
&gt; &gt;</p>
<p dir=3D"ltr"><a href=3D"http://www.denx.de/wiki/view/DULG/UBootCmdFDT">ht=
tp://www.denx.de/wiki/view/DULG/UBootCmdFDT</a></p>
<p dir=3D"ltr">I just suggest to not create a dts for each board revision b=
ut let it manage by the bootloader. I don&#39;t know if there are examples =
but make sense to me to avoid to add a lot of dts.</p>
<p dir=3D"ltr">Michael<br></p>
<p dir=3D"ltr">&gt; &gt; Right?<br>
&gt; &gt;<br>
&gt; &gt; Michael<br>
&gt; &gt;<br>
&gt; &gt;&gt; &gt; Michael<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; --<br>
&gt; &gt;&gt; &gt;&gt; To unsubscribe from this list: send the line &quot;u=
nsubscribe linux-omap&quot;<br>
&gt; &gt;&gt; &gt;&gt; in<br>
&gt; &gt;&gt; &gt;&gt; the body of a message to <a href=3D"mailto:majordomo=
@vger.kernel.org">majordomo@vger.kernel.org</a><br>
&gt; &gt;&gt; &gt;&gt; More majordomo info at =C2=A0<a href=3D"http://vger.=
kernel.org/majordomo-info.html">http://vger.kernel.org/majordomo-info.html<=
/a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; BR,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; marek<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; as simple and primitive as possible<br>
&gt; &gt;&gt; -------------------------------------------------<br>
&gt; &gt;&gt; Marek Belisko - OPEN-NANDRA<br>
&gt; &gt;&gt; Freelance Developer<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Ruska Nova Ves 219 | Presov, 08005 Slovak Republic<br>
&gt; &gt;&gt; Tel: +421 915 052 184<br>
&gt; &gt;&gt; skype: marekwhite<br>
&gt; &gt;&gt; twitter: #opennandra<br>
&gt; &gt;&gt; web: <a href=3D"http://open-nandra.com">http://open-nandra.co=
m</a><br>
&gt;<br>
&gt; BR,<br>
&gt;<br>
&gt; marek<br>
&gt;<br>
&gt; --<br>
&gt; as simple and primitive as possible<br>
&gt; -------------------------------------------------<br>
&gt; Marek Belisko - OPEN-NANDRA<br>
&gt; Freelance Developer<br>
&gt;<br>
&gt; Ruska Nova Ves 219 | Presov, 08005 Slovak Republic<br>
&gt; Tel: +421 915 052 184<br>
&gt; skype: marekwhite<br>
&gt; twitter: #opennandra<br>
&gt; web: <a href=3D"http://open-nandra.com">http://open-nandra.com</a><br>
</p>

--047d7b86e8ba2758a304ff468918--
