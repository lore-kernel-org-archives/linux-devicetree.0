From: Laura Abbott <lauraa@codeaurora.org>
Subject: [PATCH v2] of: Set the DMA mask to 64 bits when dma_addr_t is 64-bits
Date: Fri, 26 Apr 2013 11:06:05 -0700
Message-ID: <1366999565-19498-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robherring2@gmail.com>
Cc: Laura Abbott <lauraa@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Currently, of_platform_device_create_pdata always sets the
coherent DMA mask to 32 bits. On ARM systems without CONFIG_ZONE_DMA,
arm_dma_limit gets set to ~0 or 0xFFFFFFFFFFFFFFFF on LPAE based
systems. Since arm_dma_limit represents the smallest dma_mask
on the system, the default of 32 bits prevents any dma_coherent
allocation from succeeding unless clients manually set the
dma mask first. Rather than make every client on an LPAE system set
the mask, set the mask to a 64 bit value on systems with 64-bit
dma addresses.

Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
---
 drivers/of/platform.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 0970505..c669ab4 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -214,7 +214,11 @@ struct platform_device *of_platform_device_create_pdata(
 #if defined(CONFIG_MICROBLAZE)
 	dev->archdata.dma_mask = 0xffffffffUL;
 #endif
+#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
+	dev->dev.coherent_dma_mask = DMA_BIT_MASK(64);
+#else
 	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
+#endif
 	dev->dev.bus = &platform_bus_type;
 	dev->dev.platform_data = platform_data;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
