From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 2/4] dmaengine: mmp-pdma: add number of requestors
Date: Thu, 11 Feb 2016 22:23:16 +0100
Message-ID: <1455225798-9510-3-git-send-email-robert.jarzmik@free.fr>
References: <1455225798-9510-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1455225798-9510-1-git-send-email-robert.jarzmik@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Vinod Koul <vinod.koul@intel.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The DMA chip has a fixed number of requestor lines used for flow
control. This number is platform dependent. The pxa_dma dma driver will
use this value to activate or not the flow control.

There won't be any impact on mmp_pdma driver.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 include/linux/platform_data/mmp_dma.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/platform_data/mmp_dma.h b/include/linux/platform_data/mmp_dma.h
index 2a330ec9e2af..d1397c8ed94e 100644
--- a/include/linux/platform_data/mmp_dma.h
+++ b/include/linux/platform_data/mmp_dma.h
@@ -14,6 +14,7 @@
 
 struct mmp_dma_platdata {
 	int dma_channels;
+	int nb_requestors;
 };
 
 #endif /* MMP_DMA_H */
-- 
2.1.4
