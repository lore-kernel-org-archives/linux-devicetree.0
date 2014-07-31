From: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: initial clock driver for TWL6030
Date: Thu, 31 Jul 2014 16:16:17 +0300
Message-ID: <53DA41A1.5010900@ti.com>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de> <1406728949-7560-3-git-send-email-sassmann@kpanic.de> <20140730175033.GA17528@sirena.org.uk> <53DA12BF.1060008@kpanic.de> <53DA284D.6030404@ti.com> <53DA2F53.8010405@kpanic.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53DA2F53.8010405-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, peter.ujfalusi-l0cyMroinI0@public.gmane.org, =?windows-1252?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

<snip>

>>> +static int of_twl6030_clk32kg_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device_node *node = pdev->dev.of_node;
>>> +	struct clk *clk;
>>> +
>>> +	if (!node)
>>> +		return -ENODEV;
>>> +
>>> +	clk = devm_clk_get(&pdev->dev, "clk32kg");
>>> +	if (IS_ERR(clk))
>>> +		return PTR_ERR(clk);
>>> +
>>> +	return clk_prepare(clk);
>>
>> This is plain wrong as pointed out earlier. The driver that uses the
>> clock must enable it.
>
> Understood. I'll change it to clk_prepare_enable().

Nono, remove it completely from here. The clock driver should not enable 
itself by default. The clock itself has some sort of customer somewhere 
(like am33xx-wifi driver), which should request for the clock and enable 
it only when needed.

-Tero

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
