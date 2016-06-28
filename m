From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/5] dmaengine: dma: Use different channel names for
 each dma
Date: Tue, 28 Jun 2016 15:55:24 -0500
Message-ID: <20160628205524.GG3737@rob-hp-laptop>
References: <1466745686-23898-1-git-send-email-appanad@xilinx.com>
 <1466745686-23898-6-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466745686-23898-6-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2016 at 10:51:26AM +0530, Kedareswara rao Appana wrote:
> Current driver assumes that child node channel name is either
> "xlnx,axi-vdma-mm2s-channel" or "xlnx,axi-vdma-s2mm-channel"
> which is confusing the users of AXI DMA and CDMA.
> This patch fixes this issue by using different channel
> names for the AXI DMA and AXI CDMA child nodes.
> 
> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> ---
> Chanes for v2:
> ---> New patch.
> 
>  .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |    6 +++++-
>  drivers/dma/xilinx/xilinx_dma.c                    |    8 ++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
