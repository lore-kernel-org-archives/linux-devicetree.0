From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] regulator: axp20x: Add support for the (external)
 drivebus regulator
Date: Thu, 16 Jun 2016 16:27:34 +0100
Message-ID: <20160616152734.GB21702@dell>
References: <1464973184-17244-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464973184-17244-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since we're reviewing documentation ...

On Fri, 03 Jun 2016, Hans de Goede wrote:
> The axp20x pmics have 2 power inputs, one called ACIN which is intend=
ed

s/pmics/PMICs/

> for to be supplied via a powerbarrel on the board and one called VBUS

s/for //

s/powerbarrel/barrel jack/

> which is intended to be supplied via an otg connector.

s/otg/OTG/

> In the VBUS case the pmic needs to know if the board is supplying pow=
er
> to the otg connector, because then it should not take any power from

s/pmic/PMIC/ and s/otg/OTG/ throughout

> its VBUS pin. The axp209 pmic has a N_VBUSEN input pin via which the

s/a/an/

> board can signal to the pmic whether the board is supplying power to =
the
> otg connector or not.
>=20
> On the axp221/axp223 this pin can alternatively be used as an output
> which controls an external regulator which (optionally) supplies
> power to the otg connector from the board. When the pin is used as
> output it is called DRIVEVBUS in the datasheet.
>=20
> This commit adds support for the DRIVEVBUS pin as an extra pmic
> controlled regulator. Since this is optional a new x-powers,drivebus =
dt

s/a/when a/

s/dt/DT/

> property is added. When this is present the misc-control register is
> written to change the N_VBUSEN input pin to DRIVEVBUS output pin mode=
 and
> the extra drivebus regulator is registered with the regulator subsyst=
em.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> Changes in v2:
> -Set supply_name to just drivebus instead of drivevbus-supply
> -Fix some whitespace errors in the docs
>=20
> Changes in v2:
> -Rename the dt property to drive-vbus-en
> -s/drivebus/drivevbus/
> -Add a line describing the drivevbus regulator to the table in
>  Documentation/devicetree/bindings/mfd/axp20x.txt
> -Set supply_name to drivevbus-supply
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt |  6 +++++
>  drivers/regulator/axp20x-regulator.c             | 30 ++++++++++++++=
++++++++++
>  2 files changed, 36 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Docum=
entation/devicetree/bindings/mfd/axp20x.txt
> index d20b103..585a955 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -22,6 +22,11 @@ Optional properties:
>  		      AXP152/20X: range:  750-1875, Default: 1.5 MHz
>  		      AXP22X/80X: range: 1800-4050, Default: 3   MHz
> =20
> +- x-powers,drive-vbus-en: axp221 / axp223 only boolean, set this whe=
n the
> +		  N_VBUSEN pin is used as an output pin to control an external
> +		  regulator to drive the OTG VBus, rather then as an input pin
> +		  which signals whether the board is driving OTG VBus or not.
> +
>  - <input>-supply: a phandle to the regulator supply node. May be omi=
tted if
>  		  inputs are unregulated, such as using the IPSOUT output
>  		  from the PMIC.
> @@ -79,6 +84,7 @@ ELDO3		: LDO		: eldoin-supply		: shared supply
>  LDO_IO0		: LDO		: ips-supply		: GPIO 0
>  LDO_IO1		: LDO		: ips-supply		: GPIO 1
>  RTC_LDO		: LDO		: ips-supply		: always on
> +DRIVEVBUS	: Enable output	: drivevbus-supply	: external regulator
> =20
>  AXP809 regulators, type, and corresponding input supply names:

Ironically, the doc looks good. :)

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
