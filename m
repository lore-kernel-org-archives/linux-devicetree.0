From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 5/5] mfd: rn5t618: register restart handler
Date: Tue, 28 Jun 2016 13:03:56 +0100
Message-ID: <20160628120356.GF24982@dell>
References: <20160628062757.24490-1-stefan@agner.ch>
 <20160628062757.24490-6-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160628062757.24490-6-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, max.oss.09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 27 Jun 2016, Stefan Agner wrote:

> Use the PMIC's repower capability for reboots. Register a restart
> handler and use a slightly elevated priority of 192 since the PMIC
> has suprior reset capability (causing a system wide reset).
>=20
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/mfd/rn5t618.c | 43 +++++++++++++++++++++++++++++++++++++----=
--
>  1 file changed, 37 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> index 1831740..b3ca6df 100644
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
> @@ -50,17 +52,38 @@ static const struct regmap_config rn5t618_regmap_=
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
> +			   RN5T618_REPCNT_REPWRON,
> +			   repower ? RN5T618_REPCNT_REPWRON : 0);
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
> +	/*
> +	 * Repower factor detection on PMIC side is not instant. 1ms
> +	 * proved to be enouth time until reset takes effect.

Spell check.

Please fix this, add all the Acks you received and resubmit the set.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> +	 */
> +	mdelay(1);
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static const struct of_device_id rn5t618_of_match[] =3D {
>  	{ .compatible =3D "ricoh,rn5t567", .data =3D (void *)RN5T567 },
>  	{ .compatible =3D "ricoh,rn5t618", .data =3D (void *)RN5T618 },
> @@ -102,13 +125,21 @@ static int rn5t618_i2c_probe(struct i2c_client =
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
>  			dev_warn(&i2c->dev, "Poweroff callback already assigned\n");
> -		}
> +	}
> +
> +	rn5t618_restart_handler.notifier_call =3D rn5t618_restart;
> +	rn5t618_restart_handler.priority =3D 192;
> +
> +	ret =3D register_restart_handler(&rn5t618_restart_handler);
> +	if (ret) {
> +		dev_err(&i2c->dev, "cannot register restart handler, %d\n", ret);
> +		return ret;
>  	}
> =20
>  	return 0;

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
