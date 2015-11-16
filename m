From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: sunxi: Add support for the H3 usb
 phy clocks
Date: Mon, 16 Nov 2015 09:30:24 -0600
Message-ID: <20151116153024.GA13168@rob-hp-laptop>
References: <1447616777-24660-1-git-send-email-hdegoede@redhat.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBFXNU6ZAKGQEEERFS4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447616777-24660-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 15, 2015 at 08:46:13PM +0100, Hans de Goede wrote:
> From: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> 
> The H3 has a usb-phy clk register which is similar to that of earlier
> SoCs, but with support for a larger number of phys. So we can simply add
> a new set of clk-data and a new compatible and be done with it.
> 
> Signed-off-by: Reinder de Haan <patchesrdh-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>  drivers/clk/sunxi/clk-usb.c                       | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
> index d303dec..23e7bce 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -70,6 +70,7 @@ Required properties:
>  	"allwinner,sun5i-a13-usb-clk" - for usb gates + resets on A13
>  	"allwinner,sun6i-a31-usb-clk" - for usb gates + resets on A31
>  	"allwinner,sun8i-a23-usb-clk" - for usb gates + resets on A23
> +	"allwinner,sun8i-h3-usb-clk" - for usb gates + resets on H3
>  	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
>  	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
>  
> diff --git a/drivers/clk/sunxi/clk-usb.c b/drivers/clk/sunxi/clk-usb.c
> index 1a72cd6..67b8e38 100644
> --- a/drivers/clk/sunxi/clk-usb.c
> +++ b/drivers/clk/sunxi/clk-usb.c
> @@ -243,3 +243,15 @@ static void __init sun9i_a80_usb_phy_setup(struct device_node *node)
>  	sunxi_usb_clk_setup(node, &sun9i_a80_usb_phy_data, &a80_usb_phy_lock);
>  }
>  CLK_OF_DECLARE(sun9i_a80_usb_phy, "allwinner,sun9i-a80-usb-phy-clk", sun9i_a80_usb_phy_setup);
> +
> +static const struct usb_clk_data sun8i_h3_usb_clk_data __initconst = {
> +	.clk_mask =  BIT(19) | BIT(18) | BIT(17) | BIT(16) |
> +		     BIT(11) | BIT(10) | BIT(9) | BIT(8),
> +	.reset_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
> +};
> +
> +static void __init sun8i_h3_usb_setup(struct device_node *node)
> +{
> +	sunxi_usb_clk_setup(node, &sun8i_h3_usb_clk_data, &sun4i_a10_usb_lock);
> +}
> +CLK_OF_DECLARE(sun8i_h3_usb, "allwinner,sun8i-h3-usb-clk", sun8i_h3_usb_setup);
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
