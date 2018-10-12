Return-Path: <SRS0=ZaMx=MY=gmail.com=eballetbo@kernel.org>
MIME-Version: 1.0
References: <20181010090038.20834-1-kernel@esmil.dk> <20181010090038.20834-4-kernel@esmil.dk>
In-Reply-To: <20181010090038.20834-4-kernel@esmil.dk>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 12 Oct 2018 11:16:41 +0200
Message-ID: <CAFqH_50xssP53etNMc=dMSAHb=+dfx=3dpJNB+mTPVNZm5czAg@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: rockchip: add rk3399 SPI DMAs
Content-Type: multipart/alternative; boundary="00000000000058b7160578048c6e"
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, ayaka@soulik.info, Brian Norris <briannorris@chromium.org>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Zhong <zyw@rock-chips.com>, nickey.yang@rock-chips.com, Mark Brown <broonie@kernel.org>, klaus.goger@theobroma-systems.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, linux-spi@vger.kernel.org, zhengsq@rock-chips.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
List-ID: <devicetree@vger.kernel.org>

--00000000000058b7160578048c6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Emil,

Many thanks for the patches.

Missatge de Emil Renner Berthing <kernel@esmil.dk> del dia dc., 10 d=E2=80=
=99oct.
2018 a les 11:03:

> Add spi dma channels as specified by the rk3399 TRM.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index c88e603396f6..c11b5ae6f1ad 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -653,6 +653,8 @@
>                 clocks =3D <&cru SCLK_SPI0>, <&cru PCLK_SPI0>;
>                 clock-names =3D "spiclk", "apb_pclk";
>                 interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH 0>;
> +               dmas =3D <&dmac_peri 10>, <&dmac_peri 11>;
> +               dma-names =3D "tx", "rx";
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&spi0_clk &spi0_tx &spi0_rx &spi0_cs0>;
>                 #address-cells =3D <1>;
> @@ -666,6 +668,8 @@
>                 clocks =3D <&cru SCLK_SPI1>, <&cru PCLK_SPI1>;
>                 clock-names =3D "spiclk", "apb_pclk";
>                 interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH 0>;
> +               dmas =3D <&dmac_peri 12>, <&dmac_peri 13>;
> +               dma-names =3D "tx", "rx";
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&spi1_clk &spi1_tx &spi1_rx &spi1_cs0>;
>                 #address-cells =3D <1>;
> @@ -679,6 +683,8 @@
>                 clocks =3D <&cru SCLK_SPI2>, <&cru PCLK_SPI2>;
>                 clock-names =3D "spiclk", "apb_pclk";
>                 interrupts =3D <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH 0>;
> +               dmas =3D <&dmac_peri 14>, <&dmac_peri 15>;
> +               dma-names =3D "tx", "rx";
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&spi2_clk &spi2_tx &spi2_rx &spi2_cs0>;
>                 #address-cells =3D <1>;
> @@ -692,6 +698,8 @@
>                 clocks =3D <&cru SCLK_SPI4>, <&cru PCLK_SPI4>;
>                 clock-names =3D "spiclk", "apb_pclk";
>                 interrupts =3D <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH 0>;
> +               dmas =3D <&dmac_peri 18>, <&dmac_peri 19>;
> +               dma-names =3D "tx", "rx";
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&spi4_clk &spi4_tx &spi4_rx &spi4_cs0>;
>                 #address-cells =3D <1>;
> @@ -705,6 +713,8 @@
>                 clocks =3D <&cru SCLK_SPI5>, <&cru PCLK_SPI5>;
>                 clock-names =3D "spiclk", "apb_pclk";
>                 interrupts =3D <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0>;
> +               dmas =3D <&dmac_bus 8>, <&dmac_bus 9>;
> +               dma-names =3D "tx", "rx";
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&spi5_clk &spi5_tx &spi5_rx &spi5_cs0>;
>                 power-domains =3D <&power RK3399_PD_SDIOAUDIO>;
> --
> 2.19.1
>
>
As an extra note, the patches get rid of the following messages:

[    1.722875] rockchip-spi ff1d0000.spi: Failed to request TX DMA channel

[    1.730297] rockchip-spi ff1d0000.spi: Failed to request RX DMA channel

[    1.744614] rockchip-spi ff1e0000.spi: Failed to request TX DMA channel

[    1.752034] rockchip-spi ff1e0000.spi: Failed to request RX DMA channel

[    1.759948] rockchip-spi ff200000.spi: Failed to request TX DMA channel

[    1.767360] rockchip-spi ff200000.spi: Failed to request RX DMA channel

And works on my Samsung Chromebook Plus when I stress spi comunications to
the EC, so

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>


>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>

