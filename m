From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 2/9] dt-bindings: add Amlogic Meson GPIO
 interrupt-controller DT binding documentation
Date: Thu, 15 Jun 2017 10:34:46 +0200
Message-ID: <d6fd8d6f-7b81-68be-7e7e-cbfdc422e1de@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
 <d7c3fd04-d3d7-c128-1dcc-921e99677130@gmail.com>
 <c5453bc7-1d8b-d3a1-91ac-779734444b8b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c5453bc7-1d8b-d3a1-91ac-779734444b8b-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 13.06.2017 um 10:53 schrieb Marc Zyngier:
> On 10/06/17 22:57, Heiner Kallweit wrote:
>> Add dt binding documentation for Amlogic meson GPIO interrupt controller.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> v5:
>> - added Reviewed-by
>> v6:
>> - rename parent-interrupts to interrupts
>> v7:
>> - no changes
>> ---
>>  .../amlogic,meson-gpio-intc.txt                    | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>> new file mode 100644
>> index 00000000..4c9bb323
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>> @@ -0,0 +1,26 @@
>> +Amlogic meson GPIO interrupt controller
>> +
>> +Meson SoCs contains an interrupt controller which is able watch the SoC pads
>> +and generate an interrupt on edges or level. The controller is essentially a
>> +256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
>> +or level and polarity. The actual number of interrupt exposed depends on the
>> +SoC.
>> +
>> +Required properties:
>> +
>> +- compatible : should be "amlogic,meson-gpio-intc".
>> +- reg : Specifies base physical address and size of the registers.
>> +- interrupt-controller : Identifies the node as an interrupt controller.
>> +- #interrupt-cells : should be 2.
>> +- interrupts : list of GIC interrupts which can be used with the
>> +	       GPIO IRQ multiplexer
>> +
>> +Example:
>> +
>> +gpio_intc: interrupt-controller@9880 {
>> +	compatible = "amlogic,meson-gpio-intc";
>> +	reg = <0x0 0x09880 0x0 0x10>;
>> +	interrupt-controller;
>> +	#interrupt-cells = <2>;
>> +	interrupts = <64 65 66 67 68 69 70 71>;
> 
> What does it mean to have single-cell interrupt specifiers like this,
> when the interrupt-parent is a GIC, which has #interrupt-cells set to 3?
> Either you use actual interrupt specifiers, or you use another identifier.
> 
The following approaches have been used already:

- standard interrupts property (3-cell): was rejected because the chip doesn't
  actually generate the interrupts but just provides a programmable IRQ routing

- property "parent-interrupts" (1-cell): Rob suggested to use "interrupts" instead

I'd appreciate if you could come to an agreement with Rob, whatever the outcome
is is fine with me.

Rgds, Heiner

> Thanks,
> 
> 	M.
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
