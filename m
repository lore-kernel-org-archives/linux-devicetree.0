From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/4] mfd: Add ROHM BD9571MWV-M PMIC DT bindings
Date: Thu, 20 Apr 2017 18:59:48 +0200
Message-ID: <aad8abab-c59d-aa29-1cb4-3a05743c95ff@gmail.com>
References: <20170416180801.17828-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUUkZ_si8DAmvY_KvNF8tO=q2wHzjqRCjxXJD3-XxxJFw@mail.gmail.com>
 <dbfbadbd-9850-4a8e-581f-abd5ae39e841@gmail.com>
 <20170420140929.peraem4uv57d7i25@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170420140929.peraem4uv57d7i25@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On 04/20/2017 04:09 PM, Rob Herring wrote:
> On Thu, Apr 20, 2017 at 02:51:40PM +0200, Marek Vasut wrote:
>> On 04/20/2017 02:35 PM, Geert Uytterhoeven wrote:
>>> Hi Marek,
>>
>> Hi!
>>
>>> On Sun, Apr 16, 2017 at 8:07 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> Add DT bindings for the ROHM BD9571MWV-M PMIC. This PMIC has
>>>> the following features:
>>>> - multiple voltage monitors for 1V8, 2V5, 3V3 voltage rail
>>>> - one voltage regulator for DVFS
>>>> - two GPIOs
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>>  .../devicetree/bindings/mfd/bd9571mwv.txt          | 49 ++++++++++++++++++++++
>>>>  1 file changed, 49 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/bd9571mwv.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/bd9571mwv.txt b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
>>>> new file mode 100644
>>>> index 000000000000..0952ee3bc30b
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mfd/bd9571mwv.txt
>>>> @@ -0,0 +1,49 @@
>>>> +* ROHM BD9571MWV Power Management Integrated Circuit (PMIC) bindings
>>>> +
>>>> +Required properties:
>>>> + - compatible          : Should be "rohm,bd9571mwv".
>>>> + - reg                 : I2C slave address.
>>>> + - interrupt-parent    : Phandle to the parent interrupt controller.
>>>> + - interrupts          : The interrupt line the device is connected to.
>>>> + - interrupt-controller        : Marks the device node as an interrupt controller.
>>>> + - #interrupt-cells    : The number of cells to describe an IRQ, should be 2.
>>>> +                           The first cell is the IRQ number.
>>>> +                           The second cell is the flags, encoded as trigger
>>>> +                           masks from ../interrupt-controller/interrupts.txt.
>>>> + - gpio-controller      : Marks the device node as a GPIO Controller.
>>>> + - #gpio-cells          : Should be two.  The first cell is the pin number and
>>>> +                            the second cell is used to specify flags.
>>>> +                            See ../gpio/gpio.txt for more information.
>>>> + - regulators:          : List of child nodes that specify the regulator
>>>> +                            initialization data. Child nodes must be named
>>>> +                            after their hardware counterparts:
>>>> +                            - vd18
>>>> +                            - vd25
>>>> +                            - vd33
>>>> +                            - dvfs
>>>
>>> Missing vd09, which is used for VDD0.8 on Salvator-X.
>>
>> This is not supported by the driver, I don't think we should prematurely
>> add it into the bindings. We can add it later though.
> 
> If it is trivial to add, then do so now. Bindings should be complete, 
> not what a driver supports.

OK, will be in V2 . I actually figured out how that regulator works and
I can even set voltage.

-- 
Best regards,
Marek Vasut
