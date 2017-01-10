From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/3] dmaeninge: xilinx_dma: Fix bug in multiple frame
 stores scenario in vdma
Date: Mon, 9 Jan 2017 23:35:40 -0600
Message-ID: <20170110053540.qiowb4pfmwvwpkte@rob-hp-laptop>
References: <1483771530-8545-1-git-send-email-appanad@xilinx.com>
 <1483771530-8545-3-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1483771530-8545-3-git-send-email-appanad@xilinx.com>
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
Cc: mark.rutland@arm.com, moritz.fischer@ettus.com, Jose.Abreu@synopsys.com, devicetree@vger.kernel.org, vinod.koul@intel.com, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, dmaengine@vger.kernel.org, dan.j.williams@intel.com, appanad@xilinx.com, soren.brinkmann@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 07, 2017 at 12:15:29PM +0530, Kedareswara rao Appana wrote:
> When VDMA is configured for more than one frame in the h/w
> for example h/w is configured for n number of frames and user
> Submits n number of frames and triggered the DMA using issue_pending API.
> In the current driver flow we are submitting one frame at a time
> but we should submit all the n number of frames at one time as the h/w
> Is configured for n number of frames.
> 
> This patch fixes this issue.
> 
> Reviewed-by: Jose Abreu <joabreu@synopsys.com>
> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> ---
> Changes for v5:
> ---> Updated xlnx,fstore-config property to xlnx,fstore-enable
>      and updated description as suggested by Rob.
> Changes for v4:
> ---> Add Check for framestore configuration on Transmit case as well
>      as suggested by Jose Abreu.
> ---> Modified the dev_dbg checks to dev_warn checks as suggested
>      by Jose Abreu.
> Changes for v3:
> ---> Added Checks for frame store configuration. If frame store
>      Configuration is not present at the h/w level and user
>      Submits less frames added debug prints in the driver as relevant.
> Changes for v2:
> ---> Fixed race conditions in the driver as suggested by Jose Abreu
> ---> Fixed unnecessray if else checks in the vdma_start_transfer
>      as suggested by Laurent Pinchart.
> 
>  .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |  2 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/dma/xilinx/xilinx_dma.c                    | 78 +++++++++++++++-------
>  2 files changed, 57 insertions(+), 23 deletions(-)
