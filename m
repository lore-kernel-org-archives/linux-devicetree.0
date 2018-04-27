From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: dwc3: support clocks and resets for DWC3 core
Date: Fri, 27 Apr 2018 13:40:01 -0500
Message-ID: <CAL_JsqJ6pp+Rybb35B6RBMBvvRiFWL=S3QLDoKYnRtpUcCCYfg@mail.gmail.com>
References: <1524135818-14825-1-git-send-email-yamada.masahiro@socionext.com>
 <1524135818-14825-3-git-send-email-yamada.masahiro@socionext.com>
 <20180425152114.pzklc5uqva3nil5v@rob-hp-laptop> <CAK7LNATtOxUjfoqmgAu-X_OYihKkMMRVLaYimEY0bRogOoHRZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATtOxUjfoqmgAu-X_OYihKkMMRVLaYimEY0bRogOoHRZQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux USB List <linux-usb@vger.kernel.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Roger Quadros <rogerq@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, DTML <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 27, 2018 at 11:20 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Rob,
>
>
> 2018-04-26 0:21 GMT+09:00 Rob Herring <robh@kernel.org>:
>
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> index 0dbd308..feb1cc33 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> @@ -7,6 +7,27 @@ Required properties:
>>>   - compatible: must be "snps,dwc3"
>>>   - reg : Address and length of the register set for the device
>>>   - interrupts: Interrupts used by the dwc3 controller.
>>> + - clock-names: should contain "ref", "bus_early", "suspend"
>>> + - clocks: list of phandle and clock specifier pairs corresponding to
>>> +           entries in the clock-names property.
>>> + - resets: a single pair of phandle and reset specifier
>>
>> This should be optional as some SoCs don't have separate, s/w controlled
>> resets of modules.
>
> OK.  I will move resets to optional property.
>
>
> Please let ask a question.
>
>
> The number of clocks should be the same across SoCs.
> (Even if there is no s/w control for clocks,
> we should input something such as clk-fixed-rate.)

I guess if there's really not s/w control, then the number may vary,
but let's worry about that when someone has that problem.

> On the other hand, the number of resets can be different
> across SoCs.  If there is no s/w control for resets,
> we can make it optional.   (optional = 1 or 0 reset)
>
> Is this what you mean?

Yes. I think it's just more common to not have a reset than not have clocks.

> If we had something like reset-nop (or reset-dummy)
> in case no s/w control, we would be able to input something.
> I am not sure if this is the right thing, though.

I don't think we should require things if they are not needed.

Rob
