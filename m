From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH/RFC v3 00/22] soc: renesas: Add R-Car RST driver for
 obtaining mode pin state
Date: Mon, 12 Sep 2016 15:16:40 -0700
Message-ID: <20160912221640.GG7243@codeaurora.org>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
 <20160630201407.GA27880@codeaurora.org>
 <CAMuHMdWu34OQSS6J3bf=0-1TYULc=coiVomBjtBatwGta5F3HQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWu34OQSS6J3bf=0-1TYULc=coiVomBjtBatwGta5F3HQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Dirk Behme <dirk.behme@de.bosch.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

On 09/01, Geert Uytterhoeven wrote:
> Hi Stephen,
> 
> On Thu, Jun 30, 2016 at 10:14 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 06/01, Geert Uytterhoeven wrote:
> >> Currently the R-Car Clock Pulse Generator (CPG) drivers obtains the
> >> state of the mode pins either by a call from the board code, or directly
> >> by using a hardcoded register access. This is a bit messy, and creates a
> >> dependency between driver and platform code.
> >>
> >> This RFC patch series converts the various Renesas R-Car clock drivers
> >> and support code from reading the mode pin states using a hardcoded
> >> register access to using a new R-Car RST driver.
> >
> > Dumb question, can we use the nvmem reading APIs instead of an
> > SoC specific function to read the modes?
> 
> Thanks for your suggestion, the nvmem API indeed looks like a suitable API,
> as it does support read-only nvmems.
> 
> Unfortunately I also see a few disadvantages:
>   1. nvmem_init() is a subsys_initcall(), while most of our users (except for
>      the recent renesas-cpg-mssr driver) are clock drivers using
>      CLK_OF_DECLARE(), and are thus initialized from of_clk_init() at much
>      earlier time_init() time.
>      Of course the mvmem subsystem and/or the clock drivers can be changed, if
>      deemed useful.

Sounds like this is solvable.

>   2. Using the nvmem DT bindings means we have to add more DT glue from the
>      nvmem consumer(s) to the nvmem provider. As we need to provide backwards
>      compatibility with old DTSes, this means we need more C code or DT fixup
>      code to handle that.

Ah I wasn't aware we were keeping backwards compatibility around.


>   3. The nvmem subsystem may be overkill to provide access to a simple 32-bit
>      read-only register that never changes value after boot.

The nvmem subsystem is designed to read values from things that
mostly never change. Overkill may be true, but the nice thing
about using nvmem APIs is that the driver doesn't have to use
some platform specific function that duplicates similar
functionality. It's unfortunate that backwards incompatibility
limits our ability to move to common linux frameworks when they
are created after the binding is used.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
