From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 09/11] clk: sprd: add clocks support for SC9860
Date: Mon, 6 Nov 2017 15:43:35 -0600
Message-ID: <20171106214335.qvuvcwahemnpwftt@rob-hp-laptop>
References: <20171102065626.21835-1-chunyan.zhang@spreadtrum.com>
 <20171102065626.21835-10-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171102065626.21835-10-chunyan.zhang@spreadtrum.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Orson Zhai <orson.zhai@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 02, 2017 at 02:56:24PM +0800, Chunyan Zhang wrote:
> This patch added the list of clocks for Spreadtrum's SC9860 SoC,
> together with clock initialization code.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> ---
>  drivers/clk/sprd/Kconfig                    |   10 +
>  drivers/clk/sprd/Makefile                   |    3 +
>  drivers/clk/sprd/sc9860-clk.c               | 1987 +++++++++++++++++++++++++++
>  include/dt-bindings/clock/sprd,sc9860-clk.h |  408 ++++++

This belongs in the binding doc patch.

Rob
