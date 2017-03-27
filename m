From: Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 3/4] dt-bindings: serial: add a new compatible string
 for SC9860
Date: Mon, 27 Mar 2017 14:23:59 +0800
Message-ID: <CAAfSe-tF=tUV8r00aXz_69H4xhj=kyZDF_BbezhQS7L3LyTriQ@mail.gmail.com>
References: <1489729898-774-1-git-send-email-chunyan.zhang@spreadtrum.com>
 <1489729898-774-4-git-send-email-chunyan.zhang@spreadtrum.com> <20170324023657.2iyh22lr52rme5bu@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324023657.2iyh22lr52rme5bu@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?T3Jzb24gWmhhaSAo57+f5LqsKQ==?= <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 24 March 2017 at 10:36, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Mar 17, 2017 at 01:51:37PM +0800, Chunyan Zhang wrote:
>> SC9860 use the same serial device which SC9836 uses, so added a new
>> compatible string to support SC9860 as well, also added an example
>> of how to describe this serial device in DT.
>>
>> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/serial/sprd-uart.txt | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/sprd-uart.txt b/Documentation/devicetree/bindings/serial/sprd-uart.txt
>> index 2aff0f2..1db5d6f 100644
>> --- a/Documentation/devicetree/bindings/serial/sprd-uart.txt
>> +++ b/Documentation/devicetree/bindings/serial/sprd-uart.txt
>> @@ -1,7 +1,19 @@
>>  * Spreadtrum serial UART
>>
>>  Required properties:
>> -- compatible: must be "sprd,sc9836-uart"
>> +- compatible: must be one of:
>> +  * "sprd,sc9836-uart"
>> +  * "sprd,sc9860-uart", "sprd,sc9836-uart"
>> +
>>  - reg: offset and length of the register set for the device
>>  - interrupts: exactly one interrupt specifier
>>  - clocks: phandles to input clocks.
>> +
>> +Example:
>> +     uart0: serial@000000 {
>
> serial@0
>

Addressed this.

> With that,
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks for your review,
Chunyan

>
>
>> +             compatible = "sprd,sc9860-uart",
>> +                          "sprd,sc9836-uart";
>> +             reg = <0x000000 0x100>;
>> +             interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>> +             clocks = <&ext_26m>;
>> +     };
>> --
>> 2.7.4
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
