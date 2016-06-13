From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] Documentation: DT: dma: Delete binding doc for AXI
 DMA
Date: Mon, 13 Jun 2016 13:59:08 -0500
Message-ID: <20160613185908.GA26187@rob-hp-laptop>
References: <1465549954-30220-1-git-send-email-appanad@xilinx.com>
 <1465549954-30220-4-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465549954-30220-4-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 02:42:33PM +0530, Kedareswara rao Appana wrote:
> The AXI DMA support is added to the existing AXI VDMA
> driver. Device tree binding information also updated
> in the VDMA binding doc.
> 
> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> ---
>  .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |   65 --------------------
>  1 files changed, 0 insertions(+), 65 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt

Acked-by: Rob Herring <robh@kernel.org>
