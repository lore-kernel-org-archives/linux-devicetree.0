Return-Path: <SRS0=tIKQ=CP=gmail.com=embed3d@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20171031081915.18960-6-clabbe.montjoie@gmail.com>
References: <20171031081915.18960-1-clabbe.montjoie@gmail.com> <20171031081915.18960-6-clabbe.montjoie@gmail.com>
From: Philipp Rossak <embed3d@gmail.com>
Date: Fri, 17 Nov 2017 20:45:51 +0100
Message-ID: <CAPPFs5FmQVU1RgaUdTBf=pS9nXUL=gDvbq=aek6ZoqHEXgOoHw@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] ARM: dts: sunxi: Restore EMAC changes (boards)
Content-Type: multipart/alternative; boundary="001a113cd4f2f83a6e055e32fb61"
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, catalin.marinas@arm.com, will.deacon@arm.com, netdev@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a113cd4f2f83a6e055e32fb61
Content-Type: text/plain; charset="UTF-8"

Hey,
Sorry for the bringing this up again.
Isn't there a: ethernet0 = &emac; for some boards missing?

Best,
Philipp

On Oct 31, 2017 09:24, "Corentin Labbe" <clabbe.montjoie@gmail.com> wrote:

> The original dwmac-sun8i DT bindings have some issue on how to handle
> integrated PHY and was reverted in last RC of 4.13.
> But now we have a solution so we need to get back that was reverted.
>
> This patch restore all boards DT about dwmac-sun8i
> This reverts partially commit fe45174b72ae ("arm: dts: sunxi: Revert EMAC
> changes")
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts |  9 +++++++++
>  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts   | 19
> +++++++++++++++++++
>  arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts     | 19
> +++++++++++++++++++
>  arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts         |  7 +++++++
>  arch/arm/boot/dts/sun8i-h3-orangepi-2.dts         |  8 ++++++++
>  arch/arm/boot/dts/sun8i-h3-orangepi-one.dts       |  8 ++++++++
>  arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts   |  5 +++++
>  arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts        |  8 ++++++++
>  arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts      | 22
> ++++++++++++++++++++++
>  arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts    | 16 ++++++++++++++++
>  10 files changed, 121 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> index b1502df7b509..6713d0f2b3f4 100644
> --- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> @@ -56,6 +56,8 @@
>
>         aliases {
>                 serial0 = &uart0;
> +               /* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
> +               ethernet0 = &emac;
>                 ethernet1 = &xr819;
>         };
>
> @@ -102,6 +104,13 @@
>         status = "okay";
>  };
>
> +&emac {
> +       phy-handle = <&int_mii_phy>;
> +       phy-mode = "mii";
> +       allwinner,leds-active-low;
> +       status = "okay";
> +};
> +
>  &mmc0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc0_pins_a>;
> diff --git a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
> b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
> index e1dba9ffa94b..f2292deaa590 100644
> --- a/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts
> @@ -52,6 +52,7 @@
>         compatible = "sinovoip,bpi-m2-plus", "allwinner,sun8i-h3";
>
>         aliases {
> +               ethernet0 = &emac;
>                 serial0 = &uart0;
>                 serial1 = &uart1;
>         };
> @@ -111,6 +112,24 @@
>         status = "okay";
>  };
>
> +&emac {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&emac_rgmii_pins>;
> +       phy-supply = <&reg_gmac_3v3>;
> +       phy-handle = <&ext_rgmii_phy>;
> +       phy-mode = "rgmii";
> +
> +       allwinner,leds-active-low;
> +       status = "okay";
> +};
> +
> +&external_mdio {
> +       ext_rgmii_phy: ethernet-phy@1 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0>;
> +       };
> +};
> +
>  &ir {
>         pinctrl-names = "default";
>         pinctrl-0 = <&ir_pins_a>;
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> index 73766d38ee6c..cfb96da3cfef 100644
> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> @@ -66,6 +66,25 @@
>         status = "okay";
>  };
>
> +&emac {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&emac_rgmii_pins>;
> +       phy-supply = <&reg_gmac_3v3>;
> +       phy-handle = <&ext_rgmii_phy>;
> +       phy-mode = "rgmii";
> +
> +       allwinner,leds-active-low;
> +
> +       status = "okay";
> +};
> +
> +&external_mdio {
> +       ext_rgmii_phy: ethernet-phy@1 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <7>;
> +       };
> +};
> +
>  &ir {
>         pinctrl-names = "default";
>         pinctrl-0 = <&ir_pins_a>;
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> index 8d2cc6e9a03f..78f6c24952dd 100644
> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts
> @@ -46,3 +46,10 @@
>         model = "FriendlyARM NanoPi NEO";
>         compatible = "friendlyarm,nanopi-neo", "allwinner,sun8i-h3";
>  };
> +
> +&emac {
> +       phy-handle = <&int_mii_phy>;
> +       phy-mode = "mii";
> +       allwinner,leds-active-low;
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> index 1bf51802f5aa..b20be95b49d5 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
> @@ -54,6 +54,7 @@
>         aliases {
>                 serial0 = &uart0;
>                 /* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
> +               ethernet0 = &emac;
>                 ethernet1 = &rtl8189;
>         };
>
> @@ -117,6 +118,13 @@
>         status = "okay";
>  };
>
> +&emac {
> +       phy-handle = <&int_mii_phy>;
> +       phy-mode = "mii";
> +       allwinner,leds-active-low;
> +       status = "okay";
> +};
> +
>  &ir {
>         pinctrl-names = "default";
>         pinctrl-0 = <&ir_pins_a>;
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> index a1c6ff6fd05d..82e5d28cd698 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-one.dts
> @@ -52,6 +52,7 @@
>         compatible = "xunlong,orangepi-one", "allwinner,sun8i-h3";
>
>         aliases {
> +               ethernet0 = &emac;
>                 serial0 = &uart0;
>         };
>
> @@ -97,6 +98,13 @@
>         status = "okay";
>  };
>
> +&emac {
> +       phy-handle = <&int_mii_phy>;
> +       phy-mode = "mii";
> +       allwinner,leds-active-low;
> +       status = "okay";
> +};
> +
>  &mmc0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
> b/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
> index 8b93f5c781a7..a10281b455f5 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc-plus.dts
> @@ -53,6 +53,11 @@
>         };
>  };
>
> +&emac {
> +       /* LEDs changed to active high on the plus */
> +       /delete-property/ allwinner,leds-active-low;
> +};
> +
>  &mmc1 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc1_pins_a>;
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> index d0b80fda2f6b..6d98bcfbe877 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
> @@ -52,6 +52,7 @@
>         compatible = "xunlong,orangepi-pc", "allwinner,sun8i-h3";
>
>         aliases {
> +               ethernet0 = &emac;
>                 serial0 = &uart0;
>         };
>
> @@ -117,6 +118,13 @@
>         status = "okay";
>  };
>
> +&emac {
> +       phy-handle = <&int_mii_phy>;
> +       phy-mode = "mii";
> +       allwinner,leds-active-low;
> +       status = "okay";
> +};
> +
>  &ir {
>         pinctrl-names = "default";
>         pinctrl-0 = <&ir_pins_a>;
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> index 72ca01b93f1b..cbc499b04de4 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> @@ -47,6 +47,10 @@
>         model = "Xunlong Orange Pi Plus / Plus 2";
>         compatible = "xunlong,orangepi-plus", "allwinner,sun8i-h3";
>
> +       aliases {
> +               ethernet0 = &emac;
> +       };
> +
>         reg_gmac_3v3: gmac-3v3 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "gmac-3v3";
> @@ -74,6 +78,24 @@
>         status = "okay";
>  };
>
> +&emac {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&emac_rgmii_pins>;
> +       phy-supply = <&reg_gmac_3v3>;
> +       phy-handle = <&ext_rgmii_phy>;
> +       phy-mode = "rgmii";
> +
> +       allwinner,leds-active-low;
> +       status = "okay";
> +};
> +
> +&external_mdio {
> +       ext_rgmii_phy: ethernet-phy@1 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0>;
> +       };
> +};
> +
>  &mmc2 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&mmc2_8bit_pins>;
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
> b/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
> index 97920b12a944..6dbf7b2e0c13 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus2e.dts
> @@ -61,3 +61,19 @@
>                 gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
>         };
>  };
> +
> +&emac {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&emac_rgmii_pins>;
> +       phy-supply = <&reg_gmac_3v3>;
> +       phy-handle = <&ext_rgmii_phy>;
> +       phy-mode = "rgmii";
> +       status = "okay";
> +};
> +
> +&external_mdio {
> +       ext_rgmii_phy: ethernet-phy@1 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <1>;
> +       };
> +};
> --
> 2.13.6
>
>

