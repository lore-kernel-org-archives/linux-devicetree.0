From: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 0/7] Timer & SPI support for Allwinner suniv F1C100s
Date: Mon, 18 Mar 2019 15:18:56 +0800
Message-ID: <8e1cf9c7111a423ce7cc32a6759d16e4197b87d9.camel@aosc.xyz>
References: <cover.1549875778.git.mesihkilinc@gmail.com>
         <2485e6c52810df376a0df6eb7f749f35b7b19044.camel@aosc.xyz>
         <177e2598-3491-03af-8638-c60e77cc4a34@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <177e2598-3491-03af-8638-c60e77cc4a34@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Mesih Kilinc <mesihkilinc@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

在 2019-03-17日的 21:52 +0100，Daniel Lezcano写道：
> On 17/03/2019 18:39, Icenowy Zheng wrote:
> > 在 2019-02-11一的 12:21 +0300，Mesih Kilinc写道：
> > > This is followup series for F1C100s initial support patchset. 
> > > All patches merged except patch 1 ~ 2 which is related to timer.
> > > I am resending those since they are already have Acked tags.
> > 
> > Ping.
> > 
> > Could you please merge these timer-related patches?
> 
> Hi,
> 
> I acked the timer-related patches. If you resend the patches with my
> acked-by I will consider them to go through the allwinner tree.
> 
> Do you want me to take 1 and 2 through my tree?

Please. They also have the ACK from Allwinner/sunXi maintainer.

> 
> 
> 
> > > Our dt-bindings for F1C100s are merged, we can now use them at
> > > our 
> > > device tree source - patch 3.
> > > 
> > > Also this series add spi support and enables spi flash at Lichee-
> > > pi
> > > Nano
> > > in patch 4 ~ 7. This patches are based on Icenowy's work.
> > > 
> > > Thanks!
> > > 
> > > Mesih Kilinc (7):
> > >   dt-bindings: timer: Add Allwinner suniv timer
> > >   clocksource: sun4i: add a compatible for suniv
> > >   ARM: dts: suniv: Add dt-binding headers for F1C100s
> > >   dt-bindings: spi: Add Support for Allwinner F1C100s
> > >   ARM: dts: suniv: Add SPI device-tree nodes
> > >   ARM: dts: suniv: Add pinmux for SPI0 and SPI1 of F1C100s
> > >   ARM: dts: f1c100s: Activate SPI flash on Lichee Pi Nano
> > > 
> > >  .../devicetree/bindings/spi/spi-sun6i.txt          |  5 +-
> > >  .../bindings/timer/allwinner,sun4i-timer.txt       |  4 +-
> > >  arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts  | 13 ++++++
> > >  arch/arm/boot/dts/suniv-f1c100s.dtsi               | 53
> > > +++++++++++++++++++---
> > >  drivers/clocksource/timer-sun4i.c                  |  5 +-
> > >  5 files changed, 70 insertions(+), 10 deletions(-)
> > > 
> 
> 
