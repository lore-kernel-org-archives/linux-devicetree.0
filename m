From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH V10 2/6] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Wed, 27 Apr 2016 17:06:00 +0200
Message-ID: <20160427150559.GD4176@ulmo.ba.sec>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com>
 <1459348188-11726-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1459348188-11726-3-git-send-email-ldewangan@nvidia.com>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: lee.jones@linaro.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 07:59:44PM +0530, Laxman Dewangan wrote:
> MAX77620/MAX20024 are Power Management IC from the MAXIM.
> It supports RTC, multiple GPIOs, multiple DCDC and LDOs,
> watchdog, clock etc.
>=20
> Add MFD drier to provides common support for accessing the
> device; additional drivers is developed on respected subsystem
> in order to use the functionality of the device.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Mallikarjun Kasoju <mkasoju@nvidia.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> ---
> Changes from V1:
> - Code cleanups per review from V1.
> - Move register acccess APIs from header to c file.
> - Remove some of non required variable, remove duplication in error messa=
ge
>  and simplify some of function implementation.
> - Register RTC driver such that it can get the regmap handle form parent =
device
>=20
> Changes from V2:
> - Run coccicheck and checkpatch in strict mode for the alignment.
> - Drop RTC driver and its i2c client registration.
>=20
> Changes from V3:
> - Change all sys initcall to module driver.
> - change the max77620_read argument to unisgned int from u8.
>=20
> Changes from V4:
> - Take care of fps nodes.
> - Drop the battery charger and low battery binding and related code as
>   it need to go on power driver.
>=20
> Changes from V5:
> -None
>=20
> Changes from V6:
> - Taken care of Lee's comment like used defines for irqs, remove max77620
>   register accesss abstractions, remove DTof module and use ID table only,
>   reduce the copyright lines.
> - Drop configuration for hard power off time chnage as it will be in
>   power driver.
> - Use direct regmap from all drivers instead of using abstractions.
> - This depends on patch
>=20
> Change from V7:
> - Use MFD defines for making mfd cells.
> - Use new property name.
>=20
> Changes from V8:
> - Remove the usage of MFD defines. Remove mutex_config as not needed.
>=20
> Changes from V9:
> - Use the devm_regmap_add_irq_chip() for irq registration.
>=20
>  drivers/mfd/Kconfig          |  15 ++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/max77620.c       | 544 +++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/mfd/max77620.h | 337 +++++++++++++++++++++++++++
>  4 files changed, 897 insertions(+)
>  create mode 100644 drivers/mfd/max77620.c
>  create mode 100644 include/linux/mfd/max77620.h

Lee,

Were you going to pick this up along with the corresponding DT bindings?

Thierry

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXINVWAAoJEN0jrNd/PrOh/KEP/3T1hiCyDqoVrePoWZPQ7d60
DBzNxEaeJxNW88Jp1B+NTuOZOpL0czMzFHNMPVKhi2jZFBw3V+QGG/HtlO0eiIKu
KBd9lydC3Uo5sMeN1On4Q5cjWMkraNxGCy5R0wEhiqjLTqOTFcrvpn1TcQdHhAnF
hoOB0fVFn73Z5PjF4KigFPr9eqmZAkRPLju8XQlXrsv8WHRiTp7XEQxYrzeqUNC+
rYPWPV3Ug/TDJyz0jVZnePqKtqaZmnYIlG6B5DOSFl/MSxXy3Q7kZqIO51U0d0Tw
klzXHH4Tz8uN2JQbKapRfqD/DoiaNUFvOCw3Qs1d2ROZePaWhPsGeWiflnBiqZfq
EUXMykWo/1pjA/azT+73ZEo52PYWz0D7V0oDuSU3ftpkcpV61j9Sd5g9YwktF8aK
6B5umbvztTYRzf1jSYtOLRCKKA2ahEejmERgRnzo50B6xzG/FdYMNK2JC3gHdYHZ
oa9HePq34pfeUtbcbXfvgVOGhHBPzdQ+SXyNX9vHugKxOCHsfgoC1Mj9/xbwH0ct
m/l5FisP9770u9838cqcD+JW7MAwrXt55J+YVY8mmTjjceDn7/m4jmG/E9WkGHZX
dt0JzpKOFhqVrEa+OlJ/VKXrIlx9HJyL7q56hYr5693DD9JQMhpkec/kGapxxGJY
yltr7xOIU/AfOmqGfVfG
=/cZR
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
