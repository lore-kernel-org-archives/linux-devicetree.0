From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/5] Add Bitmain BM1880 clock driver
Date: Mon, 22 Jul 2019 11:50:56 +0530
Message-ID: <20190722062056.GA3715@Mani-XPS-13-9360>
References: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, fisher.cheng@bitmain.com, alec.lin@bitmain.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 05, 2019 at 08:44:35PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds common clock driver for Bitmain BM1880 SoC clock
> controller. The clock controller consists of gate, divider, mux
> and pll clocks with different compositions. Hence, the driver uses
> composite clock structure in place where multiple clocking units are
> combined together.
> 
> This patchset also removes UART fixed clock and sources clocks from clock
> controller for Sophon Edge board where the driver has been validated.
> 

Ping on this series.

Thanks,
Mani

> Thanks,
> Mani
> 
> Manivannan Sadhasivam (5):
>   dt-bindings: clock: Add Bitmain BM1880 SoC clock controller binding
>   arm64: dts: bitmain: Add clock controller support for BM1880 SoC
>   arm64: dts: bitmain: Source common clock for UART controllers
>   clk: Add driver for Bitmain BM1880 SoC clock controller
>   MAINTAINERS: Add entry for Bitmain BM1880 SoC clock driver
> 
>  .../bindings/clock/bitmain,bm1880-clk.txt     |  47 +
>  MAINTAINERS                                   |   2 +
>  .../boot/dts/bitmain/bm1880-sophon-edge.dts   |   9 -
>  arch/arm64/boot/dts/bitmain/bm1880.dtsi       |  27 +
>  drivers/clk/Kconfig                           |   6 +
>  drivers/clk/Makefile                          |   1 +
>  drivers/clk/clk-bm1880.c                      | 947 ++++++++++++++++++
>  include/dt-bindings/clock/bm1880-clock.h      |  82 ++
>  8 files changed, 1112 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt
>  create mode 100644 drivers/clk/clk-bm1880.c
>  create mode 100644 include/dt-bindings/clock/bm1880-clock.h
> 
> -- 
> 2.17.1
> 
