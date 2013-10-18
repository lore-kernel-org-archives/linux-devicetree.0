From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] ARM: ux500: fix I2C4 clock bit
Date: Fri, 18 Oct 2013 13:46:59 +0100
Message-ID: <20131018124659.GA19112@lee--X1>
References: <1382096630-23640-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382096630-23640-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 18 Oct 2013, Linus Walleij wrote:

> The PCLK for I2C4 is controlled by bit 10 in the PCKEN registers
> while the KCLK is controlled by bit 9 on the KCKEN, it's
> one of these odd assymetric things. Correct the PCLK bit to 10.
>=20
> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> ChangeLog v1->v2:
> - Actually do what the commit says and update the PCLK to bit
>   10 instead of screwing with the KCLK. The KCLK was right all the ti=
me.
> ---
>  arch/arm/boot/dts/ste-dbx5x0.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st=
e-dbx5x0.dtsi
> index 705bd0d..7da99fe 100644
> --- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
> +++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
> @@ -694,7 +694,7 @@
> =20
>  			clock-frequency =3D <400000>;
> =20
> -			clocks =3D <&prcc_kclk 1 9>, <&prcc_pclk 1 9>;
> +			clocks =3D <&prcc_kclk 1 9>, <&prcc_pclk 1 10>;
>  			clock-names =3D "i2cclk", "apb_pclk";

Ah, much better:

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

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
