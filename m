From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 0/6] Add clock support for Actions Semi S500 SoC
Date: Fri, 1 Feb 2019 09:23:43 +0530
Message-ID: <20190201035343.GB4283@Mani-XPS-13-9360>
References: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, mturquette@baylibre.com, afaerber@suse.de, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Tue, Jan 15, 2019 at 09:03:34AM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds common clock support for Actions Semi S500 SoC of
> the Owl family SoCs. This series is based on the initial work done
> by Edgar Bernardi Righi. https://patchwork.kernel.org/cover/10587527/
> 
> Since there isn't any update from him for long time, I took the liberty
> to modify his patches, address review comments and send to list for review.
> 
> This series has been tested on Allo Sparky SBC.
> 

Can you please merge the clk patches so that I can take the DT bits through
Actions sub-tree?

Thanks,
Mani

> Thanks,
> Mani
> 
> Changes in v2:
> 
> * Incorporated review comments from Stephen for driver cleanup.
> 
> Edgar Bernardi Righi (1):
>   dt-bindings: clock: Add DT bindings for Actions Semi S500 CMU
> 
> Manivannan Sadhasivam (5):
>   clk: actions: Add configurable PLL delay
>   ARM: dts: Add CMU support for Actions Semi Owl S500 SoC
>   ARM: dts: Remove fake UART clock for S500 based SBCs
>   clk: actions: Add clock driver for S500 SoC
>   MAINTAINERS: Add linux-actions mailing list for Actions Semi
> 
>  .../bindings/clock/actions,owl-cmu.txt        |   7 +-
>  MAINTAINERS                                   |   1 +
>  arch/arm/boot/dts/owl-s500-cubieboard6.dts    |   7 -
>  .../arm/boot/dts/owl-s500-guitar-bb-rev-b.dts |   7 -
>  arch/arm/boot/dts/owl-s500-sparky.dts         |   7 -
>  arch/arm/boot/dts/owl-s500.dtsi               |  22 +
>  drivers/clk/actions/Kconfig                   |   5 +
>  drivers/clk/actions/Makefile                  |   1 +
>  drivers/clk/actions/owl-pll.c                 |   2 +-
>  drivers/clk/actions/owl-pll.h                 |  30 +-
>  drivers/clk/actions/owl-s500.c                | 525 ++++++++++++++++++
>  include/dt-bindings/clock/actions,s500-cmu.h  |  78 +++
>  12 files changed, 661 insertions(+), 31 deletions(-)
>  create mode 100644 drivers/clk/actions/owl-s500.c
>  create mode 100644 include/dt-bindings/clock/actions,s500-cmu.h
> 
> -- 
> 2.17.1
> 
