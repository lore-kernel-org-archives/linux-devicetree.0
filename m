From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 10/13] ARM: STi: DT: STih410: Add dt nodes for the ehci /
 ohci usb controllers.
Date: Mon, 10 Nov 2014 10:06:19 +0000
Message-ID: <20141110100619.GM21424@x1>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
 <1415361475-6218-11-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415361475-6218-11-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 07 Nov 2014, Peter Griffin wrote:

> The stih410 has some additional usb controllers. This patch adds the
> dt nodes which will enabled them to function correctly.
>=20
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407.dtsi | 60 ++++++++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 60 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stih407.dtsi b/arch/arm/boot/dts/stih4=
07.dtsi
> index 967ec39..5e01db2 100644
> --- a/arch/arm/boot/dts/stih407.dtsi
> +++ b/arch/arm/boot/dts/stih407.dtsi
> @@ -321,5 +321,65 @@
>  			reset-names =3D "global",
>  				      "port";
>  		};
> +
> +		ohci0: usb@9a03c00 {
> +			compatible =3D "st,st-ohci-300x";
> +			status =3D "disabled";

Being picky, I like to see the node status at the bottom in clear
view, but apart from that patch looks good:

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> +			reg =3D <0x9a03c00 0x100>;
> +			interrupts =3D <GIC_SPI 180 IRQ_TYPE_NONE>;
> +			clocks =3D <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>;
> +			resets =3D <&powerdown STIH407_USB2_PORT0_POWERDOWN>,
> +				 <&softreset STIH407_USB2_PORT0_SOFTRESET>;
> +			reset-names =3D "power", "softreset";
> +
> +			phys =3D <&usb2_picophy0>;
> +			phy-names =3D "usb";
> +		};
> +
> +		ehci0: usb@9a03e00 {
> +			compatible =3D "st,st-ehci-300x";
> +			status =3D "disabled";
> +			reg =3D <0x9a03e00 0x100>;
> +			interrupts =3D <GIC_SPI 151 IRQ_TYPE_NONE>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_usb0>;
> +			clocks =3D <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>;
> +			resets =3D <&powerdown STIH407_USB2_PORT0_POWERDOWN>,
> +				 <&softreset STIH407_USB2_PORT0_SOFTRESET>;
> +			reset-names =3D "power", "softreset";
> +
> +			phys =3D <&usb2_picophy0>;
> +			phy-names =3D "usb";
> +		};
> +
> +		ohci1: usb@9a83c00 {
> +			compatible =3D "st,st-ohci-300x";
> +			status =3D "disabled";
> +			reg =3D <0x9a83c00 0x100>;
> +			interrupts =3D <GIC_SPI 181 IRQ_TYPE_NONE>;
> +			clocks =3D <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>;
> +			resets =3D <&powerdown STIH407_USB2_PORT1_POWERDOWN>,
> +				 <&softreset STIH407_USB2_PORT1_SOFTRESET>;
> +			reset-names =3D "power", "softreset";
> +
> +			phys =3D <&usb2_picophy1>;
> +			phy-names =3D "usb";
> +		};
> +
> +		ehci1: usb@9a83e00 {
> +			compatible =3D "st,st-ehci-300x";
> +			status =3D "disabled";
> +			reg =3D <0x9a83e00 0x100>;
> +			interrupts =3D <GIC_SPI 153 IRQ_TYPE_NONE>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_usb1>;
> +			clocks =3D <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>;
> +			resets =3D <&powerdown STIH407_USB2_PORT1_POWERDOWN>,
> +				 <&softreset STIH407_USB2_PORT1_SOFTRESET>;
> +			reset-names =3D "power", "softreset";
> +
> +			phys =3D <&usb2_picophy1>;
> +			phy-names =3D "usb";
> +		};
>  	};
>  };

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
