From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 11/14] MIPS: ath79: Add OF support to the GPIO driver
Date: Sat, 18 Apr 2015 18:57:21 +0200
Message-ID: <20150418185721.3e9afaba@tock>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
	<1429280669-2986-12-git-send-email-albeu@free.fr>
	<4071167.An8CoV6UJC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4071167.An8CoV6UJC@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 17 Apr 2015 16:53:31 +0200
Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> On Friday 17 April 2015 16:24:26 Alban Bedel wrote:
> > Replace the simple GPIO chip registration by a platform driver
> > and make ath79_gpio_init() just register the device.
> > 
> > Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> > ---
> >  arch/mips/ath79/dev-common.c | 13 ++++++++
> >  arch/mips/ath79/gpio.c       | 73
> > +++++++++++++++++++++++++++++++++++++++++--- 2 files changed, 81
> > insertions(+), 5 deletions(-)
> 
> Could you move the driver to drivers/gpio/ now?

Sure, I'll add a patch to move it there.

> > +void __init ath79_gpio_init(void)
> > +{
> > +	struct resource res;
> > +
> > +	memset(&res, 0, sizeof(res));
> > +
> > +	res.flags = IORESOURCE_MEM;
> > +	res.start = AR71XX_GPIO_BASE;
> > +	res.end = res.start + AR71XX_GPIO_SIZE - 1;
> > +
> > +	platform_device_register_simple("ath79-gpio", -1, &res, 1);
> > +}
> 
> Your code looks correct, but could be shortened to 
> 
> 	struct resource mem = DEFINE_RES_MEM(AR71XX_GPIO_BASE,
> AR71XX_GPIO_SIZE);

I'll do that.

> >  
> > -void __init ath79_gpio_init(void)
> > +static const struct of_device_id ath79_gpio_of_match[] = {
> > +	{
> > +		.compatible = "qca,ar7100-gpio",
> > +		.data = (void *)AR71XX_GPIO_COUNT,
> > +	},
> > +	{
> > +		.compatible = "qca,ar7240-gpio",
> > +		.data = (void *)AR7240_GPIO_COUNT,
> > +	},
> > +	{
> > +		.compatible = "qca,ar7241-gpio",
> > +		.data = (void *)AR7241_GPIO_COUNT,
> > +	},
> > +	{
> > +		.compatible = "qca,ar9130-gpio",
> > +		.data = (void *)AR913X_GPIO_COUNT,
> > +	},
> > +	{
> > +		.compatible = "qca,ar9330-gpio",
> > +		.data = (void *)AR933X_GPIO_COUNT,
> > +	},
> > +	{
> > +		.compatible = "qca,ar9340-gpio",
> > +		.data = (void *)AR934X_GPIO_COUNT,
> > +	},
> > +	{
> > +		.compatible = "qca,qca9550-gpio",
> > +		.data = (void *)QCA955X_GPIO_COUNT,
> > +	},
> > +	{},
> > +};
> 
> How about putting the number into an 'ngpios' property like some other
> bindings do?

I'll do that, it would make things simpler.

Alban
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
