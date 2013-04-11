From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/2] mfd: wm8994: Add some OF properties
Date: Thu, 11 Apr 2013 19:06:53 +0200
Message-ID: <5166EDAD.4060808@samsung.com>
References: <1365698223-4684-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1365698223-4684-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1365698223-4684-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>
List-Id: devicetree@vger.kernel.org

On 04/11/2013 06:37 PM, Mark Brown wrote:
> Add properties for some of the more important bits of platform data and
> fill out the binding document.
> 
> Not all of the current platform data is suitable for the sort of fixed
> configuration that is done using DT, some of it should have runtime
> mechanisms added instead and some is unlikely to ever be used in practical
> systems.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Couple cosmetics remarks below, just in case you happen to resend the patch
for some other reason.

> ---
>  Documentation/devicetree/bindings/sound/wm8994.txt |   58 ++++++++++++++-
>  drivers/mfd/wm8994-core.c                          |   75 +++++++++++++++++++-
>  2 files changed, 130 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/wm8994.txt b/Documentation/devicetree/bindings/sound/wm8994.txt
> index 7a7eb1e..bb731ab 100644
> --- a/Documentation/devicetree/bindings/sound/wm8994.txt
> +++ b/Documentation/devicetree/bindings/sound/wm8994.txt
> @@ -5,14 +5,70 @@ on the board).
>  
>  Required properties:
>  
> -  - compatible : "wlf,wm1811", "wlf,wm8994", "wlf,wm8958"
> +  - compatible : One of "wlf,wm1811", "wlf,wm8994" or "wlf,wm8958"

Missing dot.

> +Optional properties:

> +
> +  - wlf,ldoena-always-driven : If present LDOENA is always driven

Ditto.

>  Example:
>  
>  codec: wm8994@1a {
>  	compatible = "wlf,wm8994";
>  	reg = <0x1a>;
> +
> +	gpio-controller;
> +	#gpio-cells = <2>;
> +
> +        lineout1-se;
^^^^^^^^^^^^^

Could be tab instead of spaces.

> +#ifdef CONFIG_OF
> +static int wm8994_set_pdata_from_of(struct wm8994 *wm8994)
> +{
> +	struct device_node *np = wm8994->dev->of_node;
> +	struct wm8994_pdata *pdata = &wm8994->pdata;
> +	int i;
> +
> +	if (!np)
> +		return 0;
> +
> +	if (of_property_read_u32_array(np, "wlf,gpio-cfg", pdata->gpio_defaults,
> +				       ARRAY_SIZE(pdata->gpio_defaults)) >= 0) {
> +		for (i = 0; i < ARRAY_SIZE(pdata->gpio_defaults); i++) {
> +			if (wm8994->pdata.gpio_defaults[i] == 0)

Could be simplified to: if (pdata->gpio_defaults[i] == 0)

Thanks for the updated series.
