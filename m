From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [v3,5/5] mfd: rn5t618: register restart handler
Date: Sun, 26 Jun 2016 08:13:18 -0700
Message-ID: <20160626151318.GA15869@roeck-us.net>
References: <20160626011515.4428-6-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160626011515.4428-6-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, carlo@caione.org, b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 25, 2016 at 06:15:15PM -0700, Stefan Agner wrote:
> Use the PMIC's repower capability for reboots. Register a restart
> handler and use a slightly elevated priority of 192 since the PMIC
> has suprior reset capability (causing a system wide reset).
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> ---
>  drivers/mfd/rn5t618.c | 42 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> index 1831740..14f3b5f 100644
> --- a/drivers/mfd/rn5t618.c
> +++ b/drivers/mfd/rn5t618.c
> @@ -12,11 +12,13 @@
>   * along with this program. If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/rn5t618.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/reboot.h>
>  #include <linux/regmap.h>
>  
>  static const struct mfd_cell rn5t618_cells[] = {
> @@ -50,17 +52,37 @@ static const struct regmap_config rn5t618_regmap_config = {
>  };
>  
>  static struct rn5t618 *rn5t618_pm_power_off;
> +static struct notifier_block rn5t618_restart_handler;
>  
> -static void rn5t618_power_off(void)
> +static void rn5t618_trigger_poweroff_sequence(bool repower)
>  {
>  	/* disable automatic repower-on */
>  	regmap_update_bits(rn5t618_pm_power_off->regmap, RN5T618_REPCNT,
> -			   RN5T618_REPCNT_REPWRON, 0);
> +			   RN5T618_REPCNT_REPWRON, repower);

This only works because RN5T618_REPCNT_REPWRON happens to be BIT(0).
Better would be

			RN5T618_REPCNT_REPWRON,
			repower ?  RN5T618_REPCNT_REPWRON : 0

Guenter
