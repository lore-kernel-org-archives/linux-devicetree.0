From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/4] dt-bindings: doc: Reflect new NVMEM
 of_get_mac_address behaviour
Date: Sun, 28 Apr 2019 18:53:26 +0200
Message-ID: <20190428165326.GI23059@lunn.ch>
References: <1556456002-13430-1-git-send-email-ynezz@true.cz>
 <1556456002-13430-3-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556456002-13430-3-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Kalle Valo <kvalo@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 28, 2019 at 02:53:20PM +0200, Petr Štetiar wrote:
> As of_get_mac_address now supports NVMEM under the hood, we need to update
> the bindings documentation with the new nvmem-cell* properties, which would
> mean copy&pasting a lot of redundant information to every binding
> documentation currently referencing some of the MAC address properties.
> 
> So I've just removed all the references to the optional MAC address
> properties and replaced them with the reference to the net/ethernet.txt
> file.  While at it, I've also removed other optional Ethernet properties.

Hi Petr

I think each individual binding needs to give a hint if
of_get_mac_address() is used, and hence if these optional properties
are respected. The same is true for other optional properties. I don't
want to have to look at the driver to know which optional properties
are implemented, the binding should tell me. What the optional
properties mean, and which order they are used in can then be defined
in ethernet.txt.

So i would suggests something like:

The MAC address will be determined using the optional properties
defined in ethernet.txt.

And leave all the other optional parameters in the bindings.

	Andrew
