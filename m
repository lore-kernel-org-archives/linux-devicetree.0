From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: Multiple generic PHY instances for DWC3 USB IP
Date: Wed, 04 Apr 2018 11:00:54 +0300
Message-ID: <87woxns8nd.fsf@linux.intel.com>
References: <CAK7LNATkS6pFQ9Gexm1uiG8e-3x6QXh-GYs3ABVEQzBnFK5gqw@mail.gmail.com> <87vad7cz2i.fsf@linux.intel.com> <CAK7LNARBVG54o+fozHk8efXUNk8GSkRcRcdDNrtUhDs5kOA7=Q@mail.gmail.com> <87po3fcxs4.fsf@linux.intel.com> <CAK7LNATpFZYK-f4j7sJpur-u43bK1gsz_eS1wurTq7C+n6pHAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATpFZYK-f4j7sJpur-u43bK1gsz_eS1wurTq7C+n6pHAw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>
List-Id: devicetree@vger.kernel.org


Hi,

Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>>> Each DWC3 instance is connected with
>>> multiple HS PHYs and multiple SS PHYs,
>>> depending on the number of ports.
>>
>> in that case, you shouldn't need dwc3 at all. A Host-only dwc3 is xHCI
>> compliant. If you really don't have the gadget block, there's no need
>> for you to use dwc3. Just use xhci-plat directly.
>
> Sorry, I was misunderstanding.
>
> Some of our SoCs support gadget,
> so we need to use the dwc3 driver.

fair enough. Now we need to figure out how to pass multiply PHYs to a
multi-port dwc3 instance.

Kishon, any ideas? How do you think DT should look like?

-- 
balbi
