From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH 02/13] Documentation: add BCM6328 pincontroller binding documentation
Date: Fri, 19 Aug 2016 16:30:49 +0200
Message-ID: <CAOiHx=mLgZ6Q3tBY3zYkCpMX09Kv54OQQoAXAdP16D_xoXO3mg@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
 <1471604025-21575-3-git-send-email-jonas.gorski@gmail.com> <20160819141436.GA6970@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160819141436.GA6970@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi

On 19 August 2016 at 16:14, Rob Herring <robh@kernel.org> wrote:
> On Fri, Aug 19, 2016 at 12:53:34PM +0200, Jonas Gorski wrote:
>> Add binding documentation for the pincontrol core found in BCM6328 SoCs.
>>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>> ---
>>  .../bindings/pinctrl/brcm,bcm6328-pinctrl.txt      | 61 ++++++++++++++++++++++
>>  1 file changed, 61 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.txt
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.txt
>> new file mode 100644
>> index 0000000..401224e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.txt
>> @@ -0,0 +1,61 @@
>> +* Broadcom BCM6328 pin controller
>> +
>> +Required properties:
>> +- compatible: Must be "brcm,bcm6328-pinctrl".
>> +- reg: Register specifies of dirout, dat, mode, mux registers.
>> +- reg-names: Must be "dirout", "dat", "mode", "mux".
>> +- gpio-controller: Identifies this node as a GPIO controller.
>> +- #gpio-cells: Must be <2>.
>> +
>> +Example:
>> +
>> +pinctrl: pin-controller@10000080 {
>> +     compatible = "brcm,bcm6328-pinctrl";
>> +     reg = <0x10000080 0x8>,
>> +           <0x10000088 0x8>,
>> +           <0x10000098 0x4>,
>> +           <0x1000009c 0xc>;
>> +     reg-names = "dirout", "dat", "mode", "mux";
>
> What's in the holes? Just do one range or perhaps this should be part of
> some larger block.

For this particular SoC it's SPI Slave Config; Registers found in the
holes on other SoCs:

* TestControl
* OscControl (just the name, no other documentation what it does)
* Switch LED control (for integrated switches)
* Legacy LED controller
* Reset Controller for the VDSL PHY

And there are also usually quite a few other registers on this block.
This seems to have been treated as a "GPIO and everything else that
isn't large enough for its own block" by Broadcom - with BCM6328/6362
they even introduced a "MISC" block then.


Jonas
