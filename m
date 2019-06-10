Return-Path: <SRS0=qgME=UJ=gmail.com=xieqinick@kernel.org>
MIME-Version: 1.0
References: <1559035267-1884-1-git-send-email-xieqinick@gmail.com> <2074921.iWOsiWxYGh@phil>
In-Reply-To: <2074921.iWOsiWxYGh@phil>
From: Nick Xie <xieqinick@gmail.com>
Date: Mon, 10 Jun 2019 15:19:52 +0800
Message-ID: <CAP4nuTU1BjmpXk5zqWTjBVyO=1ks-Rn65ryaxdQ=GiGa+VK6-A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add support for Khadas
 Edge/Edge-V/Captain boards
Content-Type: multipart/alternative; boundary="00000000000046b310058af30203"
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, robh@kernel.org, nick@khadas.com
List-ID: <devicetree@vger.kernel.org>

--00000000000046b310058af30203
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Heiko,

Thanks for your review.

> Both Captain and Edge-V seem to be identical from a component point
> of view, so should likely share the same dts, or is there some major
> difference coming later?

This is the first patch to support Khadas Edge/Edge-V/Captain board, so I
just add basic dts nodes.

For Captain has more peripherals then Edge-V, so the dts will be different
in the future, but it is the same now.


Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2019=E5=B9=B46=E6=9C=884=E6=97=A5=
=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:08=E5=86=99=E9=81=93=EF=BC=9A

