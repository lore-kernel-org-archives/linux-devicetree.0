From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 3/9] dt-bindings: add Amlogic Meson GPIO
 interrupt-controller DT binding documentation
Date: Fri, 9 Jun 2017 15:58:20 -0500
Message-ID: <CAL_JsqLnBqVDPq6DGaFvxv1emXBZy4o+hWH0+8146EoeJ2BRKA@mail.gmail.com>
References: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
 <c190f764-b3af-8982-00e3-87e28eabecca@gmail.com> <20170607211312.av5osk5xxa5k5pr2@rob-hp-laptop>
 <5bfb15b0-8625-85cc-53d6-90171c9e098d@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5bfb15b0-8625-85cc-53d6-90171c9e098d@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-amlogic@lists.infradead.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 9, 2017 at 2:50 AM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> On 06/07/2017 11:13 PM, Rob Herring wrote:
>> On Tue, May 30, 2017 at 10:26:33PM +0200, Heiner Kallweit wrote:
>>> Add dt binding documentation for Amlogic meson GPIO interrupt controller.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>> v5:
>>> - added Reviewed-by
>>> ---
>>>  .../amlogic,meson-gpio-intc.txt                    | 26 ++++++++++++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>>> new file mode 100644
>>> index 00000000..2f20d212
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
>>> +- parent-interrupts : list of GIC interrupts which can be used with the
>>> +                  GPIO IRQ multiplexer
>>
>> Just use "interrupts" here.
>
> Hi Rob,
>
> If the "interrupts" property is used here like this, it breaks the interrupts binding !

Really!? Looking closer at the series, in fact the dts files are
already correct:

+       gpio_intc: interrupt-controller@9880 {
+               compatible = "amlogic,meson-gpio-intc";
+               reg = <0x9880 0x10>;
+               interrupt-controller;
+               #interrupt-cells = <2>;
+               interrupts = <64 65 66 67 68 79 70 71>;
+       };
+

Rob
