From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 0/8 v2] k3dma patches to add support for hi3660/HiKey960
Date: Sat, 5 Jan 2019 09:07:38 +0530
Message-ID: <20190105033738.GA2477@Mani-XPS-13-9360>
References: <1546635388-13795-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1546635388-13795-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Guodong Xu <guodong.xu@linaro.org>, Ryan Grachek <ryan@edited.us>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi John,

On Fri, Jan 04, 2019 at 12:56:20PM -0800, John Stultz wrote:
> This patch series is based on recent work by Tanglei Han, and
> adds support for hi3660 SoCs as found on the HiKey960 board,

Not sure about the description/subject here! This patchset adds support
for ASP DMAC found in HI3660 SoCs, Peripheral DMAC is already supported.

Thanks,
Mani

> along with a few patches I've been carrying.
> 
> Review and feedback would be greatly appreciated!
> 
> thanks
> -john
> 
> Cc: Tanglei Han <hantanglei@huawei.com>
> Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Guodong Xu <guodong.xu@linaro.org>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Ryan Grachek <ryan@edited.us>
> CC: devicetree@vger.kernel.org
> Cc: dmaengine@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> 
> John Stultz (3):
>   Documentation: bindings: k3dma: Add binding for dma-avail-chan
>   arm64: dts: hi3660: Add dma to uart nodes
>   arm64: dts: hi3660: Fixup unofficial dma-min-chan to dma-avail-chan
> 
> Li Yu (2):
>   dma: k3dma: Delete axi_config
>   dma: k3dma: Add support to dma_avail_chan
> 
> Youlin Wang (3):
>   Documentation: bindings: k3dma: Extend the k3dma driver binding to
>     support hisi-asp
>   dma: k3dma: Upgrade k3dma driver to support hisi_asp_dma hardware
>   arm64: dts: hi3660: Add hisi asp dma device
> 
>  Documentation/devicetree/bindings/dma/k3dma.txt |  7 ++-
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi       | 22 ++++++++-
>  drivers/dma/k3dma.c                             | 60 +++++++++++++++++++++----
>  3 files changed, 78 insertions(+), 11 deletions(-)
> 
> -- 
> 2.7.4
> 