> Hi Nick,
>
> devicetrees look mostly good, with a bit of "bookkeeping" issues and
> some small nits below.
>
> Am Dienstag, 28. Mai 2019, 11:21:07 CEST schrieb xieqinick@gmail.com:
> > From: Nick <nick@khadas.com>
>
> Can you provide a full name (first-+surename) for patch from and Signed-o=
ff
> lines please?
>
>
> > Add devicetree support for Khadas Edge/Edge-V/Captain boards.
> > Khadas Edge is an expandable Rockchip RK3399 board with goldfinger.
> > Khadas Captain is the carrier board for Khadas Edge.
> > Khadas Edge-V is a Khadas VIM form factor Rockchip RK3399 board.
> >
> > Signed-off-by: Nick <nick@khadas.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile              |   3 +
> >  .../boot/dts/rockchip/rk3399-khadas-captain.dts    |  27 +
> >  .../boot/dts/rockchip/rk3399-khadas-edge-v.dts     |  28 +
>
> when adding boards, please also make sure to add entries to
>         Documentation/devicetree/bindings/arm/rockchip.yaml
>
> Take a look at the "FriendlyElec NanoPi4 series boards" for an
> example on how to add a family of boards like your Edge/Captain.
>
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-khadas-captain.dts
> b/arch/arm64/boot/dts/rockchip/rk3399-khadas-captain.dts
> > new file mode 100644
> > index 0000000..85eb51c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-khadas-captain.dts
> > @@ -0,0 +1,27 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2019 Shenzhen Wesion Technology Co., Ltd.
> > + * (https://www.khadas.com)
> > + */
> > +
> > +/dts-v1/;
> > +#include "rk3399-khadas-edge.dtsi"
> > +
> > +/ {
> > +     model =3D "Khadas Captain";
> > +     compatible =3D "khadas,captain", "rockchip,rk3399";
> > +};
> > +
> > +&gmac {
> > +     status =3D "okay";
> > +};
> > +
> > +&pcie_phy {
> > +     status =3D "okay";
> > +};
> > +
> > +&pcie0 {
> > +     ep-gpios =3D <&gpio1 RK_PA3 GPIO_ACTIVE_HIGH>;
> > +     num-lanes =3D <4>;
> > +     status =3D "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dts
> b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dts
> > new file mode 100644
> > index 0000000..396b7f4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dts
> > @@ -0,0 +1,28 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2019 Shenzhen Wesion Technology Co., Ltd.
> > + * (https://www.khadas.com)
> > + */
> > +
> > +/dts-v1/;
> > +#include "rk3399-khadas-edge.dtsi"
> > +
> > +/ {
> > +     model =3D "Khadas Edge-V";
> > +     compatible =3D "khadas,edge-v", "rockchip,rk3399";
> > +};
> > +
> > +&gmac {
> > +     status =3D "okay";
> > +};
> > +
> > +&pcie_phy {
> > +     status =3D "okay";
> > +};
> > +
> > +&pcie0 {
> > +     ep-gpios =3D <&gpio1 RK_PA3 GPIO_ACTIVE_HIGH>;
> > +     num-lanes =3D <4>;
> > +     status =3D "okay";
> > +};
> > +
>
> Both Captain and Edge-V seem to be identical from a component point
> of view, so should likely share the same dts, or is there some major
> difference coming later?
>
> For the time being you can represent the individual boards like:
>
>         model =3D "Khadas Edge-V/Captain";
>         compatible =3D "khadas,edge-v", "khadas,edge-captain",
> "rockchip,rk3399";
>
> Also to show that it's Edge+Captain baseboard, maybe you want to
> change the name like shown above (see rk3399-puma-haikou for a similar
> setup).
>
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dts
> b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dts
> > new file mode 100644
> > index 0000000..f0d5bae
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dts
> > @@ -0,0 +1,17 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2019 Shenzhen Wesion Technology Co., Ltd.
> > + * (https://www.khadas.com)
> > + */
> > +
> > +/dts-v1/;
> > +#include "rk3399-khadas-edge.dtsi"
> > +
> > +/ {
> > +     model =3D "Khadas Edge";
> > +     compatible =3D "khadas,edge", "rockchip,rk3399";
> > +};
> > +
> > +&gmac {
> > +     status =3D "disabled";
>
> the Edge-V/Captain boards do enable the gmac, so you shouldn't need
> a special disable here. Just keep it disabled in the edge.dtsi
> [aka it comes in the disabled state from rk3399.dtsi already].
>
> > +};
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi
> > new file mode 100644
> > index 0000000..872b535
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi
> > @@ -0,0 +1,795 @@
>
> [...]
>
> > +&gmac {
> > +     assigned-clocks =3D <&cru SCLK_RMII_SRC>;
> > +     assigned-clock-parents =3D <&clkin_gmac>;
> > +     clock_in_out =3D "input";
> > +     phy-supply =3D <&vcc_lan>;
> > +     phy-mode =3D "rgmii";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&rgmii_pins>;
> > +     snps,reset-gpio =3D <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> > +     snps,reset-active-low;
> > +     snps,reset-delays-us =3D <0 10000 50000>;
> > +     tx_delay =3D <0x28>;
> > +     rx_delay =3D <0x11>;
> > +     status =3D "disabled";
>
> status is disabled coming from rk3399.dtsi, so there is no need
> to "re-disable" it here.
>
> > +};
> > +
>
> [...]
>
> > +&sdio0 {
> > +     /* WiFi & BT combo module Ampak AP6356S */
> > +     bus-width =3D <4>;
> > +     cap-sdio-irq;
> > +     cap-sd-highspeed;
> > +     keep-power-in-suspend;
> > +     mmc-pwrseq =3D <&sdio_pwrseq>;
> > +     non-removable;
> > +     num-slots =3D <1>;
>
> num-slots is not needed anymore
>
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
> > +     sd-uhs-sdr104;
> > +
> > +     /* Power supply */
>
> drop that comment and blank line please. Properties called
> *-supply already tell you that they are power supplies :-) .
>
>
> Heiko
>
>
>

--00000000000046b310058af30203
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Heiko,<div><br></div><div>Thanks for your revie=
w.</div><div><br></div><div>&gt; Both Captain and Edge-V seem to be identic=
al from a component point<br>&gt; of view, so should likely share the same =
dts, or is there some major<br>&gt; difference coming later?<br></div><div>=
<br></div><div>This is the first patch to support Khadas Edge/Edge-V/Captai=
n board, so I just add basic dts nodes.</div><div><br></div><div>For Captai=
n has more=C2=A0peripherals then Edge-V, so the dts will be different in th=
e future, but it is the same now.</div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Heiko Stuebner &lt;<=
a href=3D"mailto:heiko@sntech.de">heiko@sntech.de</a>&gt; =E4=BA=8E2019=E5=
=B9=B46=E6=9C=884=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:08=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi Nick,<br>
<br>
devicetrees look mostly good, with a bit of &quot;bookkeeping&quot; issues =
and<br>
some small nits below.<br>
<br>
Am Dienstag, 28. Mai 2019, 11:21:07 CEST schrieb <a href=3D"mailto:xieqinic=
k@gmail.com" target=3D"_blank">xieqinick@gmail.com</a>:<br>
&gt; From: Nick &lt;<a href=3D"mailto:nick@khadas.com" target=3D"_blank">ni=
ck@khadas.com</a>&gt;<br>
<br>
Can you provide a full name (first-+surename) for patch from and Signed-off=
<br>
lines please?<br>
<br>
<br>
&gt; Add devicetree support for Khadas Edge/Edge-V/Captain boards.<br>
&gt; Khadas Edge is an expandable Rockchip RK3399 board with goldfinger.<br=
>
&gt; Khadas Captain is the carrier board for Khadas Edge.<br>
&gt; Khadas Edge-V is a Khadas VIM form factor Rockchip RK3399 board.<br>
&gt; <br>
&gt; Signed-off-by: Nick &lt;<a href=3D"mailto:nick@khadas.com" target=3D"_=
blank">nick@khadas.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm64/boot/dts/rockchip/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 .../boot/dts/rockchip/rk3399-khadas-captain.dts=C2=A0 =C2=A0 |=
=C2=A0 27 +<br>
&gt;=C2=A0 .../boot/dts/rockchip/rk3399-khadas-edge-v.dts=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 28 +<br>
<br>
when adding boards, please also make sure to add entries to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Documentation/devicetree/bindings/arm/rockchip.=
yaml<br>
<br>
Take a look at the &quot;FriendlyElec NanoPi4 series boards&quot; for an<br=
>
example on how to add a family of boards like your Edge/Captain.<br>
<br>
<br>
&gt; diff --git a/arch/arm64/boot/dts/rockchip/rk3399-khadas-captain.dts b/=
arch/arm64/boot/dts/rockchip/rk3399-khadas-captain.dts<br>
&gt; new file mode 100644<br>
&gt; index 0000000..85eb51c<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm64/boot/dts/rockchip/rk3399-khadas-captain.dts<br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2019 Shenzhen Wesion Technology Co., Ltd.<br>
&gt; + * (<a href=3D"https://www.khadas.com" rel=3D"noreferrer" target=3D"_=
blank">https://www.khadas.com</a>)<br>
&gt; + */<br>
&gt; +<br>
&gt; +/dts-v1/;<br>
&gt; +#include &quot;rk3399-khadas-edge.dtsi&quot;<br>
&gt; +<br>
&gt; +/ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0model =3D &quot;Khadas Captain&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;khadas,captain&quot;, &quot;=
rockchip,rk3399&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;gmac {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;pcie_phy {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;pcie0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ep-gpios =3D &lt;&amp;gpio1 RK_PA3 GPIO_ACTIVE_HI=
GH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0num-lanes =3D &lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; diff --git a/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dts b/a=
rch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dts<br>
&gt; new file mode 100644<br>
&gt; index 0000000..396b7f4<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dts<br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2019 Shenzhen Wesion Technology Co., Ltd.<br>
&gt; + * (<a href=3D"https://www.khadas.com" rel=3D"noreferrer" target=3D"_=
blank">https://www.khadas.com</a>)<br>
&gt; + */<br>
&gt; +<br>
&gt; +/dts-v1/;<br>
&gt; +#include &quot;rk3399-khadas-edge.dtsi&quot;<br>
&gt; +<br>
&gt; +/ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0model =3D &quot;Khadas Edge-V&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;khadas,edge-v&quot;, &quot;r=
ockchip,rk3399&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;gmac {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;pcie_phy {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;pcie0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ep-gpios =3D &lt;&amp;gpio1 RK_PA3 GPIO_ACTIVE_HI=
GH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0num-lanes =3D &lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
<br>
Both Captain and Edge-V seem to be identical from a component point<br>
of view, so should likely share the same dts, or is there some major<br>
difference coming later?<br>
<br>
For the time being you can represent the individual boards like:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 model =3D &quot;Khadas Edge-V/Captain&quot;;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;khadas,edge-v&quot;, &quot=
;khadas,edge-captain&quot;, &quot;rockchip,rk3399&quot;;<br>
<br>
Also to show that it&#39;s Edge+Captain baseboard, maybe you want to<br>
change the name like shown above (see rk3399-puma-haikou for a similar<br>
setup).<br>
<br>
<br>
&gt; diff --git a/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dts b/arc=
h/arm64/boot/dts/rockchip/rk3399-khadas-edge.dts<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f0d5bae<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dts<br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2019 Shenzhen Wesion Technology Co., Ltd.<br>
&gt; + * (<a href=3D"https://www.khadas.com" rel=3D"noreferrer" target=3D"_=
blank">https://www.khadas.com</a>)<br>
&gt; + */<br>
&gt; +<br>
&gt; +/dts-v1/;<br>
&gt; +#include &quot;rk3399-khadas-edge.dtsi&quot;<br>
&gt; +<br>
&gt; +/ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0model =3D &quot;Khadas Edge&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;khadas,edge&quot;, &quot;roc=
kchip,rk3399&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;gmac {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;disabled&quot;;<br>
<br>
the Edge-V/Captain boards do enable the gmac, so you shouldn&#39;t need<br>
a special disable here. Just keep it disabled in the edge.dtsi<br>
[aka it comes in the disabled state from rk3399.dtsi already].<br>
<br>
&gt; +};<br>
&gt; diff --git a/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi<br>
&gt; new file mode 100644<br>
&gt; index 0000000..872b535<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtsi<br>
&gt; @@ -0,0 +1,795 @@<br>
<br>
[...]<br>
<br>
&gt; +&amp;gmac {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0assigned-clocks =3D &lt;&amp;cru SCLK_RMII_SRC&gt=
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0assigned-clock-parents =3D &lt;&amp;clkin_gmac&gt=
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clock_in_out =3D &quot;input&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy-supply =3D &lt;&amp;vcc_lan&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;rgmii&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;rgmii_pins&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snps,reset-gpio =3D &lt;&amp;gpio3 RK_PB7 GPIO_AC=
TIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snps,reset-active-low;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snps,reset-delays-us =3D &lt;0 10000 50000&gt;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0tx_delay =3D &lt;0x28&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rx_delay =3D &lt;0x11&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;disabled&quot;;<br>
<br>
status is disabled coming from rk3399.dtsi, so there is no need<br>
to &quot;re-disable&quot; it here.<br>
<br>
&gt; +};<br>
&gt; +<br>
<br>
[...]<br>
<br>
&gt; +&amp;sdio0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* WiFi &amp; BT combo module Ampak AP6356S */<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0bus-width =3D &lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cap-sdio-irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cap-sd-highspeed;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0keep-power-in-suspend;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mmc-pwrseq =3D &lt;&amp;sdio_pwrseq&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0non-removable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0num-slots =3D &lt;1&gt;;<br>
<br>
num-slots is not needed anymore<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;sdio0_bus4 &amp;sdio0_cmd =
&amp;sdio0_clk&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sd-uhs-sdr104;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Power supply */<br>
<br>
drop that comment and blank line please. Properties called<br>
*-supply already tell you that they are power supplies :-) .<br>
<br>
<br>
Heiko<br>
<br>
<br>
</blockquote></div>

--00000000000046b310058af30203--
