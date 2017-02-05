From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] PCI: add DT bindings for Cortina Gemini PCI Host Bridge
Date: Sun, 5 Feb 2017 15:44:42 +0100
Message-ID: <CACRpkdZtuqF-ekNzVTNY4BBCt2bG6NcTAFs-ARYGw7q5E=jBTw@mail.gmail.com>
References: <20170128204839.18330-1-linus.walleij@linaro.org> <7079928.XO1j93ERJc@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <7079928.XO1j93ERJc@wuerfel>
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-pci <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 1, 2017 at 12:09 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Saturday, January 28, 2017 9:48:36 PM CET Linus Walleij wrote:
>> +       pci_intc: interrupt-controller {
>> +               interrupt-controller;
>> +               #address-cells = <0>;
>> +               #interrupt-cells = <1>;
>> +       };
>
> I think this one needs at least an interrupt-parent property, otherwise
> you would recursively translate the numbers back through the interrupt-map
> property of its parent.

OK I added this, I think it was the cause of the error Hand Uli Kroll
was seeing. I guess I didn't run into it because I was only testing the
device in slot 9 so everything was defaulting to zero.

Yours,
Linus Walleij
