From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: Multiple generic PHY instances for DWC3 USB IP
Date: Wed, 4 Apr 2018 16:31:21 +0900
Message-ID: <CAK7LNATpFZYK-f4j7sJpur-u43bK1gsz_eS1wurTq7C+n6pHAw@mail.gmail.com>
References: <CAK7LNATkS6pFQ9Gexm1uiG8e-3x6QXh-GYs3ABVEQzBnFK5gqw@mail.gmail.com>
 <87vad7cz2i.fsf@linux.intel.com> <CAK7LNARBVG54o+fozHk8efXUNk8GSkRcRcdDNrtUhDs5kOA7=Q@mail.gmail.com>
 <87po3fcxs4.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87po3fcxs4.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>
List-Id: devicetree@vger.kernel.org

2018-04-04 15:04 GMT+09:00 Felipe Balbi <felipe.balbi@linux.intel.com>:
>
> Hi,
>
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>> 2018-04-04 14:36 GMT+09:00 Felipe Balbi <felipe.balbi@linux.intel.com>:
>>>
>>> Hi,
>>>
>>> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>>>> Currently, DWC3 core IP (drivers/usb/dwc3/core.c)
>>>> can take only one PHY phandle for each of SS, HS.
>>>> (phy-names DT property is "usb2-phy" and "usb3-phy" for each)
>>>
>>> We never had any other requirements :-)
>>>
>>>> The DWC3 core IP is provided by Synopsys,
>>>> but some SoC-dependent parts (a.k.a glue-layer)
>>>> are implemented by SoC venders.
>>>>
>>>> The number of connected PHY instances are SoC-dependent.
>>>>
>>>> If you look at generic drivers such as
>>>>   drivers/usb/host/ehci-platform.c
>>>> the driver can handle arbitrary number of PHY instances.
>>>>
>>>> However, as mentioned above, DWC3 core allows only one PHY phandle
>>>> for each SS/HS.
>>>> This can result in a strange DT structure.
>>>>
>>>> For example, Socionext PXs3 SoC is integrated with 2 instances of DWC3.
>>>>
>>>> The instance 0 of DWC3 is connected with 2 super-speed PHYs.
>>>
>>> why 2 super-speed phys? Is this a two-port host-only implementation?
>>
>>
>> Socionext SoCs only support the host-mode.
>>
>>
>> The instance 0 has 2 ports.
>> In our integration, 1 SS PHY is needed for each port.
>> That's why it needs 2 SS PHYs.
>>
>> Each DWC3 instance is connected with
>> multiple HS PHYs and multiple SS PHYs,
>> depending on the number of ports.
>
> in that case, you shouldn't need dwc3 at all. A Host-only dwc3 is xHCI
> compliant. If you really don't have the gadget block, there's no need
> for you to use dwc3. Just use xhci-plat directly.

Sorry, I was misunderstanding.

Some of our SoCs support gadget,
so we need to use the dwc3 driver.


>>>> Is this OK?
>>>
>>> I don't know, I need a bit more details about your integration :-)
>>
>>
>> I can send a patch.
>>
>> My concern is the following commit.
>> I do not know which parts are using this lookups.
>
> Samsung SoCs, probably ;-)
>
> Anyway, if your IP really is host-only, then you don't need dwc3 for
> anything. Just go for xHCI directly. If xHCI needs to be extended when
> it comes to PHY, then you can discuss with Mathias Nyman :-)
>
> --
> balbi



-- 
Best Regards
Masahiro Yamada
