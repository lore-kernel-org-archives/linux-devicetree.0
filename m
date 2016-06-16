From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 5/5] mfd: rn5t618: register restart handler
Date: Thu, 16 Jun 2016 16:03:28 +0100
Message-ID: <20160616150328.GE4948@dell>
References: <20160608010429.19618-1-stefan@agner.ch>
 <20160608010429.19618-6-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160608010429.19618-6-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, carlo@caione.org, b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 07 Jun 2016, Stefan Agner wrote:

> Use the PMIC's repower capability for reboots. Register a restart
> handler with use a default priority of 128.

Care to elaborate as to why you're using 128?

> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Chronological.

> ---
>  drivers/mfd/rn5t618.c | 40 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 34 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> index d9b4d40..6bc0863 100644
> --- a/drivers/mfd/rn5t618.c
> +++ b/drivers/mfd/rn5t618.c
> @@ -12,11 +12,13 @@
>   * along with this program. If not, see <http://www.gnu.org/licenses=
/>.
>   */
> =20
> +#include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/rn5t618.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/reboot.h>
>  #include <linux/regmap.h>
> =20
>  static const struct mfd_cell rn5t618_cells[] =3D {
> @@ -50,17 +52,34 @@ static const struct regmap_config rn5t618_regmap_=
config =3D {
>  };
> =20
>  static struct rn5t618 *rn5t618_pm_power_off;
> +static struct notifier_block rn5t618_restart_handler;
> =20
> -static void rn5t618_power_off(void)
> +static void rn5t618_trigger_poweroff_sequence(bool repower)
>  {
>  	/* disable automatic repower-on */
>  	regmap_update_bits(rn5t618_pm_power_off->regmap, RN5T618_REPCNT,
> -			   RN5T618_REPCNT_REPWRON, 0);
> +			   RN5T618_REPCNT_REPWRON, repower);
>  	/* start power-off sequence */
>  	regmap_update_bits(rn5t618_pm_power_off->regmap, RN5T618_SLPCNT,
>  			   RN5T618_SLPCNT_SWPWROFF, RN5T618_SLPCNT_SWPWROFF);
>  }
> =20
> +static void rn5t618_power_off(void)
> +{
> +	rn5t618_trigger_poweroff_sequence(false);
> +}
> +
> +static int rn5t618_restart(struct notifier_block *this,
> +			    unsigned long mode, void *cmd)
> +{
> +	rn5t618_trigger_poweroff_sequence(true);
> +
> +	mdelay(10);

Why 10ms?

> +	return NOTIFY_DONE;
> +}
> +
> +
>  static const struct of_device_id rn5t618_of_match[] =3D {
>  	{ .compatible =3D "ricoh,rn5t567", .data =3D (void *)RN5T567 },
>  	{ .compatible =3D "ricoh,rn5t618", .data =3D (void *)RN5T618 },
> @@ -103,13 +122,22 @@ static int rn5t618_i2c_probe(struct i2c_client =
*i2c,
>  		return ret;
>  	}
> =20
> +	rn5t618_pm_power_off =3D priv;
>  	if (of_device_is_system_power_controller(i2c->dev.of_node)) {
> -		if (!pm_power_off) {
> -			rn5t618_pm_power_off =3D priv;
> +		if (!pm_power_off)
>  			pm_power_off =3D rn5t618_power_off;
> -		} else {
> +		else
>  			dev_err(&i2c->dev, "Failed to set poweroff capability, already de=
fined\n");
> -		}
> +	}
> +
> +	rn5t618_restart_handler.notifier_call =3D rn5t618_restart;
> +	rn5t618_restart_handler.priority =3D 128;
> +
> +	ret =3D register_restart_handler(&rn5t618_restart_handler);
> +	if (ret) {
> +		dev_err(&i2c->dev, "%s: cannot register restart handler, %d\n",
> +				__func__, ret);

Don't use __func__ in log prints.

Users don't care and developers know how to use `git grep`.

> +		return ret;
>  	}
> =20
>  	return 0;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
