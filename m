From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 5/6] pinctrl: dt-binding: Extend meson documentation
 with GPIO IRQs support
Date: Wed, 2 Dec 2015 16:44:18 +0100
Message-ID: <CAL9uMOHQi1wwGTSEOyAQ8q5Wbvm71ib3-cf1Q07VReXAis7Pdg@mail.gmail.com>
References: <1448987062-31225-1-git-send-email-carlo@caione.org>
	<1448987062-31225-6-git-send-email-carlo@caione.org>
	<20151202153010.GA22230@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151202153010.GA22230@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Daniel Drake <drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 2, 2015 at 4:30 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Dec 01, 2015 at 05:24:21PM +0100, Carlo Caione wrote:
>> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>>
>> Extend the pinctrl binding documentation with the support for external
>> GPIO interrupts.
>>
>> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>> index 3f6a524..de669ce 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>> @@ -3,6 +3,12 @@
>>  Required properties for the root node:
>>   - compatible: "amlogic,meson8-pinctrl" or "amlogic,meson8b-pinctrl"
>>   - reg: address and size of registers controlling irq functionality
>> + - reg-names: should be "irq"
>> + - interrupt-controller: marks the device node as an interrupt controller
>> + - #interrupt-cells: should be 2. The first cell is the GPIO number. The
>> +                  second cell is used to specify trigger type.
>> + - amlogic,irqs-gpio: specifies the GPIO IRQ numbers on the GIC (GPIO_IRQ#)
>> + - interrupt-parent: specifies the parent interrupt controller.
>>
>>  === GPIO sub-nodes ===
>>
>> @@ -46,7 +52,12 @@ pinctrl-bindings.txt
>>
>>       pinctrl: pinctrl@c1109880 {
>>               compatible = "amlogic,meson8-pinctrl";
>> +             reg-names = "irq";
>>               reg = <0xc1109880 0x10>;
>> +             interrupt-parent = <&gic>;
>> +             amlogic,irqs-gpio = <64 65 66 67 68 69 70 71>;
>
> Can't you just use "interrupts" here?

Following this discussion for v2 with Marc
http://www.spinics.net/lists/devicetree/msg104385.html I decided to
move away from using the "interrupts" property since these interrupts
are not actually the pinctrl's interrupts (they are owned by the
devices using them). I guess that using "interrupts" would be a bit
misleading.

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
