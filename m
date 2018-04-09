From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: add clock and resets
Date: Mon, 9 Apr 2018 08:32:11 -0500
Message-ID: <CAL_JsqJkcNZf1gLXVu11u4S4hiCxPcs7p_eS=ArxFG3AeQ21+Q@mail.gmail.com>
References: <1521113998-25052-1-git-send-email-yamada.masahiro@socionext.com>
 <1521113998-25052-2-git-send-email-yamada.masahiro@socionext.com>
 <20180318125209.juoa3gkgdv2djciw@rob-hp-laptop> <CAK7LNAQT8wfAk55c40zrZ15wPh3fnsh=B1ciNfVx4uA-oGi34g@mail.gmail.com>
 <CAK7LNAQixwNS1djgn3SUp=GUsZ58c+5z-B6ou-4NQykrO6AxMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQixwNS1djgn3SUp=GUsZ58c+5z-B6ou-4NQykrO6AxMw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Linux USB List <linux-usb@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 28, 2018 at 11:32 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-03-19 7:37 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>> Hi Rob,
>>
>> 2018-03-18 21:52 GMT+09:00 Rob Herring <robh@kernel.org>:
>>> On Thu, Mar 15, 2018 at 08:39:58PM +0900, Masahiro Yamada wrote:
>>>> dwc3-of-simple.c only handles arbitrary number of clocks and resets.
>>>> They are both generic enough to be put into the dwc3 core.  For simple
>>>> cases, a nested node structure like follows:
>>>>
>>>>   dwc3-glue {
>>>>           compatible = "foo,dwc3";
>>>>           clocks = ...;
>>>>           resets = ...;
>>>>           ...
>>>>
>>>>           dwc3 {
>>>>                   compatible = "snps,dwc3";
>>>>                   ...
>>>>           };
>>>
>>> I'm not a fan of how this was done.
>>>
>>>
>>>>   }
>>>>
>>>> would be turned into a single node:
>>>>
>>>>   dwc3 {
>>>>           compatible = "foo,dwc3", "snps,dwc3";
>>>>           clocks = ...;
>>>>           resets = ...;
>>>>           ...
>>>>   }
>>>
>>> And yes, this is what I'd prefer.
>>
>>
>>
>> Not only dwc3-of-simple.c, but all dwc3 nodes are
>> written like this.
>>
>>
>> omap_dwc3_1: omap_dwc3_1@48880000 {
>>         compatible = "ti,dwc3";
>>         reg = <0x48880000 0x10000>;
>>         #address-cells = <1>;
>>         #size-cells = <1>;
>>         ranges;
>>         ...
>>
>>         usb1: usb@48890000 {
>>                 compatible = "snps,dwc3";
>>                 reg = <0x48890000 0x17000>;
>>                 ...
>>         };
>> };
>>
>>
>> The glue layer initializes SoC-specific things,
>> then populates the child "snps,dwc3".
>>
>>
>> I think the following structure should work
>> by handling EPROBE_DEFER properly.
>>
>> omap_dwc3_1: omap_dwc3_1@48880000 {
>>         compatible = "ti,dwc3"; (should be "ti,dwc3-glue" or something)
>>         reg = <0x48880000 0x10000>;
>>         ...
>> };
>>
>> usb1: usb@48890000 {
>>         compatible = "snps,dwc3";
>>         reg = <0x48890000 0x17000>;
>>         ...
>> };
>>
>>
>>
>>>>
>>>> I inserted reset_control_deassert() and clk_enable() before the first
>>>> register access, i.e. dwc3_cache_hwparams().
>>>>
>>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>> ---
>>>>
>>>>  Documentation/devicetree/bindings/usb/dwc3.txt |   2 +
>>>>  drivers/usb/dwc3/core.c                        | 127 ++++++++++++++++++++++++-
>>>>  drivers/usb/dwc3/core.h                        |   5 +
>>>>  3 files changed, 132 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>> index 44e8bab..67e9cfb 100644
>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>> @@ -9,12 +9,14 @@ Required properties:
>>>>   - interrupts: Interrupts used by the dwc3 controller.
>>>>
>>>>  Optional properties:
>>>> + - clocks: list of phandle and clock specifier pairs
>>>
>>> However, this should be specific as to how many clocks and their
>>> function. This should be readily available to someone with access to
>>> Synopsys datasheet. The number of clocks should generally be the same
>>> across SoCs, it is just some SoCs either tie clocks together or don't
>>> provide s/w control of some of the clocks.
>>
>>
>> Make sense.
>> You also implies this property is mandatory.
>> The number of clocks should be available in the datasheet
>> and no hardware can work with zero clock.
>>
>> However, making it mandatory breaks the binding
>> since the existing DT files do not specify clocks at all
>> in the "snps,dwc3" node.

Because of this it has to be optional. We could list what compatibles
it is optional for and that it is mandatory for new users.

>>
>> Anyway, our current situation:
>>
>> - We have the dwc3-core under the glue layer node
>>   despite they are independent in the CPU address view
>> - We add all sorts of clocks and resets in the glue layer node,
>>   and nothing in the dwc3-core node.
>>
>> If these are design mistake, what should we do?
>>
>> Continue development based on it?
>> If we fix it, how to change the course?
>>
>
> Any insight about this?

We just need to reject new bindings that do things the old way. The
driver will have to support both cases for some time period.


> I think this is rather a general question.
>
> If somebody upstreams a driver without clocks,
> then later it turns out clocks are necessary,
> adding required clocks would break existing platforms
> since clk_get() fails.

We should try to prevent that, but of course that is not always
possible. Unless that platform is deemed unstable and we break
compatibility, we'd have to handle both cases in the driver.

Rob
