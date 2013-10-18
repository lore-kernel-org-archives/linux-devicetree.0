From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dma: atmel-dma: correct typo in the device tree bindings
 documentation
Date: Fri, 18 Oct 2013 16:42:49 +0200
Message-ID: <526148E9.8060706@atmel.com>
References: <1380876411-706-1-git-send-email-ludovic.desroches@atmel.com> <524E8169.6010801@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <524E8169.6010801-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/10/2013 10:50, Nicolas Ferre :
> On 04/10/2013 10:46, ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org :
>> From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>
>> The value to set ASAP mode for FIFO configuration is 2 instead of 1.
>>
>> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>
> Yes, sure: thanks for having corrected it!
>
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Vinod, ping?

>
>> ---
>>    Documentation/devicetree/bindings/dma/atmel-dma.txt | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/atmel-dma.txt b/Documentation/devicetree/bindings/dma/atmel-dma.txt
>> index c280a0e..434f74e 100644
>> --- a/Documentation/devicetree/bindings/dma/atmel-dma.txt
>> +++ b/Documentation/devicetree/bindings/dma/atmel-dma.txt
>> @@ -28,7 +28,7 @@ The three cells in order are:
>>    dependant:
>>      - bit 7-0: peripheral identifier for the hardware handshaking interface. The
>>      identifier can be different for tx and rx.
>> -  - bit 11-8: FIFO configuration. 0 for half FIFO, 1 for ALAP, 1 for ASAP.
>> +  - bit 11-8: FIFO configuration. 0 for half FIFO, 1 for ALAP, 2 for ASAP.
>>
>>    Example:
>>
>>
>
>


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
