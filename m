From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [RESEND PATCH v2 1/6] dmaengine: vdma: Fix checkpatch.pl warnings
Date: Wed, 6 Apr 2016 10:44:55 +0530
Message-ID: <1459919700-6692-2-git-send-email-appanad@xilinx.com>
References: <1459919700-6692-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459919700-6692-1-git-send-email-appanad@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, svemula@xilinx.com, anirudh@xilinx.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch fixes the below checkpatch.pl warnings.

WARNING: void function return statements are not generally useful
+	return;
+}

WARNING: void function return statements are not generally useful
+	return;
+}

WARNING: Missing a blank line after declarations
+		u32 errors = status & XILINX_VDMA_DMASR_ALL_ERR_MASK;
+		vdma_ctrl_write(chan, XILINX_VDMA_REG_DMASR,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
---
Changes for v2:
---> None.

 drivers/dma/xilinx/xilinx_vdma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_vdma.c b/drivers/dma/xilinx/xilinx_vdma.c
index b873d98..3c5ce37 100644
--- a/drivers/dma/xilinx/xilinx_vdma.c
+++ b/drivers/dma/xilinx/xilinx_vdma.c
@@ -597,8 +597,6 @@ static void xilinx_vdma_halt(struct xilinx_vdma_chan *chan)
 			chan, vdma_ctrl_read(chan, XILINX_VDMA_REG_DMASR));
 		chan->err = true;
 	}
-
-	return;
 }
 
 /**
@@ -623,8 +621,6 @@ static void xilinx_vdma_start(struct xilinx_vdma_chan *chan)
 
 		chan->err = true;
 	}
-
-	return;
 }
 
 /**
@@ -874,6 +870,7 @@ static irqreturn_t xilinx_vdma_irq_handler(int irq, void *data)
 		 * make sure not to write to other error bits to 1.
 		 */
 		u32 errors = status & XILINX_VDMA_DMASR_ALL_ERR_MASK;
+
 		vdma_ctrl_write(chan, XILINX_VDMA_REG_DMASR,
 				errors & XILINX_VDMA_DMASR_ERR_RECOVER_MASK);
 
-- 
2.1.2
