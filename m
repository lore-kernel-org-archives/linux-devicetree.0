Return-Path: <SRS0=t03Y=WF=verge.net.au=horms@kernel.org>
Date: Fri, 9 Aug 2019 13:41:49 -0700
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] of: Fix of_empty_ranges_quirk()
Message-ID: <20190809204148.fv3cvdbgg5e3mzq5@verge.net.au>
References: <20190809173321.19944-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809173321.19944-1-marek.vasut@gmail.com>
To: marek.vasut@gmail.com
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 09, 2019 at 07:33:21PM +0200, marek.vasut@gmail.com wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
> types, which cannot work well. Replace that with boolean only and fix
> usage logic in of_translate_one() -- the check should trigger when the
> ranges are NULL and the quirk is applicable on the hardware.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/of/address.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index b492176c0572..ae2819e148b8 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -616,7 +616,7 @@ static struct of_bus *of_match_bus(struct device_node *np)
>  	return NULL;
>  }
>  
> -static int of_empty_ranges_quirk(struct device_node *np)
> +static bool of_empty_ranges_quirk(struct device_node *np)
>  {
>  	if (IS_ENABLED(CONFIG_PPC)) {
>  		/* To save cycles, we cache the result for global "Mac" setting */
> @@ -631,7 +631,8 @@ static int of_empty_ranges_quirk(struct device_node *np)
>  			quirk_state =
>  				of_machine_is_compatible("Power Macintosh") ||
>  				of_machine_is_compatible("MacRISC");
> -		return quirk_state;
> +		if (quirk_state > 0)
> +			return true;
>  	}
>  	return false;
>  }
> @@ -662,8 +663,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>  	 * This code is only enabled on powerpc. --gcl
>  	 */
>  	ranges = of_get_property(parent, rprop, &rlen);
> -	if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
> -		pr_debug("no ranges; cannot translate\n");
> +	if (ranges == NULL && of_empty_ranges_quirk(parent)) {
> +		pr_err("no ranges; cannot translate\n");
>  		return 1;
>  	}
>  	if (ranges == NULL || rlen == 0) {
> -- 
> 2.20.1
> 
