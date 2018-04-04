From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Multiple generic PHY instances for DWC3 USB IP
Date: Wed, 4 Apr 2018 10:43:27 +0200
Message-ID: <CAK8P3a0t4ooQNJrak_r_Qc2T4UeQB9k3SgStuaBptV2DcA8SBA@mail.gmail.com>
References: <CAK7LNATkS6pFQ9Gexm1uiG8e-3x6QXh-GYs3ABVEQzBnFK5gqw@mail.gmail.com>
 <87vad7cz2i.fsf@linux.intel.com> <CAK7LNARBVG54o+fozHk8efXUNk8GSkRcRcdDNrtUhDs5kOA7=Q@mail.gmail.com>
 <87po3fcxs4.fsf@linux.intel.com> <CAK7LNATpFZYK-f4j7sJpur-u43bK1gsz_eS1wurTq7C+n6pHAw@mail.gmail.com>
 <87woxns8nd.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87woxns8nd.fsf@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 4, 2018 at 10:00 AM, Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
>
> Hi,
>
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>>>> Each DWC3 instance is connected with
>>>> multiple HS PHYs and multiple SS PHYs,
>>>> depending on the number of ports.
>>>
>>> in that case, you shouldn't need dwc3 at all. A Host-only dwc3 is xHCI
>>> compliant. If you really don't have the gadget block, there's no need
>>> for you to use dwc3. Just use xhci-plat directly.
>>
>> Sorry, I was misunderstanding.
>>
>> Some of our SoCs support gadget,
>> so we need to use the dwc3 driver.
>
> fair enough. Now we need to figure out how to pass multiply PHYs to a
> multi-port dwc3 instance.
>
> Kishon, any ideas? How do you think DT should look like?

See this series from Martin Blumenstingl:

https://www.spinics.net/lists/linux-usb/msg166281.html

      Arnd
