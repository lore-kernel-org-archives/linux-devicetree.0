From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 4/5] pinctrl: mediatek: Add Pinctrl/GPIO/EINT driver
 for mt2701
Date: Mon, 28 Dec 2015 16:07:46 +0800
Message-ID: <1451290066.11129.4.camel@mtksdaap41>
References: <1451286546-5920-1-git-send-email-biao.huang@mediatek.com>
 <1451286546-5920-5-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1451286546-5920-5-git-send-email-biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-12-28 at 15:09 +0800, Biao Huang wrote:
> Add mt2701 support using mediatek common pinctrl driver.
> MT2701 have some special pins need an extra setting register
> than other ICs, so adding this support to common code.
> 
> Signed-off-by: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Acked-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
<...>
> +
> +static struct platform_driver mtk_pinctrl_driver = {
> +	.probe = mt2701_pinctrl_probe,
> +	.driver = {
> +		.name = "mediatek-mt2701-pinctrl",
> +		.owner = THIS_MODULE,
> +		.of_match_table = mt2701_pctrl_match,
> +	},
> +};
> +
> +static int __init mtk_pinctrl_init(void)
> +{
> +	return platform_driver_register(&mtk_pinctrl_driver);
> +}
> +
> +arch_initcall(mtk_pinctrl_init);


As discussed in
http://lists.infradead.org/pipermail/linux-mediatek/2015-December/003350.html
we should use subsys_initcall() instead.


> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index f307f1d..76279f0 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
<...>
> @@ -347,6 +352,7 @@ static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
>  		ret = mtk_pconf_set_pull_select(pctl, pin, true, false, arg);
>  		break;
>  	case PIN_CONFIG_INPUT_ENABLE:
> +		mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
>  		ret = mtk_pconf_set_ies_smt(pctl, pin, arg, param);
>  		break;
>  	case PIN_CONFIG_OUTPUT:
> @@ -354,6 +360,7 @@ static int mtk_pconf_parse_conf(struct pinctrl_dev *pctldev,
>  		ret = mtk_pmx_gpio_set_direction(pctldev, NULL, pin, false);
>  		break;
>  	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +		mtk_pmx_gpio_set_direction(pctldev, NULL, pin, true);
>  		ret = mtk_pconf_set_ies_smt(pctl, pin, arg, param);
>  		break;
>  	case PIN_CONFIG_DRIVE_STRENGTH:

This change is not directly related to adding mt2710 support and change
behavior for all MTK pinctrl drivers, please create a separate patch for
this.

Joe.C
