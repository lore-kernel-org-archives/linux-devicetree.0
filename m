From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 5/6] mfd: axp20x: Add AXP22x regulator information to
 DT bindings
Date: Wed, 1 Apr 2015 08:10:58 +0100
Message-ID: <20150401071058.GQ9447@x1>
References: <1427868203-7486-1-git-send-email-wens@csie.org>
 <1427868203-7486-6-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427868203-7486-6-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 01 Apr 2015, Chen-Yu Tsai wrote:

> Add the list of regulators for AXP22x to the DT bindings.
> This includes the names and supply names.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt | 25 ++++++++++++++=
++++++++++
>  1 file changed, 25 insertions(+)

Looks fine.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Docum=
entation/devicetree/bindings/mfd/axp20x.txt
> index 3914a3f91ff6..753f14f46e85 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -49,6 +49,31 @@ LDO3		: LDO		: ldo3in-supply
>  LDO4		: LDO		: ldo24in-supply	: shared supply
>  LDO5		: LDO		: ldo5in-supply
> =20
> +AXP221 regulators, type, and corresponding input supply names:
> +
> +Regulator	  Type		  Supply Name		  Notes
> +---------	  ----		  -----------		  -----
> +DCDC1		: DC-DC buck	: vin1-supply
> +DCDC2		: DC-DC buck	: vin2-supply
> +DCDC3		: DC-DC	buck	: vin3-supply
> +DCDC4		: DC-DC	buck	: vin4-supply
> +DCDC5		: DC-DC	buck	: vin5-supply
> +DC1SW		: On/Off Switch	: dcdc1-supply		: DCDC1 secondary output
> +DC5LDO		: LDO		: dcdc5-supply		: input from DCDC5
> +ALDO1		: LDO		: aldoin-supply		: shared supply
> +ALDO2		: LDO		: aldoin-supply		: shared supply
> +ALDO3		: LDO		: aldoin-supply		: shared supply
> +DLDO1		: LDO		: dldoin-supply		: shared supply
> +DLDO2		: LDO		: dldoin-supply		: shared supply
> +DLDO3		: LDO		: dldoin-supply		: shared supply
> +DLDO4		: LDO		: dldoin-supply		: shared supply
> +ELDO1		: LDO		: eldoin-supply		: shared supply
> +ELDO2		: LDO		: eldoin-supply		: shared supply
> +ELDO3		: LDO		: eldoin-supply		: shared supply
> +LDO_IO0		: LDO		: ips-supply		: GPIO 0
> +LDO_IO1		: LDO		: ips-supply		: GPIO 1
> +RTC_LDO		: LDO		: ips-supply		: always on
> +
>  Example:
> =20
>  axp209: pmic@34 {

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
