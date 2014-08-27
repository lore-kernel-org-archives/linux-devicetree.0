From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] mfd: Add Ricoh RN5T618 PMIC core driver
Date: Wed, 27 Aug 2014 08:56:14 +0100
Message-ID: <20140827075614.GZ26707@lee--X1>
References: <1409091237-16722-1-git-send-email-b.galvani@gmail.com>
 <1409091237-16722-2-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1409091237-16722-2-git-send-email-b.galvani@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Carlo Caione <carlo@caione.org>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Aug 2014, Beniamino Galvani wrote:
> Ricoh RN5T618 is a power management IC which integrates 3 step-down
> DCDC converters, 7 low-dropout regulators, a Li-ion battery charger,
> fuel gauge, ADC, GPIOs and a watchdog timer.
>=20
> This commit adds a MFD core driver to support the I2C communication
> with the device.
>=20
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  drivers/mfd/Kconfig         |   11 +++
>  drivers/mfd/Makefile        |    1 +
>  drivers/mfd/rn5t618.c       |  129 ++++++++++++++++++++++++++
>  include/linux/mfd/rn5t618.h |  210 +++++++++++++++++++++++++++++++++=
++++++++++
>  4 files changed, 351 insertions(+)
>  create mode 100644 drivers/mfd/rn5t618.c
>  create mode 100644 include/linux/mfd/rn5t618.h

Really nicely done.  We don't normally get many first submissions at
this quality level.

One question and a _really_ small nit though.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 8d5fad2..fae8c5b 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -582,6 +582,17 @@ config MFD_RC5T583
>  	  Additional drivers must be enabled in order to use the
>  	  different functionality of the device.
> =20
> +config MFD_RN5T618
> +	bool "Ricoh RN5T5618 PMIC"

Shouldn't this be tristate?

> +	depends on I2C=3Dy

If so, this should be:

  depends on I2C

> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Say yes here to add support for the Ricoh RN5T618 PMIC. This
> +	  driver provides common support for accessing the device,
> +	  additional drivers must be enabled in order to use the
> +	  functionality of the device.

[...]

> +++ b/drivers/mfd/rn5t618.c
> @@ -0,0 +1,129 @@

[...]

> +static int rn5t618_i2c_probe(struct i2c_client *i2c,
> +			     const struct i2c_device_id *id)
> +{

[...]

> +	dev_info(&i2c->dev, "RN5T618 MFD driver loaded");

Can you remove this line?  We normally only print things when
information is gathered from a chip i.e. version information and the
like.

> +	return 0;
> +}

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
