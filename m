From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH resend v2 4/9] regulator: axp20x: support
 AXP809 variant
Date: Tue, 29 Mar 2016 12:51:30 +0300
Message-ID: <1459245090.14208.1.camel@plaes.org>
References: <1459243352-23344-1-git-send-email-wens@csie.org>
	 <1459243352-23344-5-git-send-email-wens@csie.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJLTBEBXENBBJFA5G3QKGQESWWVHHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1459243352-23344-5-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: wens-jdAy2FN1RRM@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-03-29 at 17:22 +0800, Chen-Yu Tsai wrote:
> The X-Powers AXP809 PMIC has a similar set of regulators as the
> AXP221,
> though a few LDOs were removed, and a new switch output added. Like
> the
> AXP221, AXP809 also has DC1SW and DC5LDO, which are internally
> chained
> to DCDC1 and DCDC5, respectively.
> 
> Add support for this new variant. Also remove the "axp22x_" prefix
> from
> DC1SW/DC5LDO supply handling code, as the AXP809 uses it as well.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/regulator/axp20x-regulator.c | 119
> ++++++++++++++++++++++++++---------
>  1 file changed, 90 insertions(+), 29 deletions(-)
> 

[...]

> @@ -420,17 +481,17 @@ static int axp20x_regulator_probe(struct
> platform_device *pdev)
>  		/*
>  		 * Save AXP22X DCDC1 / DCDC5 regulator names for
> later.
>  		 */

You should probably update this comment too, due to changes below.

> -		if (regulators == axp22x_regulators) {
> -			/* Can we use rdev->constraints->name
> instead? */
> -			if (i == AXP22X_DCDC1)
> -				of_property_read_string(rdev
> ->dev.of_node,
> -							"regulator
> -name",
> -							&axp22x_dc1_
> name);
> -			else if (i == AXP22X_DCDC5)
> -				of_property_read_string(rdev
> ->dev.of_node,
> -							"regulator
> -name",
> -							&axp22x_dc5_
> name);
> -		}
> +		if ((regulators == axp22x_regulators && i ==
> AXP22X_DCDC1) ||
> +		    (regulators == axp809_regulators && i ==
> AXP809_DCDC1))
> +			of_property_read_string(rdev->dev.of_node,
> +						"regulator-name",
> +						&dcdc1_name);
> +
> +		if ((regulators == axp22x_regulators && i ==
> AXP22X_DCDC5) ||
> +		    (regulators == axp809_regulators && i ==
> AXP809_DCDC5))
> +			of_property_read_string(rdev->dev.of_node,
> +						"regulator-name",
> +						&dcdc5_name);
>  	}
>  
>  	return 0;
> -- 
> 2.7.0
> 
