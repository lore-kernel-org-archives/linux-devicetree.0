From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [RESEND PATCH v4 1/3] dmaengine: vdma: Add config structure to
 differentiate dmas
Date: Thu, 12 May 2016 21:39:50 +0530
Message-ID: <20160512160950.GF2274@localhost>
References: <1463046228-21651-1-git-send-email-appanad@xilinx.com>
 <1463046228-21651-2-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1463046228-21651-2-git-send-email-appanad@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: mark.rutland@arm.com, moritz.fischer@ettus.com, anirudh@xilinx.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, svemula@xilinx.com, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, galak@codeaurora.org, dmaengine@vger.kernel.org, dan.j.williams@intel.com, appanad@xilinx.com, soren.brinkmann@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 12, 2016 at 03:13:46PM +0530, Kedareswara rao Appana wrote:
> This patch adds config structure in the driver to differentiate
> AXI DMA's and to add more features(clock support etc..) to these DMA's.
> 
> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> ---
>  drivers/dma/xilinx/xilinx_vdma.c | 83 ++++++++++++++++++++++++----------------
>  1 file changed, 51 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_vdma.c b/drivers/dma/xilinx/xilinx_vdma.c
> index 626939b..1d50e05 100644
> --- a/drivers/dma/xilinx/xilinx_vdma.c
> +++ b/drivers/dma/xilinx/xilinx_vdma.c
> @@ -342,6 +342,10 @@ struct xilinx_dma_chan {
>  	void (*start_transfer)(struct xilinx_dma_chan *chan);
>  };
>  
> +struct dma_config {

xilinx_dma_config ?

This makes reader believe that thismight be coething related to dmaengine
core

>  static const struct of_device_id xilinx_dma_of_ids[] = {
> -	{ .compatible = "xlnx,axi-dma-1.00.a",
> -	  .data = (void *)XDMA_TYPE_AXIDMA },
> -	{ .compatible = "xlnx,axi-cdma-1.00.a",
> -	  .data = (void *)XDMA_TYPE_CDMA },
> -	{ .compatible = "xlnx,axi-vdma-1.00.a",
> -	  .data = (void *)XDMA_TYPE_VDMA },
> +	{ .compatible = "xlnx,axi-dma-1.00.a", .data = &axidma_config },
> +	{ .compatible = "xlnx,axi-cdma-1.00.a", .data = &axicdma_config },
> +	{ .compatible = "xlnx,axi-vdma-1.00.a", .data = &axivdma_config },

why do we want a struct for this and not pass XDMA_TYPE_xxx as .data

-- 
~Vinod
