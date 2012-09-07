From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: kirkwood: Use devicetree to define DNS-32[05] fan
Date: Fri, 7 Sep 2012 23:23:31 +0200
Message-ID: <20120907212331.GF21036@lunn.ch>
References: <1347035675-23907-1-git-send-email-jm@lentin.co.uk>
 <1347035675-23907-3-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1347035675-23907-3-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> diff --git a/arch/arm/mach-kirkwood/board-dnskw.c b/arch/arm/mach-kirkwood/board-dnskw.c
> index 4ab3506..e202a07 100644
> --- a/arch/arm/mach-kirkwood/board-dnskw.c
> +++ b/arch/arm/mach-kirkwood/board-dnskw.c
> @@ -67,29 +67,6 @@ static unsigned int dnskw_mpp_config[] __initdata = {
>  	0
>  };
>  
> -/* Fan: ADDA AD045HB-G73 40mm 6000rpm@5v */
> -static struct gpio_fan_speed dnskw_fan_speed[] = {
> -	{    0,  0 },
> -	{ 3000,	 1 },
> -	{ 6000,	 2 },
> -};
> -static unsigned dnskw_fan_pins[] = {46, 45};
> -
> -static struct gpio_fan_platform_data dnskw_fan_data = {
> -	.num_ctrl	= ARRAY_SIZE(dnskw_fan_pins),
> -	.ctrl		= dnskw_fan_pins,
> -	.num_speed	= ARRAY_SIZE(dnskw_fan_speed),
> -	.speed		= dnskw_fan_speed,
> -};
> -
> -static struct platform_device dnskw_fan_device = {
> -	.name	= "gpio-fan",
> -	.id	= -1,
> -	.dev	= {
> -		.platform_data	= &dnskw_fan_data,
> -	},
> -};
> -
>  static void dnskw_power_off(void)
>  {
>  	gpio_set_value(36, 1);
> @@ -114,8 +91,6 @@ void __init dnskw_init(void)
>  	kirkwood_ehci_init();
>  	kirkwood_ge00_init(&dnskw_ge00_data);
>  
> -	platform_device_register(&dnskw_fan_device);
> -
>  	/* Register power-off GPIO. */
>  	if (gpio_request(36, "dnskw:power:off") == 0
>  	    && gpio_direction_output(36, 0) == 0)
> -- 
> 1.7.10.4
> 

Hi Jamie

Minor point. I expect you can remove the header file gpio-fan.h.

There are also a few other headers files which can be removed, but i
suggest you do this in a separate cleanup patch. I think
ata_platform.h, input.h, leds.h, map.h, bridge-regs.h and maybe also
kirkwood.h are no longer needed.

  Andrew
