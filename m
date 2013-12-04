From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v6 3/3] mfd: max14577: Add device tree bindings document
Date: Wed, 04 Dec 2013 20:09:18 +0900
Message-ID: <529F0D5E.4060202@samsung.com>
References: <1386153615-25456-1-git-send-email-k.kozlowski@samsung.com>
 <1386153615-25456-4-git-send-email-k.kozlowski@samsung.com>
 <529F08DD.2090005@samsung.com> <1386154579.25938.2.camel@AMDC1943>
 <529F0B75.5040004@samsung.com> <1386155011.25938.4.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1386155011.25938.4.camel@AMDC1943>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/04/2013 08:03 PM, Krzysztof Kozlowski wrote:
> On Wed, 2013-12-04 at 20:01 +0900, Chanwoo Choi wrote:
>> On 12/04/2013 07:56 PM, Krzysztof Kozlowski wrote:
>>> On Wed, 2013-12-04 at 19:50 +0900, Chanwoo Choi wrote:
> (...)
>>>>
>>>> I prefer to add dt data about max14577-muic on following:
>>>> If extcon consumer driver need to use muic device, dts should provide following dt data.
>>>>
>>>> 		muic: max14577-muic {
>>>> 			compatible = "maxim, max14577-muic";
>>>> 		};
>>>>> +	};
>>>>>
>>>> For example,
>>>> If fuel-gauge want to use extcon subsystem, dt data of fuel-gauge add 'extcon' property as following:
>>>>
>>>> 	fuel-gague@ {
>>>> 		compatible = "...";
>>>> 		extcon = <&muic>;
>>>> 	}
>>>>
>>> Hi,
>>>
>>> The extcon driver itself does not use the binding. It is only needed for
>>> consumers. Is it a common practice to add to documentation such notice
>>> for consumers only?
>>
>> As you comment, It is only for extcon consumer.
>> But extcon provider driver always is operated with extcon consumer driver.
>> If dts file don't support upper dt data about extcon provider driver,
>> all of extcon consumer drivers could not use extcon subsystem.
>>
>> I thinks it is common dt data for muic device.
> 
> OK, I'll add it.
> 

Thanks,

Best Regards,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
