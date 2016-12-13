From: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Subject: [PATCH 2/9] dmaengine: stm32-dma: Fix typo in Kconfig
Date: Tue, 13 Dec 2016 14:40:44 +0100
Message-ID: <1481636451-27863-3-git-send-email-cedric.madianga@gmail.com>
References: <1481636451-27863-1-git-send-email-cedric.madianga@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481636451-27863-1-git-send-email-cedric.madianga@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, robh+dt@kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
List-Id: devicetree@vger.kernel.org

As STM32 DMA driver is only used as buit-in driver, it couldn't be used as
module.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Reviewed-by: Ludovic BARRE <ludovic.barre@st.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 263495d..96da57a 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -458,7 +458,7 @@ config STM32_DMA
 	help
 	  Enable support for the on-chip DMA controller on STMicroelectronics
 	  STM32 MCUs.
-	  If you have a board based on such a MCU and wish to use DMA say Y or M
+	  If you have a board based on such a MCU and wish to use DMA say Y
 	  here.
 
 config S3C24XX_DMAC
-- 
1.9.1
