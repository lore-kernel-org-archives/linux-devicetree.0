Return-Path: <hns@goldelico.com>
Subject: Re: [PATCH 3/3] arm: dts: Add gta04a5 model
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/alternative; boundary=Apple-Mail-231-921931317
From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAOf5uw=Fm9FXEH5ESqDC8pGjMbn5VQ1+MyPJVXSqGh_9+JRLHw@mail.gmail.com>
Date: Mon, 28 Jul 2014 22:12:57 +0200
Message-Id: <04AA9B1D-55F0-4F92-9696-E374808DC899@goldelico.com>
References: <1406577213-9642-1-git-send-email-marek@goldelico.com> <1406577213-9642-4-git-send-email-marek@goldelico.com> <CAOf5uwk=ctww=pP4Ae+1C6i-oOtiYTv2NJbj1GpuPwVSKXB4Hw@mail.gmail.com> <CAAfyv35jvhzvjCKMwrpa=RQ1JkfcmthCsGDzwLW9Y6bq3Ww_fg@mail.gmail.com> <CAOf5uw=Fm9FXEH5ESqDC8pGjMbn5VQ1+MyPJVXSqGh_9+JRLHw@mail.gmail.com>
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Marek Belisko <marek.belisko@gmail.com>, pawel.moll@arm.com, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Benoit Cousson <bcousson@baylibre.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


--Apple-Mail-231-921931317
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Am 28.07.2014 um 22:04 schrieb Michael Trimarchi:

> Hi
>=20
> Il 28/lug/2014 22:02 "Belisko Marek" <marek.belisko@gmail.com> ha =
scritto:
> >
> > Hi Michael,
> >
> > On Mon, Jul 28, 2014 at 9:56 PM, Michael Trimarchi
> > <michael@amarulasolutions.com> wrote:
> > > Hi Marek
> > >
> > > Il 28/lug/2014 21:54 "Marek Belisko" <marek@goldelico.com> ha =
scritto:
> > >
> > >
> > >>
> > >> Add model a5 which have additional jack detection.
> > >>
> > >> Signed-off-by: Marek Belisko <marek@goldelico.com>
> > >> ---
> > >>  arch/arm/boot/dts/Makefile          |  1 +
> > >>  arch/arm/boot/dts/omap3-gta04a5.dts | 17 +++++++++++++++++
> > >>  2 files changed, 18 insertions(+)
> > >>  create mode 100644 arch/arm/boot/dts/omap3-gta04a5.dts
> > >>
> > >> diff --git a/arch/arm/boot/dts/Makefile =
b/arch/arm/boot/dts/Makefile
> > >> index 7d45fde..576c595 100644
> > >> --- a/arch/arm/boot/dts/Makefile
> > >> +++ b/arch/arm/boot/dts/Makefile
> > >> @@ -285,6 +285,7 @@ dtb-$(CONFIG_ARCH_OMAP3) +=3D =
am3517-craneboard.dtb \
> > >>         omap3-evm-37xx.dtb \
> > >>         omap3-gta04a3.dtb \
> > >>         omap3-gta04a4.dtb \
> > >> +       omap3-gta04a5.dtb \
> > >>         omap3-igep0020.dtb \
> > >>         omap3-igep0030.dtb \
> > >>         omap3-ldp.dtb \
> > >> diff --git a/arch/arm/boot/dts/omap3-gta04a5.dts
> > >> b/arch/arm/boot/dts/omap3-gta04a5.dts
> > >> new file mode 100644
> > >> index 0000000..210317c3
> > >> --- /dev/null
> > >> +++ b/arch/arm/boot/dts/omap3-gta04a5.dts
> > >> @@ -0,0 +1,17 @@
> > >> +/*
> > >> + * Copyright (C) 2014 H. Nikolaus Schaller <hns@goldelico.com>
> > >> + *
> > >> + * This program is free software; you can redistribute it and/or =
modify
> > >> + * it under the terms of the GNU General Public License version =
2 as
> > >> + * published by the Free Software Foundation.
> > >> + */
> > >> +
> > >> +#include "omap3-gta04.dtsi"
> > >> +
> > >> +/ {
> > >> +       model =3D "Goldelico GTA04A5;
> > >> +
> > >> +       sound {
> > >> +               ti,jack-det-gpio =3D <&twl_gpio 2 0>;    /* =
GTA04A5 only */
> > >> +       };
> > >> +};
> > >> --
> > >> 1.9.1
> > >>
> > >
> > > Can we have only one dts with status enabled/disabled?
> > Do you mean to define this node it gta04.dtsi disabled and enable =
only
> > for a5 model?
> > >
>=20
> This should be possible in the bootloader
>=20

Yes,
the boot loader either loads gta04a3.dtb gta04.dtb or gta05.dtb
depending on board revision.

Therefore we have multiple device tree files to represent such hardware
differences. Like Gumstix Overo variants (using a  =
omap3-overo-base.dtsi)

And, this difference is not the only one. Other are to come later.

Unfortunately we were recommend to submit only DT nodes that already
have drivers. Therefore, the "big picture" of the device variants =
support
may not yet be visible from this patch.

I hope this gives a little background.

BR,
Nikolaus






