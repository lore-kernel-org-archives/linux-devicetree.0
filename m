Return-Path: <SRS0=4yZB=EG=gmail.com=marcofrk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAOMZO5But4BU0WP69LoCgGqPGDFNw8hsBB+P8=416oB1e1q6tA@mail.gmail.com>
References: <1512575989-15627-1-git-send-email-marcofrk@gmail.com>
 <20171221090736.3ac9d5db@karo-electronics.de> <CAM4PwSVzVn3=wWpFohw2q23Oiwp1FimCkdHPq=BfG-QzuuPtfQ@mail.gmail.com>
 <CAOMZO5But4BU0WP69LoCgGqPGDFNw8hsBB+P8=416oB1e1q6tA@mail.gmail.com>
From: Marco Franchi <marcofrk@gmail.com>
Date: Thu, 11 Jan 2018 13:05:00 -0200
Message-ID: <CAM4PwSX5six0Ke4rkJVKDWwEKHFZ_EwxUbdJwqGb589TkJPKkA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: imx: Add memory node unit name
Content-Type: multipart/alternative; boundary="001a11442700d3cba1056281787d"
To: Rob Herring <robh+dt@kernel.org>
Cc: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--001a11442700d3cba1056281787d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Rob,

2017-12-26 16:09 GMT-02:00 Fabio Estevam <festevam@gmail.com>:

> Hi Rob,
>
> On Thu, Dec 21, 2017 at 12:26 PM, Marco Franchi <marcofrk@gmail.com>
> wrote:
> > Hi Lothar,
> >
> > 2017-12-21 6:07 GMT-02:00 Lothar Wa=C3=9Fmann <LW@karo-electronics.de>:
> >> Hi,
> >>
> >> On Wed,  6 Dec 2017 13:59:49 -0200 Marco Franchi wrote:
> >>> Fix the following warnings from dtc by adding the unit name to memory
> >>> nodes:
> >>>
> >>> Warning (unit_address_vs_reg): Node /memory has a reg or ranges
> property, but no unit name
> >>>
> >>> Converted using the following command:
> >>>
> >>> perl -p0777i -e 's/memory \{\n\t\treg =3D \<0x+([0-9a-f])/memory\@$1$=
\0000000
> \{\n\t\treg =3D <0x$1/m' `find ./arch/arm/boot/dts -name "imx*"`
> >>>
> >>> The files below were manually fixed:
> >>> -imx1-ads.dts
> >>> -imx1-apf9328.dts
> >>>
> >> The imx*.dtsi files all have this:
> >> |       memory { device_type =3D "memory"; reg =3D <0 0>; };
> >> Thus you will end up with a 'memory' node with a reg =3D <0 0> entry a=
nd
> >> an additional 'memory@...' node with the correct 'reg' values.
> >
> > You are right. The .dtb files were composed by two different memory
> nodes.
> > Do you have some recommendation to take off this specific warning?
>
> Currently the only dtc warnings we have with imx_v6_v7_defconfig are:
>
> Warning (unit_address_vs_reg): Node /memory has a reg or ranges
> property, but no unit name
>
> What is the recommended way to fix these warnings?
>
> Thanks
>

Any comments?

--001a11442700d3cba1056281787d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Rob,<div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2017-12-26 16:09 GMT-02:00 Fabio Estevam <span dir=3D"ltr">&lt;<a href=
=3D"mailto:festevam@gmail.com" target=3D"_blank">festevam@gmail.com</a>&gt;=
</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Hi Rob,<br>
<span class=3D""><br>
On Thu, Dec 21, 2017 at 12:26 PM, Marco Franchi &lt;<a href=3D"mailto:marco=
frk@gmail.com">marcofrk@gmail.com</a>&gt; wrote:<br>
&gt; Hi Lothar,<br>
&gt;<br>
&gt; 2017-12-21 6:07 GMT-02:00 Lothar Wa=C3=9Fmann &lt;<a href=3D"mailto:LW=
@karo-electronics.de">LW@karo-electronics.de</a>&gt;:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; On Wed,=C2=A0 6 Dec 2017 13:59:49 -0200 Marco Franchi wrote:<br>
&gt;&gt;&gt; Fix the following warnings from dtc by adding the unit name to=
 memory<br>
&gt;&gt;&gt; nodes:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Warning (unit_address_vs_reg): Node /memory has a reg or range=
s property, but no unit name<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Converted using the following command:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; perl -p0777i -e &#39;s/memory \{\n\t\treg =3D \&lt;0x+([0-9a-f=
])/memory\@$1$\<wbr>0000000 \{\n\t\treg =3D &lt;0x$1/m&#39; `find ./arch/ar=
m/boot/dts -name &quot;imx*&quot;`<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The files below were manually fixed:<br>
&gt;&gt;&gt; -imx1-ads.dts<br>
&gt;&gt;&gt; -imx1-apf9328.dts<br>
&gt;&gt;&gt;<br>
&gt;&gt; The imx*.dtsi files all have this:<br>
&gt;&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0memory { device_type =3D &quot;memory&=
quot;; reg =3D &lt;0 0&gt;; };<br>
&gt;&gt; Thus you will end up with a &#39;memory&#39; node with a reg =3D &=
lt;0 0&gt; entry and<br>
&gt;&gt; an additional &#39;memory@...&#39; node with the correct &#39;reg&=
#39; values.<br>
&gt;<br>
&gt; You are right. The .dtb files were composed by two different memory no=
des.<br>
&gt; Do you have some recommendation to take off this specific warning?<br>
<br>
</span>Currently the only dtc warnings we have with imx_v6_v7_defconfig are=
:<br>
<span class=3D""><br>
Warning (unit_address_vs_reg): Node /memory has a reg or ranges<br>
property, but no unit name<br>
<br>
</span>What is the recommended way to fix these warnings?<br>
<br>
Thanks<br>
</blockquote></div><br></div><div class=3D"gmail_extra">Any comments?</div>=
</div>

--001a11442700d3cba1056281787d--
