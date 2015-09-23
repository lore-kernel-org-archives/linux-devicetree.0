From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH 0/5] Add Marvell berlin4ct clk support
Date: Wed, 23 Sep 2015 09:55:21 +0800
Message-ID: <20150923095521.1ccea0de@xhacker>
References: <1442931156-5877-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1442931156-5877-1-git-send-email-jszhang@marvell.com>
Sender: linux-clk-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

+ CLK maintainers

sorry, yesterday I pressed ENTER quickly before --to list is completed

On Tue, 22 Sep 2015 22:12:31 +0800
Jisheng Zhang <jszhang@marvell.com> wrote:

> Add berlin4ct clk driver. The berlin4ct SoC contains:
> 
> two kinds of PLL: normal PLL and AVPLL. The normal PLL support is done.
> The AVPLL support is in TODO list.
> 
> two kinds of clk: normal clk and gate clk. The normal clk supports changing
> divider, selecting clock source, disabling/enabling etc. The gate clk only
> supports disabling/enabling. Both are supported in this series.
> 
> Jisheng Zhang (5):
>   clk: berlin: add common pll driver
>   clk: berlin: add common clk driver for newer SoCs
>   clk: berlin: add clk support for berlin4ct
>   dt-bindings: add binding for marvell berlin4ct SoC
>   arm64: dts: berlin4ct: add pll and clock nodes
> 
>  .../bindings/clock/marvell,berlin4ct.txt           |  38 +++++
>  arch/arm64/boot/dts/marvell/berlin4ct.dtsi         |  38 +++++
>  drivers/clk/berlin/Makefile                        |   2 +-
>  drivers/clk/berlin/clk-berlin4ct.c                 | 164 +++++++++++++++++++++
>  drivers/clk/berlin/clk.c                           | 147 ++++++++++++++++++
>  drivers/clk/berlin/clk.h                           |  38 +++++
>  drivers/clk/berlin/pll.c                           | 119 +++++++++++++++
>  include/dt-bindings/clock/berlin4ct.h              |  56 +++++++
>  8 files changed, 601 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/marvell,berlin4ct.txt
>  create mode 100644 drivers/clk/berlin/clk-berlin4ct.c
>  create mode 100644 drivers/clk/berlin/clk.c
>  create mode 100644 drivers/clk/berlin/clk.h
>  create mode 100644 drivers/clk/berlin/pll.c
>  create mode 100644 include/dt-bindings/clock/berlin4ct.h
> 

