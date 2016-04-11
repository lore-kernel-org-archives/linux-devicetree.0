From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/5] Documentation: DT: vdma: update binding doc for
 AXI DMA
Date: Mon, 11 Apr 2016 08:59:36 -0500
Message-ID: <20160411135936.GA32212@rob-hp-laptop>
References: <1460006985-14805-1-git-send-email-appanad@xilinx.com>
 <1460006985-14805-3-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460006985-14805-3-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, anirudh@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 07, 2016 at 10:59:42AM +0530, Kedareswara rao Appana wrote:
> This patch updates the device-tree binding doc for
> adding support for AXI DMA.
> Also this patch differentiates required properties b/w
> DMA and VDMA.
> 
> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> ---
> Changes for v4:
> ---> None.
> Changes for v3:
> ---> Removed AXI DMA DT example from the patch as suggested by Rob.
> ---> Differentiated required/optional properties for each DMA's
>      as suggested by Rob.
> Changes for v2:
> ---> Modified commit message as suggested by Vinod.
> ---> Moved the patch to forward in the series as suggested by vinod.
> 
>  .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt          | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
