From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 1/2] extcon: arizona: Add device bindings for the micd
 configurations
Date: Sun, 24 Apr 2016 17:49:28 +0200
Message-ID: <20160424154928.GB8880@amd>
References: <1449767299-29691-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449767299-29691-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu 2015-12-10 17:08:18, Charles Keepax wrote:
> Add device bindings to support configuring the jack detection
> configurations. Each configuration needs to specify the connection of
> the mic det pins, which micbias should be used and the value of the
> micd polarity GPIO required to activate that configuration.
> 
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>


Reviewed-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>

> ---
>  drivers/extcon/extcon-arizona.c | 53 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
> index 8647533..edbf2e1 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1201,7 +1201,54 @@ static void arizona_micd_set_level(struct arizona *arizona, int index,
>  	regmap_update_bits(arizona->regmap, reg, mask, level);
>  }
>  
> -static int arizona_extcon_device_get_pdata(struct arizona *arizona)
> +static int arizona_extcon_get_micd_configs(struct device *dev,
> +					   struct arizona *arizona)
> +{
> +	const char * const prop = "wlf,micd-configs";

> +	const int entries_per_config = 3;
> +	struct arizona_micd_config *micd_configs;
> +	int nconfs, ret;
> +	int i, j;
> +	u32 *vals;
> +
> +	nconfs = device_property_read_u32_array(arizona->dev, prop, NULL, 0);
> +	if (nconfs <= 0)
> +		return 0;
> +
> +	vals = kcalloc(nconfs, sizeof(u32), GFP_KERNEL);
> +	if (!vals)
> +		return -ENOMEM;
> +
> +	ret = device_property_read_u32_array(arizona->dev, prop, vals, nconfs);
> +	if (ret < 0)
> +		goto out;
> +
> +	nconfs /= entries_per_config;
> +
> +	micd_configs = devm_kzalloc(dev,
> +				    nconfs * sizeof(struct arizona_micd_range),
> +				    GFP_KERNEL);
> +	if (!micd_configs) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	for (i = 0, j = 0; i < nconfs; ++i) {
> +		micd_configs[i].src = vals[j++] ? ARIZONA_ACCDET_SRC : 0;
> +		micd_configs[i].bias = vals[j++];
> +		micd_configs[i].gpio = vals[j++];
> +	}
> +
> +	arizona->pdata.micd_configs = micd_configs;
> +	arizona->pdata.num_micd_configs = nconfs;
> +
> +out:
> +	kfree(vals);
> +	return ret;
> +}
> +
> +static int arizona_extcon_device_get_pdata(struct device *dev,
> +					   struct arizona *arizona)
>  {
>  	struct arizona_pdata *pdata = &arizona->pdata;
>  	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
> @@ -1249,6 +1296,8 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
>  	pdata->jd_gpio5_nopull = device_property_read_bool(arizona->dev,
>  						"wlf,use-jd2-nopull");
>  
> +	arizona_extcon_get_micd_configs(dev, arizona);
> +
>  	return 0;
>  }
>  
> @@ -1270,7 +1319,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	if (!dev_get_platdata(arizona->dev))
> -		arizona_extcon_device_get_pdata(arizona);
> +		arizona_extcon_device_get_pdata(&pdev->dev, arizona);
>  
>  	info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
>  	if (IS_ERR(info->micvdd)) {

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
