From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 2/2] usb: dwc3: support clocks and resets for DWC3 core
Date: Sat, 28 Apr 2018 01:20:12 +0900
Message-ID: <CAK7LNATtOxUjfoqmgAu-X_OYihKkMMRVLaYimEY0bRogOoHRZQ@mail.gmail.com>
References: <1524135818-14825-1-git-send-email-yamada.masahiro@socionext.com>
 <1524135818-14825-3-git-send-email-yamada.masahiro@socionext.com> <20180425152114.pzklc5uqva3nil5v@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180425152114.pzklc5uqva3nil5v@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, Roger Quadros <rogerq@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, DTML <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,


2018-04-26 0:21 GMT+09:00 Rob Herring <robh@kernel.org>:

>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 0dbd308..feb1cc33 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -7,6 +7,27 @@ Required properties:
>>   - compatible: must be "snps,dwc3"
>>   - reg : Address and length of the register set for the device
>>   - interrupts: Interrupts used by the dwc3 controller.
>> + - clock-names: should contain "ref", "bus_early", "suspend"
>> + - clocks: list of phandle and clock specifier pairs corresponding to
>> +           entries in the clock-names property.
>> + - resets: a single pair of phandle and reset specifier
>
> This should be optional as some SoCs don't have separate, s/w controlled
> resets of modules.

OK.  I will move resets to optional property.


Please let ask a question.


The number of clocks should be the same across SoCs.
(Even if there is no s/w control for clocks,
we should input something such as clk-fixed-rate.)

On the other hand, the number of resets can be different
across SoCs.  If there is no s/w control for resets,
we can make it optional.   (optional = 1 or 0 reset)

Is this what you mean?

If we had something like reset-nop (or reset-dummy)
in case no s/w control, we would be able to input something.
I am not sure if this is the right thing, though.




> Otherise, for the DT binding:
>
> Reviewed-by: Rob Herring <robh@kernel.org>
>


-- 
Best Regards
Masahiro Yamada
