From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH RESEND 2/5] dmaengine: Provide a wrapper for memcpy operations
Date: Fri, 27 Jan 2017 17:42:01 +0100
Message-ID: <1485535324-28393-3-git-send-email-boris.brezillon@free-electrons.com>
References: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Almost all ->device_prep_dma_xx() methods have a wrapper defined in
dmaengine.h. Add one for  ->device_prep_dma_memcpy().

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 include/linux/dmaengine.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index feee6ec6a13b..533680860865 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -894,6 +894,17 @@ static inline struct dma_async_tx_descriptor *dmaengine_prep_dma_memset(
 						    len, flags);
 }
 
+static inline struct dma_async_tx_descriptor *dmaengine_prep_dma_memcpy(
+		struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
+		size_t len, unsigned long flags)
+{
+	if (!chan || !chan->device || !chan->device->device_prep_dma_memcpy)
+		return NULL;
+
+	return chan->device->device_prep_dma_memcpy(chan, dest, src,
+						    len, flags);
+}
+
 static inline struct dma_async_tx_descriptor *dmaengine_prep_dma_sg(
 		struct dma_chan *chan,
 		struct scatterlist *dst_sg, unsigned int dst_nents,
-- 
2.7.4
