From: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding documentation
Date: Sun, 18 Aug 2019 15:19:08 +0800
Message-ID: <CAJsYDVK9Yj02WxNFo7iEP3aJn+j5MqzCtLrmgsz=4zWnfQ4VOw@mail.gmail.com>
References: <20190724022310.28010-1-gch981213@gmail.com> <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus> <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net> <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de> <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
 <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fb39803d-d303-f259-d78d-9f8b1fc7dde3@rempel-privat.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: Rob Herring <robh@kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>, Paul Fertser <fercerpav@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi!

On Sun, Aug 18, 2019 at 2:10 PM Oleksij Rempel <linux@rempel-privat.de> wrote:
>
> >> We have at least 2 know registers:
> >> SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostrapped
> >> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
> >> SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
> >> all or some ip cores.
> >> What is probably missing is a set of dividers for
> >> each ip core. From your words it is not document.
> >
> > The specific missing part I was referring to, is parent clocks for
> > every gates. I'm not going to assume this with current openwrt device
> > tree because some peripherals doesn't have a clock binding at all or
> > have a dummy one there.
>
> Ok, then I do not understand what is the motivation to upstream
> something what is not nearly ready for use.

Why isn't it "ready for use" then?
A complete mt7621-pll driver will contain two parts:
1. A clock provider which outputs several clocks
2. A clock gate with parent clocks properly configured

Two clocks provided here are just two clocks that can't be controlled
in kernel no matter where it goes (arch/mips/ralink or drivers/clk).
Having a working CPU clock provider is better than defining a fixed
clock in dts because CPU clock can be controlled by bootloader.
(BTW description for CPU PLL register is also missing in datasheet.)
Clock gate is an unrelated part and there is no information to
properly implement it unless MTK decided to release a clock plan
somehow.

> This code is currently on prototyping phase

Code for clock calculation is done, not "prototyping".

> It means, we cannot expect that this driver will be fixed any time soon.

I think clock gating is a separated feature instead of a broken part
that has to be fixed.

Regards,
Chuanhong Guo
