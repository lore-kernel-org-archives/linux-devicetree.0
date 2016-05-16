From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma
 device tree binding documentation
Date: Mon, 16 May 2016 11:22:05 -0500
Message-ID: <20160516162205.GA11930@rob-hp-laptop>
References: <1463123033-5443-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463123033-5443-1-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 13, 2016 at 12:33:52PM +0530, Kedareswara rao Appana wrote:
> Device-tree binding documentation for Xilinx zynqmp dma engine
> used in Zynq UltraScale+ MPSoC.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> ---
> Changs in v9:
> - Removed include sg runtime configuration parameter
>   from the binding doc as suggested by Lars.
> Changes in v8:
> - Removed all the software runtime configuration parameters
>   from the binding doc as suggested by the Lars.
> Changes in v7:
> - None.
> Changes in v6:
> - Removed desc-axi-cache/dst-axi-cache/src-axi-cache properties
>   from the binding doc as it allow broken combinations when dma-coherent
>   is set as suggested by Rob.
> - Fixed minor comments given by Rob related coding(lower case DT node name).
> Changes in v5:
> - Use dma-coherent flag for coherent transfers as suggested by rob.
> - Removed unnecessary properties from binding doc as suggested by Rob.
> Changes in v4:
> - None
> Changes in v3:
> - None
> Changes in v2:
> - None.
> 
>  .../devicetree/bindings/dma/xilinx/zynqmp_dma.txt  | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt

Acked-by: Rob Herring <robh@kernel.org>
