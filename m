From: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
Date: Sun, 18 Aug 2019 10:29:29 +0800
Message-ID: <CAJsYDVLLPa07wUg2EoeJww9XSJYgX_kBu-oGiv7n+zejUc877w@mail.gmail.com>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus>
 <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
 <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
 <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, James Hogan <jhogan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, open list <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Weijie Gao <hackpascal@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Crispin <john@phrozen.org>, NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi!

On Sun, Aug 18, 2019 at 2:06 AM Oleksij Rempel <linux@rempel-privat.de> wrote:
> >> SYSC_REG_CPLL_CLKCFG1 register is a clock gate controller. It is used to enable or disable clocks.
> >> Jist wild assumption. All peripheral devices are suing bus clock.
> >
> > This assumption is incorrect. When this patchset is applied in
> > OpenWrt, I asked the author why there's still a fixed clock in
> > mt7621.dtsi, He told me that there's another clock for those unchanged
> > peripherals and he doesn't have time to write a clock provider for it.
>
> Can you please provide a link to this patch or email.

This discussion is in Chinese and using an IM software so there's no
link available.

> We have at least 2 know registers:
> SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostrapped
> refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
> SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
> all or some ip cores.
> What is probably missing is a set of dividers for
> each ip core. From your words it is not document.

The specific missing part I was referring to, is parent clocks for
every gates. I'm not going to assume this with current openwrt device
tree because some peripherals doesn't have a clock binding at all or
have a dummy one there.

>
> With this information the clk driver will provide gate functionality and
> a set of hardcoded clocks. With this driver will work part of power
> management and nice devicetree without fixed clocks.

Regards,
Chuanhong Guo
