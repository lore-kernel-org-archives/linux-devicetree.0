From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/4] Add HiSilicon Hi3670 SoC and HiKey970 board
Date: Thu, 30 Aug 2018 08:44:49 +0530
Message-ID: <20180830031449.GC8565@Mani-XPS-13-9360>
References: <20180810175339.25421-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180810175339.25421-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com
Cc: robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, guodong.xu@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 10, 2018 at 11:23:35PM +0530, Manivannan Sadhasivam wrote:
> This patchset adds support for Hi3670 SoC and HiKey970 board. Hi3670 SoC
> is very similar to the Hi3660 SoC with additional NPU support. For now,
> only UART6 has been enabled which is configured by the bootloader for
> console support.
> 
> HiKey970 board is one of the 96Boards Consumer Edition and AI platform
> based on the Hi3670 SoC.
> 
> With this patchset, the Hikey970 board is able to boot into ramdisk with
> 8 cores.
>

Hi Wei,

Any update on this patchset?

Thanks,
Mani

> Thanks,
> Mani
> 
> Manivannan Sadhasivam (4):
>   dt-bindings: arm: hisilicon: Add binding for Hi3670 SoC
>   arm64: dts: Add devicetree for Hisilicon Hi3670 SoC
>   dt-bindings: arm: hisilicon: Add binding for HiKey970 board
>   arm64: dts: Add devicetree support for HiKey970 board
> 
>  .../bindings/arm/hisilicon/hisilicon.txt      |   8 +
>  arch/arm64/boot/dts/hisilicon/Makefile        |   1 +
>  .../boot/dts/hisilicon/hi3670-hikey970.dts    |  35 ++++
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi     | 162 ++++++++++++++++++
>  4 files changed, 206 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
>  create mode 100644 arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> 
> -- 
> 2.17.1
> 
