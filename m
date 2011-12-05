From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] Added parameter for selection power supply name
 from pdata
Date: Mon, 05 Dec 2011 15:58:02 -0800
Message-ID: <1323129482.24760.0.camel@rklein-linux2>
References: <1323129423-24705-1-git-send-email-rklein@nvidia.com>
 <1323129423-24705-2-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323129423-24705-2-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2011-12-05 at 15:57 -0800, Rhyland Klein wrote:
> Change-Id: Ib0a41ff9ac8c1fc97aa7a87320f8d95be7988d71
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/power/sbs-battery.c       |    2 +-
>  include/linux/power/sbs-battery.h |    2 ++
>  2 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/power/sbs-battery.c b/drivers/power/sbs-battery.c
> index 1e60a54..567b8c1 100644
> --- a/drivers/power/sbs-battery.c
> +++ b/drivers/power/sbs-battery.c
> @@ -615,7 +615,7 @@ static int __devinit sbs_probe(struct i2c_client *client,
>  	chip->client = client;
>  	chip->enable_detection = false;
>  	chip->gpio_detect = false;
> -	chip->power_supply.name = "battery";
> +	chip->power_supply.name = (pdata->power_supply_name ? : "battery");
>  	chip->power_supply.type = POWER_SUPPLY_TYPE_BATTERY;
>  	chip->power_supply.properties = sbs_properties;
>  	chip->power_supply.num_properties = ARRAY_SIZE(sbs_properties);
> diff --git a/include/linux/power/sbs-battery.h b/include/linux/power/sbs-battery.h
> index 2b0a9d9..fa9bc89 100644
> --- a/include/linux/power/sbs-battery.h
> +++ b/include/linux/power/sbs-battery.h
> @@ -31,12 +31,14 @@
>   * @i2c_retry_count:		# of times to retry on i2c IO failure
>   * @poll_retry_count:		# of times to retry looking for new status after
>   *				external change notification
> + * @power_supply_name:		Optional name for power supply: default: battery
>   */
>  struct sbs_platform_data {
>  	int battery_detect;
>  	int battery_detect_present;
>  	int i2c_retry_count;
>  	int poll_retry_count;
> +	const char *power_supply_name;
>  };
>  
>  #endif

Oops, ignore these, proper patches coming soon.

-rhyland