--001a113cd4f2f83a6e055e32fb61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey,<div dir=3D"auto">Sorry for the bringing this up agai=
n.=C2=A0</div><div dir=3D"auto"><div dir=3D"auto">Isn&#39;t there a:=C2=A0<=
span style=3D"font-family:sans-serif;font-size:13.696px">ethernet0 =3D &amp=
;emac;=C2=A0</span><span style=3D"font-family:sans-serif">for some boards m=
issing?</span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif=
"><br></span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"=
>Best,</span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"=
>Philipp</span></div></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Oct 31, 2017 09:24, &quot;Corentin Labbe&quot; &lt;<a h=
ref=3D"mailto:clabbe.montjoie@gmail.com">clabbe.montjoie@gmail.com</a>&gt; =
wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The original =
dwmac-sun8i DT bindings have some issue on how to handle<br>
integrated PHY and was reverted in last RC of 4.13.<br>
But now we have a solution so we need to get back that was reverted.<br>
<br>
This patch restore all boards DT about dwmac-sun8i<br>
This reverts partially commit fe45174b72ae (&quot;arm: dts: sunxi: Revert E=
MAC changes&quot;)<br>
<br>
Signed-off-by: Corentin Labbe &lt;<a href=3D"mailto:clabbe.montjoie@gmail.c=
om">clabbe.montjoie@gmail.com</a>&gt;<br>
Acked-by: Florian Fainelli &lt;<a href=3D"mailto:f.fainelli@gmail.com">f.fa=
inelli@gmail.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts |=C2=A0 9 ++++=
+++++<br>
=C2=A0arch/arm/boot/dts/sun8i-h3-<wbr>bananapi-m2-plus.dts=C2=A0 =C2=A0| 19=
 +++++++++++++++++++<br>
