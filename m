From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 0/4] Add reset controller support for BM1880 SoC
Date: Fri, 10 May 2019 14:27:56 +0530
Message-ID: <20190510085756.GA4974@Mani-XPS-13-9360>
References: <20190508165319.19822-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508165319.19822-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 10:23:15PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds reset controller support for Bitmain BM1880 SoC.
> BM1880 SoC has two reset controllers each controlling reset lines of
> different peripherals. And the reset-simple driver has been reused here.
> 

Sorry, above information was wrong! Actually there is only one reset
controller in this SoC. The other one (clk_rst) is a set of registers used
for clock gating functionality (clarified by Bitmain Engineer), so I will
remove it in next version.

Thanks,
Mani

> This patchset has been tested on 96Boards Sophon Edge board.
> 
> Thanks,
> Mani
> 
> Changes in v2:
> 
> As per review from Philipp:
> 
> * Reused reset_simple_active_low struct instead of a new one for bm1880
> * Splitted the SPDX license change to a separate commit
> * Added Reviewed-by tags from Rob and Philipp
> 
> Manivannan Sadhasivam (4):
>   dt-bindings: reset: Add devicetree binding for BM1880 reset controller
>   arm64: dts: bitmain: Add reset controller support for BM1880 SoC
>   reset: Add reset controller support for BM1880 SoC
>   reset: Switch to SPDX license identifier for reset-simple
> 
>  .../bindings/reset/bitmain,bm1880-reset.txt   |  18 +++
>  arch/arm64/boot/dts/bitmain/bm1880.dtsi       |  17 +++
>  drivers/reset/Kconfig                         |   3 +-
>  drivers/reset/reset-simple.c                  |   8 +-
>  .../dt-bindings/reset/bitmain,bm1880-reset.h  | 106 ++++++++++++++++++
>  5 files changed, 146 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reset/bitmain,bm1880-reset.txt
>  create mode 100644 include/dt-bindings/reset/bitmain,bm1880-reset.h
> 
> -- 
> 2.17.1
> 
