From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [RFC 1/3] dt-bindings: interrupt-controller: Add Realtek RTD1295
Date: Fri, 25 Aug 2017 21:41:06 +0200
Message-ID: <06bc5f05-cbfb-edc3-7881-dafeba6fa8ea@suse.de>
References: <20170817101140.32000-1-afaerber@suse.de>
 <20170817101140.32000-2-afaerber@suse.de>
 <20170822021459.l3oiid3f4fs6vfa2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170822021459.l3oiid3f4fs6vfa2@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, =?UTF-8?B?6JKL5Li955C0?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 22.08.2017 um 04:14 schrieb Rob Herring:
> On Thu, Aug 17, 2017 at 12:11:38PM +0200, Andreas Färber wrote:
>> Add binding for Realtek RTD1295 IRQ mux.
>>
>> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  .../interrupt-controller/realtek,rtd119x-mux.txt   | 28 ++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/realtek,rtd119x-mux.txt
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd119x-mux.txt b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd119x-mux.txt
>> new file mode 100644
>> index 000000000000..4b43370e3d74
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtd119x-mux.txt
>> @@ -0,0 +1,28 @@
>> +Realtek RTD119x/129x IRQ Mux Controller
>> +=======================================
>> +
>> +Required properties:
>> +
>> +- compatible           :  Should be one of the following:
>> +                          - "realtek,rtd1295-irq-mux"
>> +                          - "realtek,rtd1295-iso-irq-mux"
>> +- reg                  :  Specifies base physical address and size of the registers.
>> +- interrupts           :  Specifies the interrupt line which is mux'ed.
>> +- interrupt-controller :  Presence indicates the node as interrupt controller.
>> +- #interrupt-cells     :  Shall be 1. See common bindings in interrupt.txt.
>> +
>> +
>> +Optional properties:
>> +
>> +See interrupt.txt for common bindings.
> 
> What else would apply here? interrupt-parent is the only thing I see, 
> but that's really implicit anyway.

interrupt-names would be another optional property not needed today.
interrupt-controller and #interrupt-cells are common properties, too.

I'll drop both lines if you prefer. Otherwise okay?

Regards,
Andreas

>> +
>> +
>> +Example:
>> +
>> +	interrupt-controller@98007000 {
>> +		compatible = "realtek,rtd1295-iso-irq-mux";
>> +		reg = <0x98007000 0x100>;
>> +		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <1>;
>> +	};
>> -- 
>> 2.12.3

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
