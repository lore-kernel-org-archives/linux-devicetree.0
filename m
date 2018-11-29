From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: Add Fixed MMIO clock driver
Date: Thu, 29 Nov 2018 14:29:34 -0800
Message-ID: <154353057449.88331.10017415440005548379@swboyd.mtv.corp.google.com>
References: <D3711617-229C-4FA5-9E73-A7A3C025893B@global.cadence.com>
 <154223394933.88331.14659021245427374668@swboyd.mtv.corp.google.com>
 <CAE55F09-516A-4737-8F74-07BBA3AF5737@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE55F09-516A-4737-8F74-07BBA3AF5737@global.cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Janek Kotas <jank@cadence.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Janek Kotas (2018-11-15 00:27:15)
> Thanks for the reply.
> Jan
> =

> > On 14 Nov 2018, at 23:19, Stephen Boyd <sboyd@kernel.org> wrote:
> > =

> > Quoting Janek Kotas (2018-11-14 07:24:39)
> >> This patch adds a driver for Fixed MMIO clock.
> >> The driver reads a clock frequency value from a single 32-bit memory
> >> mapped register and registers it as a fixed rate clock.
> >> =

> >> It can be enabled with COMMON_CLK_FIXED_MMIO Kconfig option.
> >> =

> >> Signed-off-by: Jan Kotas <jank@cadence.com>
> > =

> > Sounds like a fine idea. Except I can see how it will be abused if there
> > are a handful of these fixed rate "clks" somewhere in memory that all
> > get populated. =

> > =

> > Do you really have a fixed rate clk in hardware that exposes a single
> > register, or do you have a set of them that some firmware is populating
> > into an I/O memory space that we can read the fixed rates from? If it's
> > the latter, I wonder why we can't just have the firmware populate the
> > fixed rate clks into DT itself?
> =

> The first case.
> We have a single register in a fixed location which contains =

> the frequency of the main system clock.
> This allows us to use the same image in emulation, FPGA
> and simulation without any changes.
> We usually don=E2=80=99t use a full bootloader, just a simple wrapper,
> which initializes the necessary stuff and jumps to the kernel.

So the hardware team has decided to throw a frequency register in there?
Alright! Does that fixed rate clk generate its fixed rate from some
other clk? I'm curious if this fixed rate clk has a parent source.

It would also be good to make sure that any clks registered from this
driver can't be populated from regions of memory like DDR. Can you
confirm? I think it will fail, but it would be worth checking

> =

> > =

> >> diff --git a/drivers/clk/clk-fixed-mmio.c b/drivers/clk/clk-fixed-mmio=
.c
> >> new file mode 100644
> >> index 0000000000..bbcadab345
> >> --- /dev/null
> >> +++ b/drivers/clk/clk-fixed-mmio.c
> =

> > =

> >> +}
> >> +
> >> +CLK_OF_DECLARE(fixed_mmio_clk, "fixed-mmio-clock", of_fixed_mmio_clk_=
setup);
> > =

> > Any reason why this can't be a platform driver? It would make this much
> > less DT specific and usable on other firmwares/platforms if we used a
> > platform driver here.
> > =

> =

> I looked at the fixed rate clock as a reference, but I can change it to =

> a platform driver, if that=E2=80=99s preferred.
> =


Yes I'd prefer a platform driver unless there's some reason it can't be
done. We may need to have both in case this needs to be populated very
early, but if that isn't the case then just a platform driver for now.
