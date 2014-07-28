Return-Path: <michael@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <1406577213-9642-4-git-send-email-marek@goldelico.com>
References: <1406577213-9642-1-git-send-email-marek@goldelico.com>
	<1406577213-9642-4-git-send-email-marek@goldelico.com>
Date: Mon, 28 Jul 2014 21:56:14 +0200
Message-ID: <CAOf5uwk=ctww=pP4Ae+1C6i-oOtiYTv2NJbj1GpuPwVSKXB4Hw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm: dts: Add gta04a5 model
From: Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: multipart/alternative; boundary=047d7b86e8bac52ad304ff46505b
To: Marek Belisko <marek@goldelico.com>
Cc: hns@goldelico.com, galak@codeaurora.org, bcousson@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org, tony@atomide.com, linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, ijc+devicetree@hellion.org.uk, linux-arm-kernel@lists.infradead.org, pawel.moll@arm.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--047d7b86e8bac52ad304ff46505b
Content-Type: text/plain; charset=UTF-8

Hi Marek

Il 28/lug/2014 21:54 "Marek Belisko" <marek@goldelico.com> ha scritto:
>
> Add model a5 which have additional jack detection.
>
> Signed-off-by: Marek Belisko <marek@goldelico.com>
> ---
>  arch/arm/boot/dts/Makefile          |  1 +
>  arch/arm/boot/dts/omap3-gta04a5.dts | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 arch/arm/boot/dts/omap3-gta04a5.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7d45fde..576c595 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -285,6 +285,7 @@ dtb-$(CONFIG_ARCH_OMAP3) += am3517-craneboard.dtb \
>         omap3-evm-37xx.dtb \
>         omap3-gta04a3.dtb \
>         omap3-gta04a4.dtb \
> +       omap3-gta04a5.dtb \
>         omap3-igep0020.dtb \
>         omap3-igep0030.dtb \
>         omap3-ldp.dtb \
> diff --git a/arch/arm/boot/dts/omap3-gta04a5.dts
b/arch/arm/boot/dts/omap3-gta04a5.dts
> new file mode 100644
> index 0000000..210317c3
> --- /dev/null
> +++ b/arch/arm/boot/dts/omap3-gta04a5.dts
> @@ -0,0 +1,17 @@
> +/*
> + * Copyright (C) 2014 H. Nikolaus Schaller <hns@goldelico.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include "omap3-gta04.dtsi"
> +
> +/ {
> +       model = "Goldelico GTA04A5;
> +
> +       sound {
> +               ti,jack-det-gpio = <&twl_gpio 2 0>;    /* GTA04A5 only */
> +       };
> +};
> --
> 1.9.1
>

Can we have only one dts with status enabled/disabled?

Michael

> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--047d7b86e8bac52ad304ff46505b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Marek</p>
<p dir=3D"ltr">Il 28/lug/2014 21:54 &quot;Marek Belisko&quot; &lt;<a href=
=3D"mailto:marek@goldelico.com">marek@goldelico.com</a>&gt; ha scritto:<br>
&gt;<br>
&gt; Add model a5 which have additional jack detection.<br>
&gt;<br>
&gt; Signed-off-by: Marek Belisko &lt;<a href=3D"mailto:marek@goldelico.com=
">marek@goldelico.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0arch/arm/boot/dts/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A01 +<br>
&gt; =C2=A0arch/arm/boot/dts/omap3-gta04a5.dts | 17 +++++++++++++++++<br>
&gt; =C2=A02 files changed, 18 insertions(+)<br>
&gt; =C2=A0create mode 100644 arch/arm/boot/dts/omap3-gta04a5.dts<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile<b=
r>
&gt; index 7d45fde..576c595 100644<br>
&gt; --- a/arch/arm/boot/dts/Makefile<br>
&gt; +++ b/arch/arm/boot/dts/Makefile<br>
&gt; @@ -285,6 +285,7 @@ dtb-$(CONFIG_ARCH_OMAP3) +=3D am3517-craneboard.dt=
b \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-evm-37xx.dtb \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-gta04a3.dtb \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-gta04a4.dtb \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 omap3-gta04a5.dtb \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-igep0020.dtb \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-igep0030.dtb \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 omap3-ldp.dtb \<br>
&gt; diff --git a/arch/arm/boot/dts/omap3-gta04a5.dts b/arch/arm/boot/dts/o=
map3-gta04a5.dts<br>
&gt; new file mode 100644<br>
&gt; index 0000000..210317c3<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm/boot/dts/omap3-gta04a5.dts<br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2014 H. Nikolaus Schaller &lt;<a href=3D"mailto:hns@=
goldelico.com">hns@goldelico.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License version 2 as<=
br>
&gt; + * published by the Free Software Foundation.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;omap3-gta04.dtsi&quot;<br>
&gt; +<br>
&gt; +/ {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 model =3D &quot;Goldelico GTA04A5;<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 sound {<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ti,jack-det-gpio =
=3D &lt;&amp;twl_gpio 2 0&gt;; =C2=A0 =C2=A0/* GTA04A5 only */<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +};<br>
&gt; --<br>
&gt; 1.9.1<br>
&gt;</p>
<p dir=3D"ltr">Can we have only one dts with status enabled/disabled?</p>
<p dir=3D"ltr">Michael</p>
<p dir=3D"ltr">&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe linux-o=
map&quot; in<br>
&gt; the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">=
majordomo@vger.kernel.org</a><br>
&gt; More majordomo info at =C2=A0<a href=3D"http://vger.kernel.org/majordo=
mo-info.html">http://vger.kernel.org/majordomo-info.html</a><br>
</p>

--047d7b86e8bac52ad304ff46505b--
