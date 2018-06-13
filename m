From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: document gpio-mt7621 bindings
Date: Wed, 13 Jun 2018 18:23:09 +0200
Message-ID: <CAMhs-H8GYut-7hopEb0Oe0DYz0sjSwcw_rQ4hzipu9LMz-zWFg@mail.gmail.com>
References: <1527924610-13135-1-git-send-email-sergio.paracuellos@gmail.com>
 <1527924610-13135-3-git-send-email-sergio.paracuellos@gmail.com>
 <20180612205638.GA2404@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180612205638.GA2404@rob-hp-laptop>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, driverdev-devel@linuxdriverproject.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for your time in reviewing this.

On Tue, Jun 12, 2018 at 10:56 PM, Rob Herring <robh@kernel.org> wrote:
> On Sat, Jun 02, 2018 at 09:30:10AM +0200, Sergio Paracuellos wrote:
>> Add a devicetree binding documentation for the mt7621 driver.
>
> Bindings are for h/w, not a driver.

You are totally right, my english is not my best as you can see :-).
I'll fix this
for v2.

>
>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>> Reviewed-by: NeilBrown <neil@brown.name>
>
> Space              ^
>

Actually, this is deliberate, so it will not change.

>> ---
>>  .../bindings/gpio/mediatek,mt7621-gpio.txt         | 68 ++++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
>> new file mode 100644
>> index 0000000..30d8a02
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
>> @@ -0,0 +1,68 @@
>> +Mediatek SoC GPIO controller bindings
>> +
>> +The IP core used inside these SoCs has 3 banks of 32 GPIOs each.
>> +The registers of all the banks are interwoven inside one single IO range.
>> +We load one GPIO controller instance per bank. To make this possible
>> +we support 2 types of nodes. The parent node defines the memory I/O range and
>> +has 3 children each describing a single bank. Also the GPIO controller can receive
>> +interrupts on any of the GPIOs, either edge or level. It then interrupts the CPU
>> +using GIC INT12.
>> +
>> +Required properties for the top level node:
>> +- compatible:
>> +  - "mediatek,mt7621-gpio" for Mediatek controllers
>> +- reg : Physical base address and length of the controller's registers
>> +- interrupt-parent : phandle of the parent interrupt controller.
>> +- interrupts : Interrupt specifier for the controllers interrupt.
>> +- interrupt-controller : Mark the device node as an interrupt controller.
>> +- #interrupt-cells : Should be 2. The first cell defines the interrupt number.
>> +   The second cell bits[3:0] is used to specify trigger type as follows:
>> +     - 1 = low-to-high edge triggered.
>> +     - 2 = high-to-low edge triggered.
>> +     - 4 = active high level-sensitive.
>> +     - 8 = active low level-sensitive.
>
> Just refer to the common definition.

ok, thanks. I will.

>
>> +
>> +
>> +Required properties for the GPIO bank node:
>> +- compatible:
>> +  - "mediatek,mt7621-gpio-bank" for Mediatek banks
>> +- #gpio-cells : Should be two. The first cell is the GPIO pin number and the
>
> So interrupt numbers and gpio numbers are different? 0-95 and 3x 0-31
>
> That doesn't seem ideal.

Yes, that's true. Actually this is one of the things that has been
changed for v2.

>
>> +   second cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>.
>> +   Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
>> +- gpio-controller : Marks the device node as a GPIO controller.
>> +- reg : The id of the bank that the node describes.
>
> I'd prefer to not have banks defined in DT. Do you have a variable
> number or resources that are per bank? If not, then you don't need them.

Mmmm, That's what I understood from documentation:

"Some system-on-chips (SoCs) use the concept of GPIO banks. ...
Usually each such bank is
exposed in the device tree as an individual gpio-controller node. ..."

If this is not a good approach, could you please me point me out to a
device tree example where
the correct approach is being used?

Thanks in advance.

Best regards,
    Sergio Paracuellos
>> +
>> +Example:
>> +     gpio@600 {
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +
>> +             compatible = "mediatek,mt7621-gpio";
>> +             reg = <0x600 0x100>;
>> +
>> +             interrupt-parent = <&gic>;
>> +             interrupts = <GIC_SHARED 12 IRQ_TYPE_LEVEL_HIGH>;
>> +             interrupt-controller;
>> +             #interrupt-cells = <2>;
>> +
>> +             gpio0: bank@0 {
>> +                     reg = <0>;
>> +                     compatible = "mediatek,mt7621-gpio-bank";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +             };
>> +
>> +             gpio1: bank@1 {
>> +                     reg = <1>;
>> +                     compatible = "mediatek,mt7621-gpio-bank";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +             };
>> +
>> +             gpio2: bank@2 {
>> +                     reg = <2>;
>> +                     compatible = "mediatek,mt7621-gpio-bank";
>> +                     gpio-controller;
>> +                     #gpio-cells = <2>;
>> +             };
>> +     };
>> --
>> 2.7.4
>>
