MIME-Version: 1.0
In-Reply-To: <AM5PR0701MB2657E31C99D3AAA873F12B1DE44F0@AM5PR0701MB2657.eurprd07.prod.outlook.com>
References: <AM5PR0701MB2657FDDE2E0CE80D0EECB4B3E4770@AM5PR0701MB2657.eurprd07.prod.outlook.com>
	<20171013200609.x6cjol7a57eypohl@rob-hp-laptop>
	<AM5PR0701MB2657E31C99D3AAA873F12B1DE44F0@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Date: Mon, 16 Oct 2017 16:21:29 -0500
Message-ID: <CAL_Jsq+JZHZDo4kZE3oEhKvb37_U_fpsPs6WYzuWRveVgr97DA@mail.gmail.com>
Subject: Re: [PATCHv3 1/2] Add device tree bindings for Altera FPGA Manager GPIO
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 16, 2017 at 12:04 PM, Bernd Edlinger <bernd.edlinger@hotmail.de> wrote:
> On 10/13/17 22:06, Rob Herring wrote:
>> On Sun, Oct 08, 2017 at 11:30:27AM +0000, Bernd Edlinger wrote:
>>> These are the bindings for the gpio-altera-fpgamgr driver.
>>
>> Bindings are for h/w devices, not drivers.
>>
>
> I should drop that sentence then?

Yes, but you need some commit msg besides just the subject.

> The first line is already:
> "Add device tree bindings for Altera FPGA Manager GPIO"
>
>>>
>>> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
>>> ---
>>>   .../bindings/gpio/gpio-altera-fpgamgr.txt          | 45 ++++++++++++++++++++++
>>>   1 file changed, 45 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt b/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
>>> new file mode 100644
>>> index 0000000..7e9434f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
>>> @@ -0,0 +1,45 @@
>>> +Altera FPGA Manager GPIO controller bindings
>>> +
>>> +Required controller properties:
>>> +- #address-cells : Should be 1
>>> +- #size-cells : Should be 0
>>> +- compatible:
>>> +  - "altr,fpgamgr-gpio"
>>
>> Seems kind of generic. Only 1 implementation of h/w?
>
> I guess, there are lots of Altera devices with similar peripherals.
>
>>
>>> +- reg: Physical base address and length of the controller's registers.
>>> +- status : "okay" or "disabled".
>>
>> No need to document status.
>>
>
> Ok, will remove here and in the Example.
>
>>> +
>>> +The FPGA Manager has two 32-bit ports, one for input and one for output.
>>
>> This sounds more like a system control/status register to tie off all
>> the leftover signals than a GPIO block. Linus likely has some opinions
>> on that.
>>
>
> I don't think so, the only difference is that the signals are not at the
> external boundary, instead they connect internally the FPGA logic.
> What these signals control depends entirely on the user's logic design.


>>> +
>>> +Port properties:
>>> +- compatible:
>>> +  - "altr,fpgamgr-gpio-output"
>>> +  - "altr,fpgamgr-gpio-input"
>>> +- #gpio-cells : Should be 2
>>> +  - The first cell is the gpio offset number.
>>> +  - The second cell is reserved and is currently unused.
>>> +- gpio-controller : Marks the device node as a GPIO controller.
>>> +- reg : Port number, 0 for output, 1 for input.
>>> +
>>> +Example:
>>> +
>>> +gpio3: gpio@ff706010 {
>>> +  #address-cells = <1>;
>>> +  #size-cells = <0>;
>>> +  compatible = "altr,fpgamgr-gpio";
>>> +  reg = <0xff706010 0x8>;
>>> +  status = "okay";
>>> +
>>> +  portd: gpio-controller@0 {
>>> +    compatible = "altr,fpgamgr-gpio-output";
>>> +    gpio-controller;
>>> +    #gpio-cells = <2>;
>>> +    reg = <0>;
>>> +  };
>>> +
>>> +  porte: gpio-controller@1 {
>>> +    compatible = "altr,fpgamgr-gpio-input";
>>> +    gpio-controller;
>>> +    #gpio-cells = <2>;
>>> +    reg = <1>;
>>> +  };
>>
>> These child nodes don't really add anything. Can't you just define the
>> controller has 64 lines with the 1st 32 being outputs.
>>
>
> Other device bindings can refer to the single bits in each port
> as "<&portd 1 0>" or "<&porte 2 0>" which is more mnemonic,
> but it is possible that this makes no difference to the user mode.
>
> The bindings are structured similar to what's in
> Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> where the bindings are structured in the same way.

The DW GPIO was a bit of an oddball IIRC, so I don't think I'd copy

>
>
> Bernd.
