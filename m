From: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Subject: [PATCH 4/9] dmaengine: stm32-dma: Fix null pointer dereference in
 stm32_dma_tx_status
Date: Tue, 13 Dec 2016 14:40:46 +0100
Message-ID: <1481636451-27863-5-git-send-email-cedric.madianga@gmail.com>
References: <1481636451-27863-1-git-send-email-cedric.madianga@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1481636451-27863-1-git-send-email-cedric.madianga@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: vinod.koul@intel.com, robh+dt@kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
List-Id: devicetree@vger.kernel.org

chan->desc is always set to NULL when a DMA transfer is complete.
As a DMA transfer could be complete during the call of stm32_dma_tx_status,
we need to be sure that chan->desc is not NULL before using this variable
to avoid a null pointer deference issue.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Reviewed-by: Ludovic BARRE <ludovic.barre@st.com>
---
 drivers/dma/stm32-dma.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index a884b85..3056ce7 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -880,7 +880,7 @@ static enum dma_status stm32_dma_tx_status(struct dma_chan *c,
 	struct virt_dma_desc *vdesc;
 	enum dma_status status;
 	unsigned long flags;
-	u32 residue;
+	u32 residue = 0;
 
 	status = dma_cookie_status(c, cookie, state);
 	if ((status == DMA_COMPLETE) || (!state))
@@ -888,16 +888,12 @@ static enum dma_status stm32_dma_tx_status(struct dma_chan *c,
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 	vdesc = vchan_find_desc(&chan->vchan, cookie);
-	if (cookie == chan->desc->vdesc.tx.cookie) {
+	if (chan->desc && cookie == chan->desc->vdesc.tx.cookie)
 		residue = stm32_dma_desc_residue(chan, chan->desc,
 						 chan->next_sg);
-	} else if (vdesc) {
+	else if (vdesc)
 		residue = stm32_dma_desc_residue(chan,
 						 to_stm32_dma_desc(vdesc), 0);
-	} else {
-		residue = 0;
-	}
-
 	dma_set_residue(state, residue);
 
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
-- 
1.9.1