--00000000000058b7160578048c6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Emil,<div><br></div><=
div>Many thanks for the patches.</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">Missatge de Emil Renner Berthing &lt;<a href=3D"mailto:kernel@es=
mil.dk" target=3D"_blank">kernel@esmil.dk</a>&gt; del dia dc., 10 d=E2=80=
=99oct. 2018 a les 11:03:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add spi dma channels as specified by the rk3399 TRM.<br>
<br>
Signed-off-by: Emil Renner Berthing &lt;<a href=3D"mailto:kernel@esmil.dk" =
target=3D"_blank">kernel@esmil.dk</a>&gt;<br>
---<br>
=C2=A0arch/arm64/boot/dts/rockchip/rk3399.dtsi | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts=
/rockchip/rk3399.dtsi<br>
index c88e603396f6..c11b5ae6f1ad 100644<br>
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi<br>
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi<br>
@@ -653,6 +653,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp=
;cru SCLK_SPI0&gt;, &lt;&amp;cru PCLK_SPI0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &qu=
ot;spiclk&quot;, &quot;apb_pclk&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;=
GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH 0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmas =3D &lt;&amp;d=
mac_peri 10&gt;, &lt;&amp;dmac_peri 11&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-names =3D &quot=
;tx&quot;, &quot;rx&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &=
quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&=
amp;spi0_clk &amp;spi0_tx &amp;spi0_rx &amp;spi0_cs0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D =
&lt;1&gt;;<br>
@@ -666,6 +668,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp=
;cru SCLK_SPI1&gt;, &lt;&amp;cru PCLK_SPI1&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &qu=
ot;spiclk&quot;, &quot;apb_pclk&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;=
GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH 0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmas =3D &lt;&amp;d=
mac_peri 12&gt;, &lt;&amp;dmac_peri 13&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-names =3D &quot=
;tx&quot;, &quot;rx&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &=
quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&=
amp;spi1_clk &amp;spi1_tx &amp;spi1_rx &amp;spi1_cs0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D =
&lt;1&gt;;<br>
@@ -679,6 +683,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp=
;cru SCLK_SPI2&gt;, &lt;&amp;cru PCLK_SPI2&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &qu=
ot;spiclk&quot;, &quot;apb_pclk&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;=
GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH 0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmas =3D &lt;&amp;d=
mac_peri 14&gt;, &lt;&amp;dmac_peri 15&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-names =3D &quot=
;tx&quot;, &quot;rx&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &=
quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&=
amp;spi2_clk &amp;spi2_tx &amp;spi2_rx &amp;spi2_cs0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D =
&lt;1&gt;;<br>
@@ -692,6 +698,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp=
;cru SCLK_SPI4&gt;, &lt;&amp;cru PCLK_SPI4&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &qu=
ot;spiclk&quot;, &quot;apb_pclk&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;=
GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH 0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmas =3D &lt;&amp;d=
mac_peri 18&gt;, &lt;&amp;dmac_peri 19&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-names =3D &quot=
;tx&quot;, &quot;rx&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &=
quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&=
amp;spi4_clk &amp;spi4_tx &amp;spi4_rx &amp;spi4_cs0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D =
&lt;1&gt;;<br>
@@ -705,6 +713,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp=
;cru SCLK_SPI5&gt;, &lt;&amp;cru PCLK_SPI5&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock-names =3D &qu=
ot;spiclk&quot;, &quot;apb_pclk&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;=
GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH 0&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmas =3D &lt;&amp;d=
mac_bus 8&gt;, &lt;&amp;dmac_bus 9&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-names =3D &quot=
;tx&quot;, &quot;rx&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &=
quot;default&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&=
amp;spi5_clk &amp;spi5_tx &amp;spi5_rx &amp;spi5_cs0&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 power-domains =3D &=
lt;&amp;power RK3399_PD_SDIOAUDIO&gt;;<br>
-- <br>
2.19.1<br>
<br></blockquote><div><br></div><div>As an extra note, the patches get rid =
of the following messages:</div><div><br></div><div><div>[=C2=A0 =C2=A0 1.7=
22875] rockchip-spi ff1d0000.spi: Failed to request TX DMA channel=C2=A0 =
=C2=A0 =C2=A0</div><div>[=C2=A0 =C2=A0 1.730297] rockchip-spi ff1d0000.spi:=
 Failed to request RX DMA channel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>[=C2=A0 =C2=A0 1.744614] ro=
ckchip-spi ff1e0000.spi: Failed to request TX DMA channel=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=C2=A0<br></div><div>[=C2=A0 =C2=A0 1.752034] rockchip-spi ff1e0000.spi:=
 Failed to request RX DMA channel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0</div><div>[=C2=A0 =C2=A0 1.759948] rockchip-spi ff200000.spi: Fa=
iled to request TX DMA channel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0</div><div>[=C2=A0 =C2=A0 1.767360] rockchip-spi ff200000.spi: Failed=
 to request RX DMA channel</div></div><div><br></div><div>And works on my S=
amsung Chromebook Plus when I stress spi comunications to the EC, so</div><=
div><br></div><div>Tested-by: Enric Balletbo i Serra &lt;<a href=3D"mailto:=
enric.balletbo@collabora.com">enric.balletbo@collabora.com</a>&gt;</div><di=
v>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
_______________________________________________<br>
Linux-rockchip mailing list<br>
<a href=3D"mailto:Linux-rockchip@lists.infradead.org" target=3D"_blank">Lin=
ux-rockchip@lists.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-rockchip" rel=
=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/mailman/listin=
fo/linux-rockchip</a><br>
</blockquote></div></div></div></div>

--00000000000058b7160578048c6e--
