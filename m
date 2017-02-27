MIME-Version: 1.0
In-Reply-To: <CACRpkdZsFfnh8vA_-RQqXyrJOh-emZQytj2bxHXRDkTs9ga+eg@mail.gmail.com>
References: <20170211125220.10273-1-linus.walleij@linaro.org>
	<20170222002640.y2uhumje5csioure@rob-hp-laptop>
	<CACRpkdZsFfnh8vA_-RQqXyrJOh-emZQytj2bxHXRDkTs9ga+eg@mail.gmail.com>
Date: Mon, 27 Feb 2017 07:32:47 -0600
Message-ID: <CAL_JsqK=hEXhJvATtDwT88BmLsLDo7AB7hxWLaEyx5udnhySMQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] PCI: add DT bindings for Faraday Technology PCI Host Bridge
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Gavin Guo <gavinguo@andestech.com>, Macpaul Lin <macpaul@andestech.com>, Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org, linux-pci <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Feng-Hsin Chiang <john453@faraday-tech.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Feb 26, 2017 at 2:17 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Feb 22, 2017 at 1:26 AM, Rob Herring <robh@kernel.org> wrote:
>> On Sat, Feb 11, 2017 at 01:52:17PM +0100, Linus Walleij wrote:
>
>>> +- compatible: should be one of
>>> +  "faraday,pci"
>>> +  "faraday,dual-pci"
>>
>> Probably should still have a Cortina specific compatible.
>
> OK I rewrote it using the specific-to-generic compatible pattern.
>
>>> +pci@50000000 {
>>> +     compatible = "faraday,pci";
>>> +     reg = <0x50000000 0x100>;
>>> +     interrupts = <8 IRQ_TYPE_LEVEL_HIGH>, /* PCI A */
>>> +                     <26 IRQ_TYPE_LEVEL_HIGH>, /* PCI B */
>>> +                     <27 IRQ_TYPE_LEVEL_HIGH>, /* PCI C */
>>> +                     <28 IRQ_TYPE_LEVEL_HIGH>; /* PCI D */
>>> +     #address-cells = <3>;
>>> +     #size-cells = <2>;
>>> +     #interrupt-cells = <1>;
>>
>> This doesn't belong here (I think).
>
> This needs to be here because the interrupts for
> PCI are 1 cell. The PCI host acts as interrupt parent for all
> the cards you plug in, and they always have one cell, you
> can see this in the example for open-pic in Device Tree
> Specification release 0.1, page 19 for example.
>
> It gets a bit confusing maybe in cases like this (as with
> open-pic) where there is a cascades interrupt controller
> that in this case also has 1 cell of interrupt specifier.
>
> Or did you mean something else?
>
> Yours,
> Linus Walleij
