From: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding documentation
Date: Sun, 18 Aug 2019 00:22:49 +0800
Message-ID: <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
References: <20190724022310.28010-1-gch981213@gmail.com> <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus> <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <fishor@gmx.net>
Cc: Rob Herring <robh@kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

Hi!

On Sat, Aug 17, 2019 at 11:40 PM Oleksij Rempel <fishor@gmx.net> wrote:

> In provided link [0] the  ralink_clk_init function is reading SYSC_REG_CPLL_CLKCFG0 R/W register.
> This register is used to determine clock source,  clock freq and CPU or bus clocks.

This register should only be changed by bootloader, not kernel. So
it's read-only in kernel's perspective.

> SYSC_REG_CPLL_CLKCFG1 register is a clock gate controller. It is used to enable or disable clocks.
> Jist wild assumption. All peripheral devices are suing bus clock.

This assumption is incorrect. When this patchset is applied in
OpenWrt, I asked the author why there's still a fixed clock in
mt7621.dtsi, He told me that there's another clock for those unchanged
peripherals and he doesn't have time to write a clock provider for it.
I don't know how many undocumented clocks are there since this piece
of info is missing in datasheet.

>
> IMO - this information is enough to create full blown drivers/clk/mediatek/clk-mt7621.c

And this information isn't enough because the assumption above is incorrect :P

Regards,
Chuanhong Guo
