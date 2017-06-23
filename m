From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 2/9] dt-bindings: add Amlogic Meson GPIO
 interrupt-controller DT binding documentation
Date: Fri, 23 Jun 2017 13:33:24 -0500
Message-ID: <CAL_JsqLQ=WJ2rhzthZja8vvruoPbyjXxPOtMs6MNrhiD7VaDSQ@mail.gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
 <d7c3fd04-d3d7-c128-1dcc-921e99677130@gmail.com> <c5453bc7-1d8b-d3a1-91ac-779734444b8b@arm.com>
 <d6fd8d6f-7b81-68be-7e7e-cbfdc422e1de@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <d6fd8d6f-7b81-68be-7e7e-cbfdc422e1de@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Neil Armstrong <narmstrong@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-amlogic@lists.infradead.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 15, 2017 at 3:34 AM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Am 13.06.2017 um 10:53 schrieb Marc Zyngier:
>> On 10/06/17 22:57, Heiner Kallweit wrote:
>>> Add dt binding documentation for Amlogic meson GPIO interrupt controller.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>> ---
>>> v5:
>>> - added Reviewed-by
>>> v6:
>>> - rename parent-interrupts to interrupts
>>> v7:
>>> - no changes
>>> ---
>>>  .../amlogic,meson-gpio-intc.txt                    | 26 ++++++++++++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>>> new file mode 100644
>>> index 00000000..4c9bb323
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>>> @@ -0,0 +1,26 @@
>>> +Amlogic meson GPIO interrupt controller
>>> +
>>> +Meson SoCs contains an interrupt controller which is able watch the SoC pads
>>> +and generate an interrupt on edges or level. The controller is essentially a
>>> +256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
>>> +or level and polarity. The actual number of interrupt exposed depends on the
>>> +SoC.
>>> +
>>> +Required properties:
>>> +
>>> +- compatible : should be "amlogic,meson-gpio-intc".
>>> +- reg : Specifies base physical address and size of the registers.
>>> +- interrupt-controller : Identifies the node as an interrupt controller.
>>> +- #interrupt-cells : should be 2.
>>> +- interrupts : list of GIC interrupts which can be used with the
>>> +           GPIO IRQ multiplexer
>>> +
>>> +Example:
>>> +
>>> +gpio_intc: interrupt-controller@9880 {
>>> +    compatible = "amlogic,meson-gpio-intc";
>>> +    reg = <0x0 0x09880 0x0 0x10>;
>>> +    interrupt-controller;
>>> +    #interrupt-cells = <2>;
>>> +    interrupts = <64 65 66 67 68 69 70 71>;
>>
>> What does it mean to have single-cell interrupt specifiers like this,
>> when the interrupt-parent is a GIC, which has #interrupt-cells set to 3?
>> Either you use actual interrupt specifiers, or you use another identifier.
>>
> The following approaches have been used already:
>
> - standard interrupts property (3-cell): was rejected because the chip doesn't
>   actually generate the interrupts but just provides a programmable IRQ routing

So what? That is describing any chained interrupt controller. The
interrupts binding describes interrupt connections, not just interrupt
source endpoints.

> - property "parent-interrupts" (1-cell): Rob suggested to use "interrupts" instead
>
> I'd appreciate if you could come to an agreement with Rob, whatever the outcome
> is is fine with me.

If Marc said not to use standard interrupt binding I can't find it.

Rob
