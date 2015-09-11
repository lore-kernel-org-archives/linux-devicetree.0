From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 06/11] ARM: DT: STiH407: Add NAND flash controller pin
 configuration
Date: Fri, 11 Sep 2015 19:01:04 +0100
Message-ID: <20150911180104.GL18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-7-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-7-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe Kerello <christophe.kerello-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> This patch adds NAND flash support controller pin configuration
> for STiH407 family silicon.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Christophe Kerello <christophe.kerello-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index d0f5fdd..cde776b 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -885,6 +885,29 @@
>  					};
>  				};
>  			};
> +
> +			nand {
> +				pinctrl_nand: nand {
> +					st,pins {
> +						nand_cs1 =3D <&pio40 6 ALT3 OUT>;
> +						nand_cs0 =3D <&pio40 7 ALT3 OUT>;
> +						nand_d0 =3D <&pio41 0 ALT3 BIDIR>;
> +						nand_d1 =3D <&pio41 1 ALT3 BIDIR>;
> +						nand_d2 =3D <&pio41 2 ALT3 BIDIR>;
> +						nand_d3 =3D <&pio41 3 ALT3 BIDIR>;
> +						nand_d4 =3D <&pio41 4 ALT3 BIDIR>;
> +						nand_d5 =3D <&pio41 5 ALT3 BIDIR>;
> +						nand_d6 =3D <&pio41 6 ALT3 BIDIR>;
> +						nand_d7 =3D <&pio41 7 ALT3 BIDIR>;
> +						nand_we =3D <&pio42 0 ALT3 OUT>;
> +						nand_dqs =3D <&pio42 1 ALT3 OUT>;
> +						nand_ale =3D <&pio42 2 ALT3 OUT>;
> +						nand_cle =3D <&pio42 3 ALT3 OUT>;
> +						nand_rnb =3D <&pio42 4 ALT3 IN>;
> +						nand_oe =3D <&pio42 5 ALT3 OUT>;
> +					};
> +				};
> +			};
>  		};
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
