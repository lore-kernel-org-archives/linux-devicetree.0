From: "Kim, Milo" <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH RESEND 16/16] regulator: add LM363X driver
Date: Tue, 10 Nov 2015 16:54:27 +0900
Message-ID: <5641A2B3.20808@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-17-git-send-email-milo.kim@ti.com>
 <20151104135911.GC1717@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151104135911.GC1717-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 11/4/2015 10:59 PM, Mark Brown wrote:
> On Mon, Nov 02, 2015 at 02:24:35PM +0900, Milo Kim wrote:
>
> This looks mostly good, just a few fairly small things:
>
>> +lm363x_regulator_of_get_init_data(struct device *dev,
>> +			struct lm363x_regulator *lm363x_regulator, int id)
>> +{
>> +	struct device_node *np = dev->of_node;
>> +	int count;
>> +
>> +	count = of_regulator_match(dev, np, &lm363x_regulator_matches[id], 1);
>> +	if (count <= 0)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	return lm363x_regulator_matches[id].init_data;
>> +}
>
> Don't open code DT matching, use of_match in the regulator_desc and let
> the core do it for you.

OK, good.
I've also found wrong pointer reference of regulator_cfg.dev. It should 
be pdev->dev instead of pdev->dev->parent.

-	cfg.dev = dev->parent;
+	cfg.dev = dev;

Old code affects wrong parsing from the DT. So, registered regulator has 
different operation mask. In the end, regulators which has zero use 
count never gonna be disabled in regulator_init_compelete().

>
>> +	/*
>> +	 * Check LCM_EN1/2_GPIO is configured.
>> +	 * Those pins are used for enabling VPOS/VNEG LDOs.
>> +	 */
>> +	if (id == LM3632_LDO_POS)
>> +		gpio = of_get_named_gpio(np, "ti,lcm-en1-gpio", 0);
>> +	else if (id == LM3632_LDO_NEG)
>> +		gpio = of_get_named_gpio(np, "ti,lcm-en2-gpio", 0);
>
> This looks like it should be a switch statement.

Yep!

>
>> +	rdev = regulator_register(&lm363x_regulator_desc[id], &cfg);
>> +	if (IS_ERR(rdev)) {
>
> Use devm_regulator_register().

OK.

>
>> +static const struct of_device_id lm363x_regulator_of_match[] = {
>> +	{ .compatible = "ti,lm363x-regulator" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, lm363x_regulator_of_match);
>
> You shouldn't need a compatible string for a device like this, the MFD
> should just register a platform device based on the compatible string
> for the MFD.
>

Thanks for catching this.
Let me apply all your comments in the next patch.

Best regards,
Milo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
