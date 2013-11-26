From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 07/12] memory: davinci-aemif: introduce AEMIF driver
Date: Tue, 26 Nov 2013 20:30:52 +0200
Message-ID: <5294E8DC.3070404@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>, <1384187188-5776-8-git-send-email-ivan.khoronzhuk@ti.com> <4F5844B3A985794BA902E12C070812375F8D2E@DNCE04.ent.ti.com> <52944BD3.90105@ti.com> <5294DE17.9080900@ti.com> <5294E8B6.5000102@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5294E8B6.5000102-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/26/2013 08:30 PM, Santosh Shilimkar wrote:
> Ivan,
>
> On Tuesday 26 November 2013 12:44 PM, ivan.khoronzhuk wrote:
>> On 11/26/2013 09:20 AM, Sekhar Nori wrote:
>>> On Monday 11 November 2013 10:36 PM, Khoronzhuk, Ivan wrote:
>
>>>> +static struct platform_driver davinci_aemif_driver = {
>>>> +       .probe = davinci_aemif_probe,
>>>> +       .remove = davinci_aemif_remove,
>>>> +       .driver = {
>>>> +               .name = DRV_NAME,
>>>> +               .owner = THIS_MODULE,
>>>> +               .of_match_table = of_match_ptr(davinci_aemif_of_match),
>>>> +       },
>>>> +};
>>>> +
>>>> +module_platform_driver(davinci_aemif_driver);
>>>> +
>>>> +MODULE_AUTHOR("Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>");
>>>
>>> Is this correct? If yes, I would have expected him to sign-off on the
>>> patch too. If not, please drop this.
>>
>> I will add sign-off
>>
> Please add you as a MODULE_AUTHOR as well since you re-wrote the
> downstream driver. Ok to have both of you sign of on it.
>
> Regards,
> Santosh
>

Ok

-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
