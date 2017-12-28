From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: Re: [PATCH 2/7] watchdog: jz4740: Use devm_* functions
Date: Thu, 28 Dec 2017 20:59:27 +0100
Message-ID: <1514491167.6093.0@smtp.crapouillou.net>
References: <20171228162939.3928-1-paul@crapouillou.net>
        <20171228162939.3928-3-paul@crapouillou.net>
        <9778afd4-5841-0d48-cde3-c02872623a5f@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9778afd4-5841-0d48-cde3-c02872623a5f-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

Le jeu. 28 d=E9c. 2017 =E0 18:48, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> a=20
=E9crit :
> On 12/28/2017 08:29 AM, Paul Cercueil wrote:
>> - Use devm_clk_get instead of clk_get
>> - Use devm_watchdog_register_device instead of=20
>> watchdog_register_device
>>=20
>> Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
>> ---
>>   drivers/watchdog/jz4740_wdt.c | 27 ++++++++-------------------
>>   1 file changed, 8 insertions(+), 19 deletions(-)
>>=20
>> diff --git a/drivers/watchdog/jz4740_wdt.c=20
>> b/drivers/watchdog/jz4740_wdt.c
>> index 6955deb100ef..92d6ca8ceb49 100644
>> --- a/drivers/watchdog/jz4740_wdt.c
>> +++ b/drivers/watchdog/jz4740_wdt.c
>> @@ -178,40 +178,29 @@ static int jz4740_wdt_probe(struct=20
>> platform_device *pdev)
>>   =7F  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>   	drvdata->base =3D devm_ioremap_resource(&pdev->dev, res);
>> -	if (IS_ERR(drvdata->base)) {
>> -		ret =3D PTR_ERR(drvdata->base);
>> -		goto err_out;
>> -	}
>> +	if (IS_ERR(drvdata->base))
>> +		return PTR_ERR(drvdata->base);
>>   =7F-	drvdata->rtc_clk =3D clk_get(&pdev->dev, "rtc");
>> +	drvdata->rtc_clk =3D devm_clk_get(&pdev->dev, "rtc");
>>   	if (IS_ERR(drvdata->rtc_clk)) {
>>   		dev_err(&pdev->dev, "cannot find RTC clock\n");
>> -		ret =3D PTR_ERR(drvdata->rtc_clk);
>> -		goto err_out;
>> +		return PTR_ERR(drvdata->rtc_clk);
>>   	}
>>   =7F-	ret =3D watchdog_register_device(&drvdata->wdt);
>> +	ret =3D devm_watchdog_register_device(&pdev->dev, &drvdata->wdt);
>>   	if (ret < 0)
>> -		goto err_disable_clk;
>> +		return ret;
>>   =7F  	platform_set_drvdata(pdev, drvdata);
>> -	return 0;
>>   =7F-err_disable_clk:
>> -	clk_put(drvdata->rtc_clk);
>> -err_out:
>> -	return ret;
>> +	return 0;
>>   }
>>   =7F  static int jz4740_wdt_remove(struct platform_device *pdev)
>>   {
>>   	struct jz4740_wdt_drvdata *drvdata =3D platform_get_drvdata(pdev);
>>   =7F-	jz4740_wdt_stop(&drvdata->wdt);
>> -	watchdog_unregister_device(&drvdata->wdt);
>> -	clk_put(drvdata->rtc_clk);
>> -
>> -	return 0;
>> +	return jz4740_wdt_stop(&drvdata->wdt);
>=20
> If the watchdog is running, the module can not be unloaded. Even if=20
> that wasn't
> the case, this defeats both WDIOF_MAGICCLOSE and=20
> watchdog_set_nowayout().
> Are you sure this is what you want ? If so, please call
> watchdog_stop_on_unregister() before registration; this clarifies=20
> that this
> is what you want, and you can drop the remove function.
>=20
> Thanks,
> Guenter

This patch does not change the behaviour. We always used that driver=20
built-in; what
should the behaviour be when unloading the module? Keep the watchdog=20
hardware running
if configured for 'nowayout'?

Thanks,
-Paul

>=20
>>   }
>>   =7F  static struct platform_driver jz4740_wdt_driver =3D {
>>=20
>=20
=

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
