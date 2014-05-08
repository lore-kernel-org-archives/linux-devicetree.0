From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: k2e-evm: add AEMIF/NAND device entry
Date: Fri, 9 May 2014 00:25:45 +0300
Message-ID: <536BF659.5040706@ti.com>
References: <1399575560-31090-1-git-send-email-ivan.khoronzhuk@ti.com> <536BD85E.8090505@ti.com> <536BE875.2070005@ti.com> <536BF55A.6030406@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536BF55A.6030406-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: grygorii.strashko-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 05/09/2014 12:21 AM, Santosh Shilimkar wrote:
> On Thursday 08 May 2014 04:26 PM, Ivan Khoronzhuk wrote:
>> On 05/08/2014 10:17 PM, Santosh Shilimkar wrote:
>>> On Thursday 08 May 2014 02:59 PM, Ivan Khoronzhuk wrote:
>>>> Add AEMIF/NAND device entry.
>>>>
>>>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
>>>> ---
>>>>    arch/arm/boot/dts/k2e-evm.dts | 52 +++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 52 insertions(+)
>>>>
>>> Thanks. Will pick this up for 3.16
>>>
>> Ups. Seems I've not changed ubifs partition size, always think about 128 Mb, but here 512 Mb.
>> I will send updated version with correct partition size.
>>
>>
> I was about to reply that patch wasn't applying cleanly. V2 applied
> to for_3.16/dts branch.
>
> Can you also rebase the ke2 patch against the dts branch and
> repost it ?
>
> Thanks !!
>
> regards,
> Santosh

Sure

-- 
Regards,
Ivan Khoronzhuk

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
