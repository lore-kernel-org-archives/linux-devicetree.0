From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Re: [PATCH 05/11] drivers: pinctrl: add driver for
 Allwinner A64 SoC
Date: Mon, 1 Feb 2016 23:02:15 +0000
Message-ID: <56AFE3F7.6050204@arm.com>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
 <1454348370-3816-6-git-send-email-andre.przywara@arm.com>
 <20160201182754.GA14737@excalibur.cnev.de>
 <20160201184505.GB14737@excalibur.cnev.de>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDNZNK75ZIKRBHWIX62QKGQEZOW7EZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160201184505.GB14737-Hlt6eto4P0pdWf7zwHaZWbNAH6kLmebB@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/02/16 18:45, Karsten Merker wrote:
> Hello,
> 
> I by mistake pressed "send" on my previous mail when I intended
> to further edit it, so here comes a followup.
> I definitely need more coffee ;-).

Or less?  ;-)             vvvvvvvvvv Thinking of twitchy fingers...
> On Mon, Feb 01, 2016 at 07:27:54PM +0100, Karsten Merker wrote:
>> On Mon, Feb 01, 2016 at 05:39:24PM +0000, Andre Przywara wrote:
> 
>>> +static const struct sunxi_pinctrl_desc a64_pinctrl_data = {
>>> +	.pins = a64_pins,
>>> +	.npins = ARRAY_SIZE(a64_pins),
>>> +	.irq_banks = 3,
>>> +};
>>> +
>>> +static int a64_pinctrl_probe(struct platform_device *pdev)
>>> +{
>>> +	return sunxi_pinctrl_init(pdev,
>>> +				  &a64_pinctrl_data);
>>> +}
>>> +
>>> +static const struct of_device_id a64_pinctrl_match[] = {
>>> +	{ .compatible = "allwinner,a64-pinctrl", },
> 
> s/allwinner,a64-pinctrl/allwinner,sun50i-a64-pinctrl/ ?

As mentioned in the other mail, allwinner should be enough to make the
naming unique. Especially as this is about DT namings, which should be
valid outside of the Linux world even.

Cheers,
Andre.

> 
>>> +	{}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, a64_pinctrl_match);
>>> +
>>> +static struct platform_driver a64_pinctrl_driver = {
>>> +	.probe	= a64_pinctrl_probe,
>>> +	.driver	= {
>>> +		.name		= "a64-pinctrl",
>>> +		.of_match_table	= a64_pinctrl_match,
>>> +	},
>>> +};
>>> +module_platform_driver(a64_pinctrl_driver);
>>> +
>>> +MODULE_AUTHOR("Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>");
>>> +MODULE_DESCRIPTION("Allwinner A64 pinctrl driver");
>>> +MODULE_LICENSE("GPL");
>>
>> For the above function names one could also think about using the
> 
> s/function names/variable definitions/
> 
>> existing naming scheme including the SoC family as we do in the
>> other sunxi pinctrl drivers, but as they are only internal to the
>> driver, that would really just be a matter of cosmetics :-).
> 
> Regards,
> Karsten
> 
