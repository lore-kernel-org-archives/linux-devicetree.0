From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 07/12] memory: davinci-aemif: introduce AEMIF driver
Date: Tue, 26 Nov 2013 13:26:44 -0500
Message-ID: <5294E7E4.3060600@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>, <1384187188-5776-8-git-send-email-ivan.khoronzhuk@ti.com> <4F5844B3A985794BA902E12C070812375F8D2E@DNCE04.ent.ti.com> <52944BD3.90105@ti.com> <5294B8C4.6040803@ti.com> <5294D8AD.5030106@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5294D8AD.5030106-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: "Khoronzhuk, Ivan" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 26 November 2013 12:21 PM, Sekhar Nori wrote:
> On 11/26/2013 8:35 PM, Santosh Shilimkar wrote:
>> On Tuesday 26 November 2013 02:20 AM, Sekhar Nori wrote:
>>> On Monday 11 November 2013 10:36 PM, Khoronzhuk, Ivan wrote:
>>>> Add new AEMIF driver for EMIF16 davinci controller. The EMIF16 module
>>>> is intended to provide a glue-less interface to a variety of
>>>> asynchronous memory devices like ASRA M, NOR and NAND memory. A total
>>>> of 256M bytes of any of these memories can be accessed at any given
>>>> time via four chip selects with 64M byte access per chip select.
>>>>
>>>> Synchronous memories such as DDR1 SD RAM, SDR SDRAM and Mobile SDR
>>>> are not supported.
>>>>
>>>> See http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
>>>>
>>>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
>>>> ---
>>
>> [...]
>>
>>>> +static int davinci_aemif_probe(struct platform_device *pdev)
>>>> +{
>>>> +       int ret  = -ENODEV, i;
>>>> +       struct resource *res;
>>>> +       struct device *dev = &pdev->dev;
>>>> +       struct device_node *np = dev->of_node;
>>>> +
>>>> +       if (np == NULL)
>>>> +               return 0;
>>>> +
>>>> +       if (aemif) {
>>>> +               dev_err(dev, "davinci_aemif driver is in use currently\n");
>>>> +               return -EBUSY;
>>>> +       }
>>>
>>> Why expressly prevent multiple AEMIF devices? Its entirely conceivable
>>> to have two memories like NAND and NOR flash connect to two different
>>> AEMIF interfaces.
>>>
>> Ivan wanted me to clarify the Keystone hardware which supports
>> 1 instance of controller with 4 CS. That allows already four
>> devices to be connected. Currently NAND and NOR are connected on it
>> and two more slots are free.
>>
>> Since driver support what hardware is, lets not build a driver for
>> hardware which don't exist. And if at all such a support would be
>> needed in future, we can always add it.
> 
> I understand the lack of hardware part, but its common to write the
> driver such that it can handle multiple instances. Is there any gain on
> current hardware because of this check? From what I am hearing, the code
> in question wont be exercised at all. So why go all the way and add it
> in first place?
> 
Fair enough. The check can be dropped.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
