From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/7] dmaengine: at_xdmac: prefer usage of readl/writel_relaxed
Date: Thu, 13 Nov 2014 11:52:39 +0100
Message-ID: <1415875965-6905-2-git-send-email-ludovic.desroches@atmel.com>
References: <1415875965-6905-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415875965-6905-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

_relaxed version of readl and writel are not implemented on all
architecture so COMPILE_TEST has to be removed in order to not cause
some build failures.

Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/Kconfig    | 2 +-
 drivers/dma/at_xdmac.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index aef8b9d..f2b2c4e 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -109,7 +109,7 @@ config AT_HDMAC
 
 config AT_XDMAC
 	tristate "Atmel XDMA support"
-	depends on (ARCH_AT91 || COMPILE_TEST)
+	depends on ARCH_AT91
 	select DMA_ENGINE
 	help
 	  Support the Atmel XDMA controller.
diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 89c43be..1f53d92 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -248,12 +248,12 @@ static inline void __iomem *at_xdmac_chan_reg_base(struct at_xdmac *atxdmac, uns
 	return atxdmac->regs + (AT_XDMAC_CHAN_REG_BASE + chan_nb * 0x40);
 }
 
-#define at_xdmac_read(atxdmac, reg) readl((atxdmac)->regs + (reg))
+#define at_xdmac_read(atxdmac, reg) readl_relaxed((atxdmac)->regs + (reg))
 #define at_xdmac_write(atxdmac, reg, value) \
-	writel((value), (atxdmac)->regs + (reg))
+	writel_relaxed((value), (atxdmac)->regs + (reg))
 
-#define at_xdmac_chan_read(atchan, reg) readl((atchan)->ch_regs + (reg))
-#define at_xdmac_chan_write(atchan, reg, value) writel((value), (atchan)->ch_regs + (reg))
+#define at_xdmac_chan_read(atchan, reg) readl_relaxed((atchan)->ch_regs + (reg))
+#define at_xdmac_chan_write(atchan, reg, value) writel_relaxed((value), (atchan)->ch_regs + (reg))
 
 static inline struct at_xdmac_chan *to_at_xdmac_chan(struct dma_chan *dchan)
 {
-- 
2.0.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