=C2=A0arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-m1-plus.dts=C2=A0 =C2=A0 =C2=
=A0| 19 +++++++++++++++++++<br>
=C2=A0arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-neo.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
=C2=A0arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-2.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
=C2=A0arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-one.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 8 ++++++++<br>
=C2=A0arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc-plus.dts=C2=A0 =C2=A0|=C2=
=A0 5 +++++<br>
=C2=A0arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 8 ++++++++<br>
=C2=A0arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts=C2=A0 =C2=A0 =C2=A0=
 | 22 ++++++++++++++++++++++<br>
=C2=A0arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus2e.dts=C2=A0 =C2=A0 | 16=
 ++++++++++++++++<br>
=C2=A010 files changed, 121 insertions(+)<br>
<br>
diff --git a/arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts b/arch/=
arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts<br>
index b1502df7b509..6713d0f2b3f4 100644<br>
--- a/arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts<br>
+++ b/arch/arm/boot/dts/sun8i-h2-<wbr>plus-orangepi-zero.dts<br>
@@ -56,6 +56,8 @@<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aliases {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial0 =3D &amp;ua=
rt0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* ethernet0 is the=
 H3 emac, defined in sun8i-h3.dtsi */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethernet0 =3D &amp;=
emac;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ethernet1 =3D &amp;=
xr819;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
@@ -102,6 +104,13 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;emac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;int_mii_phy&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;mii&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,leds-active-low;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
=C2=A0&amp;mmc0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;mmc0_pins_a&gt;;<br>
diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>bananapi-m2-plus.dts b/arch/ar=
m/boot/dts/sun8i-h3-<wbr>bananapi-m2-plus.dts<br>
index e1dba9ffa94b..f2292deaa590 100644<br>
--- a/arch/arm/boot/dts/sun8i-h3-<wbr>bananapi-m2-plus.dts<br>
+++ b/arch/arm/boot/dts/sun8i-h3-<wbr>bananapi-m2-plus.dts<br>
@@ -52,6 +52,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;sinovoip,bpi-m2-plus&quot;=
, &quot;allwinner,sun8i-h3&quot;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aliases {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethernet0 =3D &amp;=
emac;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial0 =3D &amp;ua=
rt0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial1 =3D &amp;ua=
rt1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
@@ -111,6 +112,24 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;emac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;emac_rgmii_pins&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-supply =3D &lt;&amp;reg_gmac_3v3&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;ext_rgmii_phy&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;rgmii&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,leds-active-low;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;external_mdio {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ext_rgmii_phy: ethernet-phy@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;ethernet-phy-ieee802.3-c22&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
=C2=A0&amp;ir {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;ir_pins_a&gt;;<br>
diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-m1-plus.dts b/arch/arm/=
boot/dts/sun8i-h3-<wbr>nanopi-m1-plus.dts<br>
index 73766d38ee6c..cfb96da3cfef 100644<br>
--- a/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-m1-plus.dts<br>
+++ b/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-m1-plus.dts<br>
@@ -66,6 +66,25 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;emac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;emac_rgmii_pins&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-supply =3D &lt;&amp;reg_gmac_3v3&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;ext_rgmii_phy&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;rgmii&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,leds-active-low;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;external_mdio {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ext_rgmii_phy: ethernet-phy@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;ethernet-phy-ieee802.3-c22&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;7&gt;;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
=C2=A0&amp;ir {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;ir_pins_a&gt;;<br>
diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-neo.dts b/arch/arm/boot=
/dts/sun8i-h3-<wbr>nanopi-neo.dts<br>
index 8d2cc6e9a03f..78f6c24952dd 100644<br>
--- a/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-neo.dts<br>
+++ b/arch/arm/boot/dts/sun8i-h3-<wbr>nanopi-neo.dts<br>
@@ -46,3 +46,10 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 model =3D &quot;FriendlyARM NanoPi NEO&quot;;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;friendlyarm,nanopi-neo&quo=
t;, &quot;allwinner,sun8i-h3&quot;;<br>
=C2=A0};<br>
+<br>
+&amp;emac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;int_mii_phy&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;mii&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,leds-active-low;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-2.dts b/arch/arm/boot=
/dts/sun8i-h3-<wbr>orangepi-2.dts<br>
index 1bf51802f5aa..b20be95b49d5 100644<br>
--- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-2.dts<br>
+++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-2.dts<br>
@@ -54,6 +54,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aliases {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial0 =3D &amp;ua=
rt0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ethernet0 is the=
 H3 emac, defined in sun8i-h3.dtsi */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethernet0 =3D &amp;=
emac;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ethernet1 =3D &amp;=
rtl8189;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
@@ -117,6 +118,13 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;emac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;int_mii_phy&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;mii&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,leds-active-low;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
=C2=A0&amp;ir {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;ir_pins_a&gt;;<br>
diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-one.dts b/arch/arm/bo=
ot/dts/sun8i-h3-<wbr>orangepi-one.dts<br>
index a1c6ff6fd05d..82e5d28cd698 100644<br>
--- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-one.dts<br>
+++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-one.dts<br>
@@ -52,6 +52,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;xunlong,orangepi-one&quot;=
, &quot;allwinner,sun8i-h3&quot;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aliases {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethernet0 =3D &amp;=
emac;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial0 =3D &amp;ua=
rt0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
@@ -97,6 +98,13 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;emac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;int_mii_phy&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;mii&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,leds-active-low;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
=C2=A0&amp;mmc0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;mmc0_pins_a&gt;, &lt;&am=
p;mmc0_cd_pin&gt;;<br>
diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc-plus.dts b/arch/ar=
m/boot/dts/sun8i-h3-<wbr>orangepi-pc-plus.dts<br>
index 8b93f5c781a7..a10281b455f5 100644<br>
--- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc-plus.dts<br>
+++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc-plus.dts<br>
@@ -53,6 +53,11 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
+&amp;emac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* LEDs changed to active high on the plus */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/delete-property/ allwinner,leds-active-low;<br=
>
+};<br>
+<br>
=C2=A0&amp;mmc1 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;mmc1_pins_a&gt;;<br>
diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc.dts b/arch/arm/boo=
t/dts/sun8i-h3-<wbr>orangepi-pc.dts<br>
index d0b80fda2f6b..6d98bcfbe877 100644<br>
--- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc.dts<br>
+++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-pc.dts<br>
@@ -52,6 +52,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;xunlong,orangepi-pc&quot;,=
 &quot;allwinner,sun8i-h3&quot;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aliases {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethernet0 =3D &amp;=
emac;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial0 =3D &amp;ua=
rt0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
@@ -117,6 +118,13 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;emac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;int_mii_phy&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;mii&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,leds-active-low;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
=C2=A0&amp;ir {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;ir_pins_a&gt;;<br>
diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts b/arch/arm/b=
oot/dts/sun8i-h3-<wbr>orangepi-plus.dts<br>
index 72ca01b93f1b..cbc499b04de4 100644<br>
--- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts<br>
+++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus.dts<br>
@@ -47,6 +47,10 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 model =3D &quot;Xunlong Orange Pi Plus / Plus 2=
&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;xunlong,orangepi-plus&quot=
;, &quot;allwinner,sun8i-h3&quot;;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ethernet0 =3D &amp;=
emac;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_gmac_3v3: gmac-3v3 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quo=
t;regulator-fixed&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regulator-name =3D =
&quot;gmac-3v3&quot;;<br>
@@ -74,6 +78,24 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;emac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;emac_rgmii_pins&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-supply =3D &lt;&amp;reg_gmac_3v3&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;ext_rgmii_phy&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;rgmii&quot;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner,leds-active-low;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;external_mdio {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ext_rgmii_phy: ethernet-phy@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;ethernet-phy-ieee802.3-c22&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
+<br>
=C2=A0&amp;mmc2 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;mmc2_8bit_pins&gt;;<br>
diff --git a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus2e.dts b/arch/arm=
/boot/dts/sun8i-h3-<wbr>orangepi-plus2e.dts<br>
index 97920b12a944..6dbf7b2e0c13 100644<br>
--- a/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus2e.dts<br>
+++ b/arch/arm/boot/dts/sun8i-h3-<wbr>orangepi-plus2e.dts<br>
@@ -61,3 +61,19 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio =3D &lt;&amp;p=
io 3 6 GPIO_ACTIVE_HIGH&gt;; /* PD6 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
+<br>
+&amp;emac {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;emac_rgmii_pins&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-supply =3D &lt;&amp;reg_gmac_3v3&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;ext_rgmii_phy&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;rgmii&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
+&amp;external_mdio {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ext_rgmii_phy: ethernet-phy@1 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quo=
t;ethernet-phy-ieee802.3-c22&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;1&gt;;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+};<br>
--<br>
2.13.6<br>
<br>
</blockquote></div></div>

--001a113cd4f2f83a6e055e32fb61--
