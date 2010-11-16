From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 7/7] OF: set dma_mask for ARM
Date: Tue, 16 Nov 2010 14:33:55 -0600
Message-ID: <1289939635-30742-8-git-send-email-robherring2@gmail.com>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1289939635-30742-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Various drivers require dma_mask to be valid, so it needs to be setup
when doing OF probing on ARM.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 drivers/of/platform.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 5b4a07f..fe2669a 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -614,7 +614,7 @@ struct platform_device *of_device_alloc(struct device_node *np,
 	}
 
 	dev->dev.of_node = of_node_get(np);
-#if defined(CONFIG_PPC) || defined(CONFIG_MICROBLAZE)
+#if defined(CONFIG_PPC) || defined(CONFIG_MICROBLAZE) || defined(CONFIG_ARM)
 	dev->dev.dma_mask = &dev->archdata.dma_mask;
 #endif
 	dev->dev.parent = parent;
@@ -644,7 +644,7 @@ struct platform_device *of_platform_device_create(struct device_node *np,
 	if (!dev)
 		return NULL;
 
-#if defined(CONFIG_PPC) || defined(CONFIG_MICROBLAZE)
+#if defined(CONFIG_PPC) || defined(CONFIG_MICROBLAZE) || defined(CONFIG_ARM)
 	dev->archdata.dma_mask = 0xffffffffUL;
 #endif
 	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-- 
1.7.1
