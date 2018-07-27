From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3.1 07/10] arm64: dts: allwinner: a64: Add
 display pipeline
Date: Fri, 27 Jul 2018 23:42:30 +0800
Message-ID: <16929adfe068302187af72b0ed0f1d472b6b02e2.camel@aosc.io>
References: <20180726171257.6688-1-icenowy@aosc.io>
	 <20180726171257.6688-8-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBCH35TNAKGQEJ6LD6CI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180726171257.6688-8-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018-07-27=E4=BA=94=E7=9A=84 01:12 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>=20
> Allwinner A64 have a display pipeline with 2 mixers/TCONs, the first
> TCON is connected to LCD and the second is to HDMI.
>=20
> The HDMI controller/PHY pair is similar to the one on H3/H5, but have
> two video PLLs selectable.
>=20
> Add all required device tree nodes of the display pipeline, including
> the TCON0 LCD one and the TCON1 HDMI one.
>=20
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> [Icenowy: refactor commit message and add 1st pipeline]
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes for v3.1:
> - Refactor commit message to make it more clear.
> - Added first pipeline (mixer0 -> tcon0)
> Changes for v3:
> - Squash all pipeline components in one patch
> - Add status for mixer1 and tcon1
> Changes for v2:
> - Change compatibles and other based on previous patch changes
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 169
> ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index d3daf90a8715..fe9cc673fe07 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -112,6 +112,12 @@
>  		};
>  	};
> =20
> +	de: display-engine {
> +		compatible =3D "allwinner,sun50i-a64-display-engine";
> +		allwinner,pipelines =3D <&mixer1>;
> +		status =3D "disabled";
> +	};
> +
>  	osc24M: osc24M_clk {
>  		#clock-cells =3D <0>;
>  		compatible =3D "fixed-clock";
> @@ -194,6 +200,55 @@
>  				#clock-cells =3D <1>;
>  				#reset-cells =3D <1>;
>  			};
> +
> +			mixer0: mixer@100000 {
> +				compatible =3D "allwinner,sun50i-a64-de2-
> mixer-0";
> +				reg =3D <0x100000 0x100000>;
> +				clocks =3D <&display_clocks
> CLK_BUS_MIXER0>,
> +					 <&display_clocks CLK_MIXER0>;
> +				clock-names =3D "bus",
> +					      "mod";
> +				resets =3D <&display_clocks RST_MIXER0>;
> +				status =3D "disabled";
> +
> +				ports {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					mixer0_out: port@1 {
> +						reg =3D <1>;
> +
> +						mixer0_out_tcon0:
> endpoint {
> +							remote-endpoint=20
> =3D <&tcon0_in_mixer0>;
> +						};
> +					};
> +				};
> +			};
> +
> +			mixer1: mixer@200000 {
> +				compatible =3D "allwinner,sun50i-a64-de2-
> mixer-1";
> +				reg =3D <0x200000 0x100000>;
> +				clocks =3D <&display_clocks
> CLK_BUS_MIXER1>,
> +					 <&display_clocks CLK_MIXER1>;
> +				clock-names =3D "bus",
> +					      "mod";
> +				/* The reset line is shared */
> +				resets =3D <&display_clocks RST_WB>;

Sorry here the reset line is not shared, and should be RST_MIXER1.

> +				status =3D "disabled";
> +
> +				ports {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					mixer1_out: port@1 {
> +						reg =3D <1>;
> +
> +						mixer1_out_tcon1:
> endpoint {
> +							remote-endpoint=20
> =3D <&tcon1_in_mixer1>;
> +						};
> +					};
> +				};
> +			};
>  		};
> =20
>  		syscon: syscon@1c00000 {
> @@ -228,6 +283,76 @@
>  			#dma-cells =3D <1>;
>  		};
> =20
> +		tcon0: lcd-controller@1c0c000 {
> +			compatible =3D "allwinner,sun50i-a64-tcon-lcd",
> +				     "allwinner,sun8i-a83t-tcon-lcd";
> +			reg =3D <0x01c0c000 0x1000>;
> +			interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_TCON0>, <&ccu
> CLK_TCON0>;
> +			clock-names =3D "ahb", "tcon-ch0";
> +			clock-output-names =3D "tcon-pixel-clock";
> +			resets =3D <&ccu RST_BUS_TCON0>, <&ccu
> RST_BUS_LVDS>;
> +			reset-names =3D "lcd", "lvds";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				tcon0_in: port@0 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <0>;
> +
> +					tcon0_in_mixer0: endpoint@0 {
> +						reg =3D <0>;
> +						remote-endpoint =3D
> <&mixer0_out_tcon0>;
> +					};
> +				};
> +
> +				tcon0_out: port@1 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <1>;
> +				};
> +			};
> +		};
> +
> +		tcon1: lcd-controller@1c0d000 {
> +			compatible =3D "allwinner,sun50i-a64-tcon-tv",
> +				     "allwinner,sun8i-a83t-tcon-tv";
> +			reg =3D <0x01c0d000 0x1000>;
> +			interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_TCON1>, <&ccu
> CLK_TCON1>;
> +			clock-names =3D "ahb", "tcon-ch1";
> +			resets =3D <&ccu RST_BUS_TCON1>;
> +			reset-names =3D "lcd";
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				tcon1_in: port@0 {
> +					reg =3D <0>;
> +
> +					tcon1_in_mixer1: endpoint {
> +						remote-endpoint =3D
> <&mixer1_out_tcon1>;
> +					};
> +				};
> +
> +				tcon1_out: port@1 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <1>;
> +
> +					tcon1_out_hdmi: endpoint@1 {
> +						reg =3D <1>;
> +						remote-endpoint =3D
> <&hdmi_in_tcon1>;
> +					};
> +				};
> +			};
> +		};
> +
>  		mmc0: mmc@1c0f000 {
>  			compatible =3D "allwinner,sun50i-a64-mmc";
>  			reg =3D <0x01c0f000 0x1000>;
> @@ -686,6 +811,50 @@
>  			status =3D "disabled";
>  		};
> =20
> +		hdmi: hdmi@1ee0000 {
> +			compatible =3D "allwinner,sun50i-a64-dw-hdmi",
> +				     "allwinner,sun8i-a83t-dw-hdmi";
> +			reg =3D <0x01ee0000 0x10000>;
> +			reg-io-width =3D <1>;
> +			interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_HDMI>, <&ccu
> CLK_HDMI_DDC>,
> +				 <&ccu CLK_HDMI>;
> +			clock-names =3D "iahb", "isfr", "tmds";
> +			resets =3D <&ccu RST_BUS_HDMI1>;
> +			reset-names =3D "ctrl";
> +			phys =3D <&hdmi_phy>;
> +			phy-names =3D "hdmi-phy";
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				hdmi_in: port@0 {
> +					reg =3D <0>;
> +
> +					hdmi_in_tcon1: endpoint {
> +						remote-endpoint =3D
> <&tcon1_out_hdmi>;
> +					};
> +				};
> +
> +				hdmi_out: port@1 {
> +					reg =3D <1>;
> +				};
> +			};
> +		};
> +
> +		hdmi_phy: hdmi-phy@1ef0000 {
> +			compatible =3D "allwinner,sun50i-a64-hdmi-phy";
> +			reg =3D <0x01ef0000 0x10000>;
> +			clocks =3D <&ccu CLK_BUS_HDMI>, <&ccu
> CLK_HDMI_DDC>,
> +				 <&ccu CLK_PLL_VIDEO0>, <&ccu
> CLK_PLL_VIDEO1>;
> +			clock-names =3D "bus", "mod", "pll-0", "pll-1";
> +			resets =3D <&ccu RST_BUS_HDMI0>;
> +			reset-names =3D "phy";
> +			#phy-cells =3D <0>;
> +		};
> +
>  		rtc: rtc@1f00000 {
>  			compatible =3D "allwinner,sun6i-a31-rtc";
>  			reg =3D <0x01f00000 0x54>;

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
