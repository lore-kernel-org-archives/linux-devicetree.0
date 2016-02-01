Return-Path: <karsten@excalibur.cnev.de>
Date: Mon, 1 Feb 2016 19:45:05 +0100
From: Karsten Merker <merker@debian.org>
Subject: Re: [linux-sunxi] Re: [PATCH 05/11] drivers: pinctrl: add driver for
 Allwinner A64 SoC
Message-ID: <20160201184505.GB14737@excalibur.cnev.de>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
 <1454348370-3816-6-git-send-email-andre.przywara@arm.com>
 <20160201182754.GA14737@excalibur.cnev.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160201182754.GA14737@excalibur.cnev.de>
To: Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello,

I by mistake pressed "send" on my previous mail when I intended
to further edit it, so here comes a followup.
I definitely need more coffee ;-).

On Mon, Feb 01, 2016 at 07:27:54PM +0100, Karsten Merker wrote:
> On Mon, Feb 01, 2016 at 05:39:24PM +0000, Andre Przywara wrote:

> > +static const struct sunxi_pinctrl_desc a64_pinctrl_data = {
> > +	.pins = a64_pins,
> > +	.npins = ARRAY_SIZE(a64_pins),
> > +	.irq_banks = 3,
> > +};
> > +
> > +static int a64_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +	return sunxi_pinctrl_init(pdev,
> > +				  &a64_pinctrl_data);
> > +}
> > +
> > +static const struct of_device_id a64_pinctrl_match[] = {
> > +	{ .compatible = "allwinner,a64-pinctrl", },

s/allwinner,a64-pinctrl/allwinner,sun50i-a64-pinctrl/ ?

> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, a64_pinctrl_match);
> > +
> > +static struct platform_driver a64_pinctrl_driver = {
> > +	.probe	= a64_pinctrl_probe,
> > +	.driver	= {
> > +		.name		= "a64-pinctrl",
> > +		.of_match_table	= a64_pinctrl_match,
> > +	},
> > +};
> > +module_platform_driver(a64_pinctrl_driver);
> > +
> > +MODULE_AUTHOR("Andre Przywara <andre.przywara@arm.com>");
> > +MODULE_DESCRIPTION("Allwinner A64 pinctrl driver");
> > +MODULE_LICENSE("GPL");
> 
> For the above function names one could also think about using the

s/function names/variable definitions/

> existing naming scheme including the SoC family as we do in the
> other sunxi pinctrl drivers, but as they are only internal to the
> driver, that would really just be a matter of cosmetics :-).

Regards,
Karsten
-- 
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten für Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.
