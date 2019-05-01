From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: doc: Reflect new NVMEM
 of_get_mac_address behaviour
Date: Wed, 1 May 2019 15:22:00 -0500
Message-ID: <20190501202200.GB15495@bogus>
References: <1556456002-13430-1-git-send-email-ynezz@true.cz>
 <1556456002-13430-3-git-send-email-ynezz@true.cz>
 <20190428165326.GI23059@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190428165326.GI23059@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Kalle Valo <kvalo@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@g>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 28, 2019 at 06:53:26PM +0200, Andrew Lunn wrote:
> On Sun, Apr 28, 2019 at 02:53:20PM +0200, Petr Štetiar wrote:
> > As of_get_mac_address now supports NVMEM under the hood, we need to update
> > the bindings documentation with the new nvmem-cell* properties, which would
> > mean copy&pasting a lot of redundant information to every binding
> > documentation currently referencing some of the MAC address properties.
> > 
> > So I've just removed all the references to the optional MAC address
> > properties and replaced them with the reference to the net/ethernet.txt
> > file.  While at it, I've also removed other optional Ethernet properties.
> 
> Hi Petr
> 
> I think each individual binding needs to give a hint if
> of_get_mac_address() is used, and hence if these optional properties
> are respected. The same is true for other optional properties. I don't
> want to have to look at the driver to know which optional properties
> are implemented, the binding should tell me. What the optional
> properties mean, and which order they are used in can then be defined
> in ethernet.txt.
> 
> So i would suggests something like:
> 
> The MAC address will be determined using the optional properties
> defined in ethernet.txt.
> 
> And leave all the other optional parameters in the bindings.

Yes. Generally we need to know which properties from a common pool of 
properties apply to a specific binding. Also there are typically 
additional constraints for a specific binding.

Rob
