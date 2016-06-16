From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/5] mfd: rn5t618: register power off callback
 optionally
Date: Thu, 16 Jun 2016 15:59:08 +0100
Message-ID: <20160616145907.GD4948@dell>
References: <20160608010429.19618-1-stefan@agner.ch>
 <20160608010429.19618-5-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160608010429.19618-5-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, carlo@caione.org, b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 07 Jun 2016, Stefan Agner wrote:

> Only register power off if the PMIC is defined as system power
> controller (see Documentation/devicetree/bindings/power/
> power-controller.txt).
>=20
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

These should be chronological.

> ---
>  drivers/mfd/rn5t618.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> index 7607ced..d9b4d40 100644
> --- a/drivers/mfd/rn5t618.c
> +++ b/drivers/mfd/rn5t618.c
> @@ -103,9 +103,13 @@ static int rn5t618_i2c_probe(struct i2c_client *=
i2c,
>  		return ret;
>  	}
> =20
> -	if (!pm_power_off) {
> -		rn5t618_pm_power_off =3D priv;
> -		pm_power_off =3D rn5t618_power_off;
> +	if (of_device_is_system_power_controller(i2c->dev.of_node)) {
> +		if (!pm_power_off) {
> +			rn5t618_pm_power_off =3D priv;
> +			pm_power_off =3D rn5t618_power_off;
> +		} else {
> +			dev_err(&i2c->dev, "Failed to set poweroff capability, already de=
fined\n");

This is not an error.  Please use dev_warn() instead.

Also, is this message actually accurate?  Your commit message would
indicate that it's not.

> +		}
>  	}
> =20
>  	return 0;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
