From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: bcm590xx: add support for GPLDO and
 VBUS regulators
Date: Wed, 21 May 2014 10:29:13 +0100
Message-ID: <20140521092913.GG6679@lee--X1>
References: <1398295293-11033-1-git-send-email-mporter@linaro.org>
 <1398295293-11033-5-git-send-email-mporter@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398295293-11033-5-git-send-email-mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Adds additional nodes to support GPLDO1-6 and VBUS regulators which
> are now supported in the bcm590xx regulator driver.
>=20
> Signed-off-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/bcm59056.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

I'm not going to apply this with the rest of the set.  It will have to
go in via your normal arch/arm route.

> diff --git a/arch/arm/boot/dts/bcm59056.dtsi b/arch/arm/boot/dts/bcm5=
9056.dtsi
> index dfadaaa..066adfb 100644
> --- a/arch/arm/boot/dts/bcm59056.dtsi
> +++ b/arch/arm/boot/dts/bcm59056.dtsi
> @@ -70,5 +70,26 @@
> =20
>  		vsr_reg: vsr {
>  		};
> +
> +		gpldo1_reg: gpldo1 {
> +		};

What do these empty nodes do in any case?

Don't you at least need a status property in there or something?

> +		gpldo2_reg: gpldo2 {
> +		};
> +
> +		gpldo3_reg: gpldo3 {
> +		};
> +
> +		gpldo4_reg: gpldo4 {
> +		};
> +
> +		gpldo5_reg: gpldo5 {
> +		};
> +
> +		gpldo6_reg: gpldo6 {
> +		};
> +
> +		vbus_reg: vbus {
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
