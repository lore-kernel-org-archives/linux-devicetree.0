From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 4/5] Documentation: DT: vdma: update binding doc for
 AXI CDMA
Date: Mon, 11 Apr 2016 09:02:43 -0500
Message-ID: <20160411140243.GA827@rob-hp-laptop>
References: <1460006985-14805-1-git-send-email-appanad@xilinx.com>
 <1460006985-14805-5-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460006985-14805-5-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, anirudh@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 07, 2016 at 10:59:44AM +0530, Kedareswara rao Appana wrote:
> This patch updates the device-tree binding doc for
> adding support for AXI CDMA.
> 
> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> ---
> Changes for v4:
> ---> None.
> Changes for v3:
> ---> Removed CDMA DT example from the patch as suggested by the Rob.
> Changes for v2:
> ---> Modified commit message as suggested by Vinod.
> ---> Moved the patch to forward in the series as suggested by vinod.
> 
>  Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
