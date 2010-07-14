From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 3/3] of: Remove unused of_find_device_by_phandle()
Date: Wed, 14 Jul 2010 17:31:41 -0600
Message-ID: <20100714233141.21887.81866.stgit@angua>
References: <20100714233130.21887.73872.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100714233130.21887.73872.stgit@angua>
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
Cc: jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 arch/microblaze/include/asm/of_platform.h |    2 --
 arch/microblaze/kernel/of_platform.c      |   18 ------------------
 arch/powerpc/include/asm/of_platform.h    |    2 --
 arch/powerpc/kernel/of_platform.c         |   19 -------------------
 4 files changed, 0 insertions(+), 41 deletions(-)

diff --git a/arch/microblaze/include/asm/of_platform.h b/arch/microblaze/include/asm/of_platform.h
index 625003f..353d8f6 100644
--- a/arch/microblaze/include/asm/of_platform.h
+++ b/arch/microblaze/include/asm/of_platform.h
@@ -14,8 +14,6 @@
 /* This is just here during the transition */
 #include <linux/of_platform.h>
 
-extern struct of_device *of_find_device_by_phandle(phandle ph);
-
 extern void of_instantiate_rtc(void);
 
 #endif /* _ASM_MICROBLAZE_OF_PLATFORM_H */
diff --git a/arch/microblaze/kernel/of_platform.c b/arch/microblaze/kernel/of_platform.c
index 33212bb..80c9c49 100644
--- a/arch/microblaze/kernel/of_platform.c
+++ b/arch/microblaze/kernel/of_platform.c
@@ -63,21 +63,3 @@ struct of_device *of_find_device_by_node(struct device_node *np)
 	return NULL;
 }
 EXPORT_SYMBOL(of_find_device_by_node);
-
-static int of_dev_phandle_match(struct device *dev, void *data)
-{
-	phandle *ph = data;
-	return to_of_device(dev)->dev.of_node->phandle == *ph;
-}
-
-struct of_device *of_find_device_by_phandle(phandle ph)
-{
-	struct device *dev;
-
-	dev = bus_find_device(&platform_bus_type,
-			      NULL, &ph, of_dev_phandle_match);
-	if (dev)
-		return to_of_device(dev);
-	return NULL;
-}
-EXPORT_SYMBOL(of_find_device_by_phandle);
diff --git a/arch/powerpc/include/asm/of_platform.h b/arch/powerpc/include/asm/of_platform.h
index b37d2dc..d506aa6 100644
--- a/arch/powerpc/include/asm/of_platform.h
+++ b/arch/powerpc/include/asm/of_platform.h
@@ -11,8 +11,6 @@
  *
  */
 
-extern struct of_device *of_find_device_by_phandle(phandle ph);
-
 extern void of_instantiate_rtc(void);
 
 #endif	/* _ASM_POWERPC_OF_PLATFORM_H */
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index a3d7154..b093d4b 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -68,25 +68,6 @@ struct of_device *of_find_device_by_node(struct device_node *np)
 }
 EXPORT_SYMBOL(of_find_device_by_node);
 
-static int of_dev_phandle_match(struct device *dev, void *data)
-{
-	phandle *ph = data;
-	return to_of_device(dev)->dev.of_node->phandle == *ph;
-}
-
-struct of_device *of_find_device_by_phandle(phandle ph)
-{
-	struct device *dev;
-
-	dev = bus_find_device(&platform_bus_type,
-			      NULL, &ph, of_dev_phandle_match);
-	if (dev)
-		return to_of_device(dev);
-	return NULL;
-}
-EXPORT_SYMBOL(of_find_device_by_phandle);
-
-
 #ifdef CONFIG_PPC_OF_PLATFORM_PCI
 
 /* The probing of PCI controllers from of_platform is currently
