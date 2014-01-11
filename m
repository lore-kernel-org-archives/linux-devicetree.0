From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: at91: document ADC clock properties
Date: Sat, 11 Jan 2014 16:29:09 +0000
Message-ID: <52D17155.8070009@kernel.org>
References: <1387296973-7779-1-git-send-email-b.brezillon@overkiz.com> <52B316A9.1060407@atmel.com> <52B729FD.7020507@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52B729FD.7020507-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 22/12/13 18:05, Jonathan Cameron wrote:
> On 12/19/13 15:54, Nicolas Ferre wrote:
>> On 17/12/2013 17:16, Boris BREZILLON :
>>> Document the clock properties required by the at91 ADC driver.
>>>
>>> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
>>
>> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Looks fine to me.  I'm just waiting on an ack from a device tree maintainer
> (or the 3 weeks to pass so I can pick it up anyway ;)
That's near enough 3 weeks (one day short) so applied to the togreg branch of iio.git.
Thanks
>
>>
>>> ---
>>>   .../devicetree/bindings/arm/atmel-adc.txt          |    5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/atmel-adc.txt b/Documentation/devicetree/bindings/arm/atmel-adc.txt
>>> index d106146..9a1175b 100644
>>> --- a/Documentation/devicetree/bindings/arm/atmel-adc.txt
>>> +++ b/Documentation/devicetree/bindings/arm/atmel-adc.txt
>>> @@ -5,6 +5,9 @@ Required properties:
>>>       <chip> can be "at91sam9260", "at91sam9g45" or "at91sam9x5"
>>>     - reg: Should contain ADC registers location and length
>>>     - interrupts: Should contain the IRQ line for the ADC
>>> +  - clock-names: tuple listing input clock names.
>>> +	Required elements: "adc_clk", "adc_op_clk".
>>> +  - clocks: phandles to input clocks.
>>>     - atmel,adc-channels-used: Bitmask of the channels muxed and enable for this
>>>       device
>>>     - atmel,adc-startup-time: Startup Time of the ADC in microseconds as
>>> @@ -44,6 +47,8 @@ adc0: adc@fffb0000 {
>>>   	compatible = "atmel,at91sam9260-adc";
>>>   	reg = <0xfffb0000 0x100>;
>>>   	interrupts = <20 4>;
>>> +	clocks = <&adc_clk>, <&adc_op_clk>;
>>> +	clock-names = "adc_clk", "adc_op_clk";
>>>   	atmel,adc-channel-base = <0x30>;
>>>   	atmel,adc-channels-used = <0xff>;
>>>   	atmel,adc-drdy-mask = <0x10000>;
>>>
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
