From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 3/5] charger: max14577: Add charger support for Maxim
 14577
Date: Fri, 22 Nov 2013 10:57:59 +0100
Message-ID: <1385114279.29083.7.camel@AMDC1943>
References: <1385109972-28059-1-git-send-email-k.kozlowski@samsung.com>
 <1385109972-28059-4-git-send-email-k.kozlowski@samsung.com>
 <1385110476.285183224@f131.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1385110476.285183224@f131.i.mail.ru>
Sender: linux-doc-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org



On Fri, 2013-11-22 at 12:54 +0400, Alexander Shiyan wrote:
> > MAX14577 chip is a multi-function device which includes MUIC, charger
> > and voltage regulator. The driver is located in drivers/mfd.
> > 
> > This patch supports battery charging control of MAX14577 chip and
> > provides power supply class information to userspace.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ...
> > diff --git a/drivers/power/max14577_charger.c b/drivers/power/max14577_charger.c
> ...
> > +static struct platform_driver max14577_charger_driver = {
> > +	.driver = {
> > +		.owner	= THIS_MODULE,
> > +		.name	= "max14577-charger",
> > +	},
> > +	.probe		= max14577_charger_probe,
> > +	.remove		= max14577_charger_remove,
> > +};
> > +
> > +static int __init max14577_charger_init(void)
> > +{
> > +	return platform_driver_register(&max14577_charger_driver);
> > +}
> > +
> > +static void __exit max14577_charger_exit(void)
> > +{
> > +	platform_driver_unregister(&max14577_charger_driver);
> > +}
> > +
> > +module_init(max14577_charger_init);
> > +module_exit(max14577_charger_exit);
> 
> Replace "module_init" & "module_exit" with module_platform_driver here.

Sure, thanks for pointing this.

Best regards,
Krzysztof


