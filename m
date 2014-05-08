From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: k2e-evm: add AEMIF/NAND device entry
Date: Thu, 8 May 2014 23:26:29 +0300
Message-ID: <536BE875.2070005@ti.com>
References: <1399575560-31090-1-git-send-email-ivan.khoronzhuk@ti.com> <536BD85E.8090505@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536BD85E.8090505-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: grygorii.strashko-l0cyMroinI0@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 05/08/2014 10:17 PM, Santosh Shilimkar wrote:
> On Thursday 08 May 2014 02:59 PM, Ivan Khoronzhuk wrote:
>> Add AEMIF/NAND device entry.
>>
>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/k2e-evm.dts | 52 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>
> Thanks. Will pick this up for 3.16
>

Ups. Seems I've not changed ubifs partition size, always think about 128 
Mb, but here 512 Mb.
I will send updated version with correct partition size.


-- 
Regards,
Ivan Khoronzhuk

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
