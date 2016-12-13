From: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Subject: [PATCH 1/9] dmaengine: stm32-dma: Set correct args number for DMA
 request from DT
Date: Tue, 13 Dec 2016 14:40:43 +0100
Message-ID: <1481636451-27863-2-git-send-email-cedric.madianga@gmail.com>
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

This patch sets the right number of arguments to be used for DMA clients
which request channels from DT.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Reviewed-by: Ludovic BARRE <ludovic.barre@st.com>
---
 drivers/dma/stm32-dma.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 3688d08..a884b85 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -972,21 +972,18 @@ static struct dma_chan *stm32_dma_of_xlate(struct of_phandle_args *dma_spec,
 	struct stm32_dma_chan *chan;
 	struct dma_chan *c;
 
-	if (dma_spec->args_count < 3)
+	if (dma_spec->args_count < 4)
 		return NULL;
 
 	cfg.channel_id = dma_spec->args[0];
 	cfg.request_line = dma_spec->args[1];
 	cfg.stream_config = dma_spec->args[2];
-	cfg.threshold = 0;
+	cfg.threshold = dma_spec->args[3];
 
 	if ((cfg.channel_id >= STM32_DMA_MAX_CHANNELS) || (cfg.request_line >=
 				STM32_DMA_MAX_REQUEST_ID))
 		return NULL;
 
-	if (dma_spec->args_count > 3)
-		cfg.threshold = dma_spec->args[3];
-
 	chan = &dmadev->chan[cfg.channel_id];
 
 	c = dma_get_slave_channel(&chan->vchan.chan);
-- 
1.9.1
