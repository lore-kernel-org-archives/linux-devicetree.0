From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 10/12] mtd: nand: davinci: don't set timings if AEMIF
 is used
Date: Fri, 22 Nov 2013 12:38:23 -0500
Message-ID: <528F968F.40306@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>, <1384187188-5776-11-git-send-email-ivan.khoronzhuk@ti.com> <4F5844B3A985794BA902E12C070812375F8D53@DNCE04.ent.ti.com> <528307F0.6000805@ti.com> <52838941.4060207@ti.com> <5284ABB9.70608@ti.com> <5284DFE7.70308@ti.com> <528E3DD4.7030607@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <528E3DD4.7030607-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Nori, Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: "Khoronzhuk, Ivan" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 21 November 2013 12:07 PM, Nori, Sekhar wrote:
> On 11/14/2013 8:06 PM, Santosh Shilimkar wrote:
>> On Thursday 14 November 2013 05:53 AM, Nori, Sekhar wrote:
>>> On Wednesday 13 November 2013 07:44 PM, Santosh Shilimkar wrote:
>>>> On Wednesday 13 November 2013 12:02 AM, Sekhar Nori wrote:
>>>>> On Monday 11 November 2013 10:40 PM, Khoronzhuk, Ivan wrote:
>>>>>> If Davinci AEMIF is used we don't need to set timings and bus width.
>>>>>> It is done by AEMIF driver (drivers/memory/davinci-aemfi.c).
>>>>>>
>>>>>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
>>>>>> ---
>>>>>>  drivers/mtd/nand/davinci_nand.c |   22 +++++++++++++++-------
>>>>>>  1 file changed, 15 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
>>>>>> index 4705214..879e915 100644
>>>>>> --- a/drivers/mtd/nand/davinci_nand.c
>>>>>> +++ b/drivers/mtd/nand/davinci_nand.c
>>>>>> @@ -742,27 +742,35 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>>>>>>                 goto err_clk_enable;
>>>>>>         }
>>>>>>
>>>>>> +#if !IS_ENABLED(CONFIG_TI_DAVINCI_AEMIF)
>>>>>
>>>>> This is a hack! Just because AEMIF driver is enabled, it does not
>>>>> guarantee that the timings have been setup by it. Instead of configuring
>>>>> timings in two drivers, why not just convert everyone over to use the
>>>>> new driver. Dont worry about breaking old platforms, I will help test
>>>>> and ack them.
>>>>>
>>>> How about you take a stab at and convert the DaVinci code over to make
>>>> use of new driver. We are trying to re-use as much as possible from the
>>>> common drivers and also making an option so that the DaVinci arch can
>>>> move over to these drivers if they want to.
>>>
>>> Sure I could.
>>>
>> Thanks
>>
>>> Ivan,
>>>
>>> The AEMIF driver does not use platfrom_data currently. Is that something
>>> you can add or you want me to take a stab at that as well?
>>>
>> The AEMIF new driver is device tree only and thats the direction. So the
>> better thing would be to convert Davinci to DT and then make use of this
>> new driver. Thats how most of the new drivers used on arm socs are
>> moving. Adding platform data to new driver is a step in backward
>> direction so I would want to avoid that.
> 
> Yes, that would be the ideal way. But the reality is that there is close
> to zero chance of all the DaVinci platforms using AEMIF ever getting
> converted to DT. This means that we will never be able to get rid of
> this piece of code.
>
Well that means some of those platforms support will get deprecated
soon considering other basic frameworks like irq, timer wheel etc
is assuming the DT direction. But its your call because if you
want those platforms to live, you need to convert them to DT.
 
> I do agree platform data is not the direction you want to take on ARM
> but at the same time its not really a deprecated mechanism as far as the
> broader kernel is concerned.
> 
> So, can we consider adding platform data mechanism to the AEMIF driver?
> 
Sorry but answer is "NO". If the above hack is really bothering you,
we can actually rip out the above code in question and move it
to mach-davinci. Infact thats the best direction to make the
mtd nandn driver independent of any platform quirks(dt, pdata etc)

Ivan already has a patch to do that and he is going to post
that patch. With that patch, we won't need $subject patch.

Regards,
Santosh


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
