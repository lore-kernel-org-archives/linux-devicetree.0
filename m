From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH RFC 3/8] dma: mpc512x: support 'terminate all' control request
Date: Fri, 12 Jul 2013 17:26:16 +0200
Message-ID: <1373642781-32631-4-git-send-email-gsi@denx.de>
References: <1373642781-32631-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373642781-32631-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

implement the TERMINATE_ALL request in the device_control() callback
of the DMA engine driver for the MPC512x DMA controller

reword variable initialization to better follow the code path and to
avoid artificial diffs later on (this style change vanishes when this
patch gets squashed with the device_control() routine's introduction)

Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---
 drivers/dma/mpc512x_dma.c |   15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index df10a48..0053ff8 100644
--- a/drivers/dma/mpc512x_dma.c
+++ b/drivers/dma/mpc512x_dma.c
@@ -748,11 +748,22 @@ static struct dma_async_tx_descriptor *mpc_dma_prep_slave_sg(
 static int mpc_dma_device_control(struct dma_chan *chan, enum dma_ctrl_cmd cmd,
 				  unsigned long arg)
 {
-	struct mpc_dma_chan *mchan = dma_chan_to_mpc_dma_chan(chan);
-	struct dma_slave_config *cfg = (void *)arg;
+	struct mpc_dma_chan *mchan;
+	struct mpc_dma *mdma;
+	struct dma_slave_config *cfg;
 
+	mchan = dma_chan_to_mpc_dma_chan(chan);
 	switch (cmd) {
+	case DMA_TERMINATE_ALL:
+		/* disable channel requests */
+		mdma = dma_chan_to_mpc_dma(chan);
+		out_8(&mdma->regs->dmacerq, chan->chan_id);
+		list_splice_tail_init(&mchan->prepared, &mchan->free);
+		list_splice_tail_init(&mchan->queued, &mchan->free);
+		list_splice_tail_init(&mchan->active, &mchan->free);
+		return 0;
 	case DMA_SLAVE_CONFIG:
+		cfg = (void *)arg;
 		if (cfg->src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES &&
 		    cfg->dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return -EINVAL;
-- 
1.7.10.4