--Apple-Mail-231-921931317
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>Am 28.07.2014 um 22:04 schrieb Michael =
Trimarchi:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><p dir=3D"ltr">Hi</p><p dir=3D"ltr">Il 28/lug/2014 22:02 =
"Belisko Marek" &lt;<a =
href=3D"mailto:marek.belisko@gmail.com">marek.belisko@gmail.com</a>&gt; =
ha scritto:<br>
&gt;<br>
&gt; Hi Michael,<br>
&gt;<br>
&gt; On Mon, Jul 28, 2014 at 9:56 PM, Michael Trimarchi<br>
&gt; &lt;<a =
href=3D"mailto:michael@amarulasolutions.com">michael@amarulasolutions.com<=
/a>&gt; wrote:<br>
&gt; &gt; Hi Marek<br>
&gt; &gt;<br>
&gt; &gt; Il 28/lug/2014 21:54 "Marek Belisko" &lt;<a =
href=3D"mailto:marek@goldelico.com">marek@goldelico.com</a>&gt; ha =
scritto:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Add model a5 which have additional jack detection.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Marek Belisko &lt;<a =
href=3D"mailto:marek@goldelico.com">marek@goldelico.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt; &nbsp;arch/arm/boot/dts/Makefile &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;| &nbsp;1 +<br>
&gt; &gt;&gt; &nbsp;arch/arm/boot/dts/omap3-gta04a5.dts | 17 =
+++++++++++++++++<br>
&gt; &gt;&gt; &nbsp;2 files changed, 18 insertions(+)<br>
&gt; &gt;&gt; &nbsp;create mode 100644 =
arch/arm/boot/dts/omap3-gta04a5.dts<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/arch/arm/boot/dts/Makefile =
b/arch/arm/boot/dts/Makefile<br>
&gt; &gt;&gt; index 7d45fde..576c595 100644<br>
&gt; &gt;&gt; --- a/arch/arm/boot/dts/Makefile<br>
&gt; &gt;&gt; +++ b/arch/arm/boot/dts/Makefile<br>
&gt; &gt;&gt; @@ -285,6 +285,7 @@ dtb-$(CONFIG_ARCH_OMAP3) +=3D =
am3517-craneboard.dtb \<br>
&gt; &gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; omap3-evm-37xx.dtb \<br>
&gt; &gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; omap3-gta04a3.dtb \<br>
&gt; &gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; omap3-gta04a4.dtb \<br>
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; omap3-gta04a5.dtb \<br>
&gt; &gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; omap3-igep0020.dtb \<br>
&gt; &gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; omap3-igep0030.dtb \<br>
&gt; &gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; omap3-ldp.dtb \<br>
&gt; &gt;&gt; diff --git a/arch/arm/boot/dts/omap3-gta04a5.dts<br>
&gt; &gt;&gt; b/arch/arm/boot/dts/omap3-gta04a5.dts<br>
&gt; &gt;&gt; new file mode 100644<br>
&gt; &gt;&gt; index 0000000..210317c3<br>
&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt;&gt; +++ b/arch/arm/boot/dts/omap3-gta04a5.dts<br>
&gt; &gt;&gt; @@ -0,0 +1,17 @@<br>
&gt; &gt;&gt; +/*<br>
&gt; &gt;&gt; + * Copyright (C) 2014 H. Nikolaus Schaller &lt;<a =
href=3D"mailto:hns@goldelico.com">hns@goldelico.com</a>&gt;<br>
&gt; &gt;&gt; + *<br>
&gt; &gt;&gt; + * This program is free software; you can redistribute it =
and/or modify<br>
&gt; &gt;&gt; + * it under the terms of the GNU General Public License =
version 2 as<br>
&gt; &gt;&gt; + * published by the Free Software Foundation.<br>
&gt; &gt;&gt; + */<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +#include "omap3-gta04.dtsi"<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +/ {<br>
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; model =3D "Goldelico GTA04A5;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; sound {<br>
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
ti,jack-det-gpio =3D &lt;&amp;twl_gpio 2 0&gt;; &nbsp; &nbsp;/* GTA04A5 =
only */<br>
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp; };<br>
&gt; &gt;&gt; +};<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 1.9.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Can we have only one dts with status enabled/disabled?<br>
&gt; Do you mean to define this node it gta04.dtsi disabled and enable =
only<br>
&gt; for a5 model?<br>
&gt; &gt;</p><p dir=3D"ltr">This should be possible in the =
bootloader</p></blockquote><br></div><div>Yes,</div><div>the boot loader =
either loads gta04a3.dtb gta04.dtb or gta05.dtb</div><div>depending on =
board revision.</div><div><br></div><div>Therefore we have multiple =
device tree files to represent such hardware</div><div>differences. Like =
Gumstix Overo variants (using a&nbsp;&nbsp;omap3-overo-base.dtsi<span =
class=3D"Apple-style-span" style=3D"font-family: sans-serif; =
font-weight: bold; font-size: small; =
">)</span></div><div><br></div><div>And, this difference is not the only =
one. Other are to come later.</div><div><br></div><div>Unfortunately we =
were recommend to submit only DT nodes that already</div><div>have =
drivers. Therefore, the "big picture" of the device variants =
support</div><div>may not&nbsp;yet be visible from this =
patch.</div><div><br></div><div>I hope this gives a little =
background.</div><div><br></div><div>BR,</div><div>Nikolaus</div><div><br>=
</div><div><br></div><div><br></div><div><br></div><br></body></html>=

--Apple-Mail-231-921931317--
