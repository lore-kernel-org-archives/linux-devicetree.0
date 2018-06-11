From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 1/2] gpio: mediatek: add driver for MT7621
Date: Mon, 11 Jun 2018 11:29:29 +0800
Message-ID: <1528687769.21593.19.camel@mtkswgap22>
References: <1527924610-13135-1-git-send-email-sergio.paracuellos@gmail.com>
 <1527924610-13135-2-git-send-email-sergio.paracuellos@gmail.com>
 <CACRpkdaw9O6TbZie5AOTmQJ9-3=yHETFFX7YVkPBEL72EZzZ=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CACRpkdaw9O6TbZie5AOTmQJ9-3=yHETFFX7YVkPBEL72EZzZ=g@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, 2018-06-08 at 13:59 +0200, Linus Walleij wrote:
> Hi Sergio!
> 
> Thanks for your patch!
> 
> Given that we have combined pin control and GPIO drivers for
> almost all Mediatek chips in drivers/pinctrl/mediatek/*
> I would ideally like to have some input from the Mediatek
> maintainers (especially Sean Wang) on this, especially:
> 
> - Is MT7621 a non-pincontrol GPIO controller, or can it
>   eventually use pin control as a back-end? Will a separate
>   pin control driver appear later for this SoC?
> 

MT7621 also have the circuit for pad setup tweaking Tx driving and mux
setup switching to either gpio mode or specific hardware mode, but the
circuit for all of them is being accessed in a different register range
from gpio controller being implemented here.

the part of pad or mux control for MT7621 I thought that is really
simple, so it seems worth joining pinmux and pinconf together into a
single driver to become a full function about pin setup. 

> - Would it make sense to have a combined driver just like
>   for the other Mediatek SoCs in drivers/pinctrl/mediatek?
>   If this GPIO controller does not do pin control I understand
>   why it is submitted as a GPIO driver only.
> 
> drivers/pinctrl/mediatek/pinctrl-mt7622.c is suspiciously
> similarly named. Is this a relative or just as different as
> night and day?
> 

The MT7621 is just as completely different as night and day from MT7622.

MT7622 pinctrl originate from MediaTek IPs but MT7621 pinctrl originate
from Ralink IPs and even MT7621 should be the last one machine using the
Ralink pinctrl IPs. And for these machine MT762x appearing later MT7622,
they all will be developed based on pinctrl-mt7622 architecture .

> Also you can see that this driver has a built-in GPIO driver,
> using an external interrupt.
> 
> On Sat, Jun 2, 2018 at 9:30 AM, Sergio Paracuellos

[ ... ]

> I guess you want to use
> builtin_platform_driver()?
> 
> Yours,
> Linus Walleij
