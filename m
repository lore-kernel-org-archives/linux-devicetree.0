From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v4 0/5] Add clock driver for Actions S700 SoC
Date: Sun, 15 Jul 2018 19:53:45 +0530
Message-ID: <20180715142345.GB9980@Mani-XPS-13-9360>
References: <20180715123145.16975-1-sravanhome@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180715123145.16975-1-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravanan Sekar <sravanhome@gmail.com>
Cc: afaerber@suse.de, sboyd@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

Hi Saravanan,

On Sun, Jul 15, 2018 at 02:31:40PM +0200, Saravanan Sekar wrote:
> Changelog v4:
> - dt-bindings use absolute numbering for clocks
> - Patch re-oredering
> 
> Changelog v3:
> - Splitted uart clock DTS changes into separate patch
> - Splitted REGMAP Kconfig selection into separate patch
> - General naming convention as "Actions Semi" in dt-binding documentation
> - Patch re-oredering
> - Cleanup and fixed review findings
> 
> Changelog v2:
> Fixed 0 day compilation warning
> Modified existing dts Actions S900 clock bindings common to Actions
> Soc family
> 

Usually Changelog comes at the end of cover letter.

> This patchset adds clock support for Actions Semi OWL series S700 SoC
> with relevant clock bindings and device tree info. 
> 

Nit: Since we agreed to use the family name as Owl everywhere, the above
instance should be changed accordingly.

> Changed the UART clock using CMU instance and changes are tested in
> cubieboard7
> 
> Thanks and regards,
> Saravanan,
> Parthiban
> 
> *** BLURB HERE ***

Please remove the above line.

Thanks,
Mani

> 
> Saravanan Sekar (5):
>   clk: actions: Add REGMAP as dependency
>   dt-bindings: clock: Add S700 support for Actions Semi Soc's
>   clk: actions: Add S700 SoC clock support
>   arm64: dts: actions: Enable clock controller for S700
>   arm64: dts: actions: Set UART clock reference from CMU
> 
>  ...tions,s900-cmu.txt => actions,owl-cmu.txt} |  20 +-
>  .../boot/dts/actions/s700-cubieboard7.dts     |   8 +-
>  arch/arm64/boot/dts/actions/s700.dtsi         |  14 +
>  drivers/clk/actions/Kconfig                   |  14 +
>  drivers/clk/actions/Makefile                  |   1 +
>  drivers/clk/actions/owl-s700.c                | 610 ++++++++++++++++++
>  include/dt-bindings/clock/actions,s700-cmu.h  | 118 ++++
>  7 files changed, 769 insertions(+), 16 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{actions,s900-cmu.txt => actions,owl-cmu.txt} (67%)
>  create mode 100644 drivers/clk/actions/owl-s700.c
>  create mode 100644 include/dt-bindings/clock/actions,s700-cmu.h
> 
> -- 
> 2.18.0
> 
