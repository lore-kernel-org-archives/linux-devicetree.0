From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND 3/5] ARM: BCM63XX: add BCM63138 minimal Device Tree
Date: Thu, 1 May 2014 22:37:21 -0700
Message-ID: <CAGVrzcac=jUVtjZrX9NrNC7=eOKVGn6cBabmm98qD9k7Q5BtEg@mail.gmail.com>
References: <1398130758-19456-1-git-send-email-f.fainelli@gmail.com>
 <1398130758-19456-4-git-send-email-f.fainelli@gmail.com> <4701106.5EnjdVQgVO@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4701106.5EnjdVQgVO@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, aelder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, mbizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-04-22 3:52 GMT-07:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Monday 21 April 2014 18:39:16 Florian Fainelli wrote:
>>
>> +#include "skeleton.dtsi"
>> +
>> +/ {
>> +       compatible = "brcm,bcm63138";
>> +       model = "Broadcom BCM63138 DSL SoC";
>> +       interrupt-parent = <&gic>;
>> +
>> +       cpus {
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               cpu@0 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a9";
>> +                       next-level-cache = <&L2>;
>> +                       reg = <0>;
>> +               };
>> +       };
>
> Even if you don't support SMP yet, I can see no reason not
> to list both CPUs here. The binding is known and the code
> should ignore the extra cores if it doesn't know how to
> turn them on.

OK.

>
>> +
>> +       /* ARM bus */
>> +       axi@80000000 {
>> +               compatible = "simple-bus";
>> +               ranges = <0 0x80000000 0x783003>;
>> +               reg = <0x80000000 0x783003>;
>
> The length seems odd, I would expect that the bus actually
> translates all addresses in the 0x80000000 range to downstream
> devices even if there is nothing connected. Just round it up
> to your best knowledge.
>
> I would also drop the 'reg' property. Since you don't have a
> specific "compatible" value, there is no way to use the registers
> in this node.

OK.

>
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +
>> +               L2: cache-controller@1d000 {
>> +                       compatible = "arm,pl310-cache";
>> +                       reg = <0x1d000 0x1000>;
>> +                       cache-unified;
>> +                       cache-level = <2>;
>> +                       interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_HIGH>;
>> +               };
>> +
>> +               mpcore@1e000 {
>> +                       compatible = "simple-bus";
>> +                       reg = <0x1e000 0x20000>;
>> +                       ranges = <0 0x1e000 0x20000>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>
>
> Same thing here.
>
> Also, can you explain why there is a separate 'mpcore' bus, and why the
> cache controller is not part of that?
>
> Do you have reason to believe that this is how the hardware actually
> looks?

I think I was just mistaken by how the register space looks like and
is named, but there probably is not a separate underlying bus, so I
will move this up one level as it should.

>
>> +
>> +       /* Legacy UBUS base */
>> +       ubus@fffe8000 {
>> +               compatible = "simple-bus";
>> +               reg = <0xfffe8000 0x8053>;
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               ranges = <0 0xfffe8000 0x8053>;
>> +       };
>> +};
>
>
> Again, use a proper 'length' here and remove the 'reg' property.


>
>         Arnd
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
