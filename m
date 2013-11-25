From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: Fwd: [PATCH 6/8] watchdog: davinci: reuse driver for keystone
 arch
Date: Mon, 25 Nov 2013 13:09:07 +0200
Message-ID: <52932FD3.10508@ti.com>
References: <1383680783-12114-7-git-send-email-ivan.khoronzhuk@ti.com> <527A28DE.4030906@ti.com> <201311231902.02807.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201311231902.02807.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/23/2013 08:02 PM, Arnd Bergmann wrote:
> On Wednesday 06 November 2013, ivan.khoronzhuk wrote:
> 
>> @@ -1,13 +1,20 @@
>> -DaVinci Watchdog Timer (WDT) Controller
>> +Texas Instruments DaVinci/Keystone Watchdog Timer (WDT) Controller
>>   
>>   Required properties:
>> -- compatible : Should be "ti,davinci-wdt"
>> +
>> +- compatible:          "ti,davinci-wdt"
>> +                       "ti,keystone-wdt"
>> +
>>   - reg : Should contain WDT registers location and length
>>   
> 
> ...
> 
>> @@ -229,6 +229,7 @@ static int davinci_wdt_remove(struct platform_device *pdev)
>>   
>>   static const struct of_device_id davinci_wdt_of_match[] = {
>>          { .compatible = "ti,davinci-wdt", },
>> +       { .compatible = "ti,keystone-wdt", },
>>          {},
>>   };
>>   MODULE_DEVICE_TABLE(of, davinci_wdt_of_match);
> 
> You should clarify the compatible list here: It seems that the devices are fully
> compatible, so the driver should only need to check for "ti,davinci-wdt" as the
> compatible string, while the dtb files should list both "ti,davinci-wdt" and
> "ti,keystone-wdt" for keystone, but only the davinci string for davinci.
> 
> 	Arnd
> 

Ok, I will remove "ti,keystone-wdt" compatible from driver and for the keystone WDT node
describe compatible as:

compatible = "ti,keystone-wdt", "ti,davinci-wdt";

-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
