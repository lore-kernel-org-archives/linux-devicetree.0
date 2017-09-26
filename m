From: "Yang, Wenyou" <Wenyou.Yang-P1yVeZNtzML3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: at91: sama5d2_xplained: Add charger node
Date: Tue, 26 Sep 2017 09:02:15 +0800
Message-ID: <2d9a44a1-0657-e187-c512-8207919e3c79@Microchip.com>
References: <20170815062420.21644-1-wenyou.yang@microchip.com>
 <20170925201331.4qzewq3rahtrynt7@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170925201331.4qzewq3rahtrynt7-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,


On 2017/9/26 4:13, Alexandre Belloni wrote:
> On 15/08/2017 at 14:24:20 +0800, Wenyou Yang wrote:
>> From: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>
>> Add the charger device node as a sub-device of act8945a mfd, move
>> the charger's properties in the node, and replace the
>> "active-semi,irq_gpios" with the "interrupts" property to denote
>> the act8945a charger's irq.
>>
>> Signed-off-by: Wenyou Yang <wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> ---
>>
>>   arch/arm/boot/dts/at91-sama5d2_xplained.dts | 23 +++++++++++++++--------
>>   1 file changed, 15 insertions(+), 8 deletions(-)
> Applied, now but I had to rework the patch a bit. Can you check this is
> working for you?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?h=at91-dt&id=4b6ad41f267b8ddabf5dd1b02a318bc74f0b95e9
It is okay for me.

Thanks a lot.

Best Regards,
Wenyou Yang

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
