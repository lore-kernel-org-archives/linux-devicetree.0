From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/2] mfd: dt-bindings: add the description about dvs
 gpio for rk808
Date: Thu, 23 Jul 2015 15:49:15 +0100
Message-ID: <20150723144915.GH3436@x1>
References: <1437384233-26169-1-git-send-email-zyw@rock-chips.com>
 <1437384233-26169-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437384233-26169-2-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, amstan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Zhang Qing <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 20 Jul 2015, Chris Zhong wrote:

> add the description about dvs1, dvs2, and add the example.
>=20
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>=20
> ---
>=20
> Changes in v4:
> - Remove the description about dvs-ok
>=20
> Changes in v3:
> - Modify the syntax error
>=20
> Changes in v2:
> - increase description about dvs pins
>=20
>  Documentation/devicetree/bindings/mfd/rk808.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Docume=
ntation/devicetree/bindings/mfd/rk808.txt
> index 9e6e259..4ca6aab 100644
> --- a/Documentation/devicetree/bindings/mfd/rk808.txt
> +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> @@ -24,6 +24,10 @@ Optional properties:
>  - vcc10-supply: The input supply for LDO_REG6
>  - vcc11-supply: The input supply for LDO_REG8
>  - vcc12-supply: The input supply for SWITCH_REG2
> +- dvs-gpios:  buck1/2 can be controlled by gpio dvs, this is GPIO sp=
ecifiers
> +  for 2 host gpio's used for dvs. The format of the gpio specifier d=
epends in
> +  the gpio controller. If DVS GPIOs aren't present, voltage changes =
will happen
> +  very quickly with no slow ramp time.
> =20
>  Regulators: All the regulators of RK808 to be instantiated shall be
>  listed in a child node named 'regulators'. Each regulator is represe=
nted
> @@ -55,7 +59,9 @@ Example:
>  		interrupt-parent =3D <&gpio0>;
>  		interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&pmic_int>;
> +		pinctrl-0 =3D <&pmic_int &dvs_1 &dvs_2>;
> +		dvs-gpios =3D <&gpio7 11 GPIO_ACTIVE_HIGH>,
> +			    <&gpio7 15 GPIO_ACTIVE_HIGH>;
>  		reg =3D <0x1b>;
>  		rockchip,system-power-controller;
>  		wakeup-source;

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
