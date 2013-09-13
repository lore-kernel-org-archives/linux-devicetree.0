From: Lu Jingchang-B35083 <B35083@freescale.com>
Subject: RE: [PATCH v5 3/3] dma: Add Freescale eDMA engine driver support
Date: Fri, 13 Sep 2013 10:19:14 +0000
Message-ID: <B56CDBE15CE27145A4B77D2D24263E852227D5@039-SN1MPN1-003.039d.mgd.msft.net>
References: <1378374902-16512-1-git-send-email-b35083@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378374902-16512-1-git-send-email-b35083@freescale.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "vinod.koul@intel.com" <vinod.koul@intel.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Wang Huan-B18965 <B18965@freescale.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "djbw@fb.com" <djbw@fb.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi, Vinod,

  Could you please help review this patch? 
  Thanks!


Best Regards,
Jingchang

> -----Original Message-----
> From: Lu Jingchang-B35083
> Sent: Thursday, September 05, 2013 5:55 PM
> To: vinod.koul@intel.com
> Cc: djbw@fb.com; shawn.guo@linaro.org; linux-kernel@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; Lu
> Jingchang-B35083; Wang Huan-B18965
> Subject: [PATCH v5 3/3] dma: Add Freescale eDMA engine driver support
> 
> Add Freescale enhanced direct memory(eDMA) controller support.
> The eDMA controller deploys DMAMUXs routing DMA request sources(slot)
> to eDMA channels.
> This module can be found on Vybrid and LS-1 SoCs.
> 
> Signed-off-by: Alison Wang <b18965@freescale.com>
> Signed-off-by: Jingchang Lu <b35083@freescale.com>
> ---
> changes in v5:
>   config slave_id when dmaengine_slave_config intead of channel request.
>   adding residue calculation and dma pause/resume device control.
> 
> changes in v4:
>   using exact compatible string in binding document.
> 
> changes in v3:
>   handle all pending interrupt one time.
>   add protect lock on dma transfer complete handling.
>   change desc and tcd alloc flag to GFP_NOWAIT.
>   add sanity check and error messages.
> 
> changes in v2:
>   using generic dma-channels property instead of fsl,dma-channel.
>   rename the binding document to fsl-edma.txt.
> 
>  Documentation/devicetree/bindings/dma/fsl-edma.txt |  84 ++
>  drivers/dma/Kconfig                                |  10 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/fsl-edma.c                             | 925
> +++++++++++++++++++++
>  4 files changed, 1020 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/fsl-edma.txt
>  create mode 100644 drivers/dma/fsl-edma.c
> 
