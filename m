From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH v5 0/6] add edma2 for i.mx7ulp
Date: Tue, 25 Jun 2019 22:56:17 +0200
Message-ID: <20190625205617.GA24968@jerusalem>
References: <20190625094324.19196-1-yibin.gong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190625094324.19196-1-yibin.gong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: yibin.gong@nxp.com
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, vkoul@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, dmaengine@vger.kernel.org, dan.j.williams@intel.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Robin,

On Tue, Jun 25, 2019 at 05:43:18PM +0800, yibin.gong@nxp.com wrote:
> From: Robin Gong <yibin.gong@nxp.com>
> 
> This patch set add new version of edma for i.mx7ulp, the main changes
> are as belows:
>  1. only one dmamux.
>  2. another clock dma_clk except dmamux clk.
>  3. 16 independent interrupts instead of only one interrupt for
>     all channels
> For the first change, need modify fsl-edma-common.c and mcf-edma,
> so create the first two patches to prepare without any function impact.
> 
> For the third change, need request single irq for every channel with
> the legacy handler. But actually 2 dma channels share one interrupt(16
> channel interrupts, but 32 channels.),ch0/ch16,ch1/ch17... For now, just
> simply request irq without IRQF_SHARED flag, since 16 channels are enough
> on i.mx7ulp whose M4 domain own some peripherals.
> 
> change from v1:
>   1. check .data of 'of_device_id' in probe instead of compatible name.
> 
> change from v2:
>   1. move the difference between edma and edma2 into driver data so that
>      no need version checking in fsl-edma.c.
> 
> change from v3:
>   1. remove duplicated 'version' and 'dmamux_nr' in 'struct fsl_edma_engine'
>      since they are included in drvdata already.
>   2. downgrade print log level.
>   3. address some minor indent issues raised by Vinod.
> 
> change from v4:
>   1. correct typo.
> 
> Robin Gong (6):
>   dmaengine: fsl-edma: add drvdata for fsl-edma
>   dmaengine: fsl-edma-common: move dmamux register to another single
>     function
>   dmaengine: fsl-edma-common: version check for v2 instead
>   dt-bindings: dma: fsl-edma: add new i.mx7ulp-edma
>   dmaengine: fsl-edma: add i.mx7ulp edma2 version support
>   ARM: dts: imx7ulp: add edma device node
> 
>  Documentation/devicetree/bindings/dma/fsl-edma.txt |  44 ++++++++-
>  arch/arm/boot/dts/imx7ulp.dtsi                     |  28 ++++++
>  drivers/dma/fsl-edma-common.c                      |  83 ++++++++++------
>  drivers/dma/fsl-edma-common.h                      |  14 ++-
>  drivers/dma/fsl-edma.c                             | 109 ++++++++++++++++++---
>  drivers/dma/mcf-edma.c                             |  11 ++-
>  6 files changed, 239 insertions(+), 50 deletions(-)
> 

I tested the patch-set on ColdFire mcf5441x (stmark2 board), all works fine.

Tested-by: Angelo Dureghello <angelo@sysam.it>


Regards,
Angelo

> -- 
> 2.7.4
> 
