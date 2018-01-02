From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: axp20x: Document
 backup battery charging property
Date: Tue, 2 Jan 2018 15:48:03 +0000
Message-ID: <20180102154803.esn3ybxut5iy4bnu@dell>
References: <20171230152330.28946-1-contact@paulk.fr>
 <20171230152330.28946-2-contact@paulk.fr>
Reply-To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDA7X7F2WUEBBNWTV3JAKGQEHPOOIEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20171230152330.28946-2-contact-W9ppeneeCTY@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 30 Dec 2017, Paul Kocialkowski wrote:

> This adds documentation for the "backup" property of the axp20x driver,
> that controls the charging mechanism for the backup battery on axp20x.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documenta=
tion/devicetree/bindings/mfd/axp20x.txt
> index 9455503b0299..382776b29932 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -58,6 +58,11 @@ Optional properties:
>  	      See Documentation/devicetree/bindings/regulator/regulator.txt
>  	      for more information on standard regulator bindings.
> =20
> +- backup: An array of two integers for backup battery charging (axp20x-o=
nly),
> +	  describing the charging voltage in mV first and the charging current
> +	  in uA second. Backup battery charging is only enabled when these two
> +	  fields are filled.
> +
>  Optional properties for DCDC regulators:
>  - x-powers,dcdc-workmode: 1 for PWM mode, 0 for AUTO (PWM/PFM) mode
>  			  Default: Current hardware setting
> @@ -256,4 +261,6 @@ axp209: pmic@34 {
>  			/* unused but preferred to be managed by OS */
>  		};
>  	};
> +
> +	backup =3D <3000 200>;

It's unlikely that this will become a generic property, so you should
prefix it with your vendor ID.

>  };

--=20
Lee Jones
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
