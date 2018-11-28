From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 08/15] rtc: sun6i: Expose internal
 oscillator through device tree
Date: Wed, 28 Nov 2018 11:33:02 +0100
Message-ID: <20181128103302.n7abjuf4ixjafth6@flea>
References: <20181128093013.24442-1-wens@csie.org>
 <20181128093013.24442-10-wens@csie.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4vh5seys36kdunea"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB3W57HPQKGQEB6RD3OY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181128093013.24442-10-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--4vh5seys36kdunea
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

65;5402;1c
On Wed, Nov 28, 2018 at 05:30:06PM +0800, Chen-Yu Tsai wrote:
> The bindings have been updated to expose the RTC's internal oscillator,
> for some SoCs that have it directly feeding the PRCM block. The changes
> include the index 2 for the clock outputs, as well as the clock output
> names.
> 
> This patch adds the internal oscillator to the list of clocks exposed
> through of_clk_add_hw_provider(), and also have the driver optionally
> fetch the name of the clock from the device tree if it's available.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  drivers/rtc/rtc-sun6i.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index 62ed9ce53d8c..273ab7fbbbe3 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -220,6 +220,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>  		.ops		= &sun6i_rtc_osc_ops,
>  		.name		= "losc",
>  	};
> +	const char *iosc_name = "rtc-int-osc";
>  	const char *clkout_name = "osc32k-out";
>  	const char *parents[2];
>  
> @@ -228,7 +229,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>  		return;
>  
>  	rtc->data = data;
> -	clk_data = kzalloc(struct_size(clk_data, hws, 2), GFP_KERNEL);
> +	clk_data = kzalloc(struct_size(clk_data, hws, 3), GFP_KERNEL);
>  	if (!clk_data) {
>  		kfree(rtc);
>  		return;
> @@ -253,8 +254,10 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>  	if (!of_get_property(node, "clocks", NULL))
>  		goto err;
>  
> +	of_property_read_string_index(node, "clock-output-names", 2,
> +				      &iosc_name);
>  	rtc->int_osc = clk_hw_register_fixed_rate_with_accuracy(NULL,
> -								"rtc-int-osc",
> +								iosc_name,
>  								NULL, 0,
>  								rtc->data->rc_osc_rate,
>  								300000000);
> @@ -290,9 +293,10 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
>  		return;
>  	}
>  
> -	clk_data->num = 2;
> +	clk_data->num = 3;
>  	clk_data->hws[0] = &rtc->hw;
>  	clk_data->hws[1] = __clk_get_hw(rtc->ext_losc);
> +	clk_data->hws[2] = rtc->int_osc;

Shouldn't we add a check on either the compatible on the number of
clock-output-names?

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--4vh5seys36kdunea--
