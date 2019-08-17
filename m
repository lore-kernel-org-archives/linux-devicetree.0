From: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
Date: Sat, 17 Aug 2019 22:42:12 +0800
Message-ID: <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com>
 <20190813155143.GA19830@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190813155143.GA19830@bogus>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh@kernel.org>
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>, James Hogan <jhogan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, open list <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Weijie Gao <hackpascal@gmail.com>, John Crispin <john@phrozen.org>, NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi!

On Tue, Aug 13, 2019 at 11:51 PM Rob Herring <robh@kernel.org> wrote:
> [...]
> > +Example:
> > +     pll {
> > +             compatible = "mediatek,mt7621-pll";
>
> You didn't answer Stephen's question on v1.

I thought he was asking why there's a syscon in compatible string. I
noticed that the syscon in my previous patch is a copy-paste error
from elsewhere and dropped it.

>
> Based on this binding, there is no way to control/program the PLL. Is
> this part of some IP block?

The entire section is called "system control" in datasheet and is
occupied in arch/mips/ralink/mt7621.c [0]
Two clocks provided here is determined by reading some read-only
registers in this part.
There's another register in this section providing clock gates for
every peripherals, but MTK doesn't provide a clock plan in their
datasheet. I can't determine corresponding clock frequencies for every
peripherals, thus unable to write a working clock driver.

>
> > +
> > +             #clock-cells = <1>;
> > +             clock-output-names = "cpu", "bus";
> > +     };
> > --
> > 2.21.0
> >

Regards,
Chuanhong Guo

[0] https://elixir.bootlin.com/linux/latest/source/arch/mips/ralink/mt7621.c#L156
