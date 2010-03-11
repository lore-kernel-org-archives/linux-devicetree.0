From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 1/2] arch/powerpc: Move dma_mask from of_device into
	pdev_archdata
Date: Thu, 11 Mar 2010 11:12:24 -0700
Message-ID: <20100311181223.13022.28668.stgit@angua>
References: <20100311180952.13022.82694.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100311180952.13022.82694.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

By moving dma_mask into pdev_archdata, and adding archdata to
struct of_device, it makes it possible to substitute of_device
with struct platform_device, which is a stepping stone to
removing the of_platform bus entirely.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/powerpc/include/asm/device.h    |    1 +
 arch/powerpc/include/asm/of_device.h |    2 +-
 arch/powerpc/kernel/of_device.c      |    2 +-
 arch/powerpc/kernel/of_platform.c    |    2 +-
 drivers/macintosh/macio_asic.c       |    4 ++--
 sound/aoa/soundbus/i2sbus/core.c     |    4 ++--
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/device.h b/arch/powerpc/include/asm/device.h
index 3d6ff0a..17dd2b6 100644
--- a/arch/powerpc/include/asm/device.h
+++ b/arch/powerpc/include/asm/device.h
@@ -37,6 +37,7 @@ struct dev_archdata {
 };
 
 struct pdev_archdata {
+	u64 dma_mask;
 };
 
 #endif /* _ASM_POWERPC_DEVICE_H */
diff --git a/arch/powerpc/include/asm/of_device.h b/arch/powerpc/include/asm/of_device.h
index 8b26f96..444e97e 100644
--- a/arch/powerpc/include/asm/of_device.h
+++ b/arch/powerpc/include/asm/of_device.h
@@ -12,8 +12,8 @@
  */
 struct of_device
 {
-	u64			dma_mask;	/* DMA mask */
 	struct device		dev;		/* Generic device interface */
+	struct pdev_archdata	archdata;
 };
 
 extern struct of_device *of_device_alloc(struct device_node *np,
diff --git a/arch/powerpc/kernel/of_device.c b/arch/powerpc/kernel/of_device.c
index 20b3474..df78e02 100644
--- a/arch/powerpc/kernel/of_device.c
+++ b/arch/powerpc/kernel/of_device.c
@@ -70,7 +70,7 @@ struct of_device *of_device_alloc(struct device_node *np,
 		return NULL;
 
 	dev->dev.of_node = of_node_get(np);
-	dev->dev.dma_mask = &dev->dma_mask;
+	dev->dev.dma_mask = &dev->archdata.dma_mask;
 	dev->dev.parent = parent;
 	dev->dev.release = of_release_dev;
 
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index 5a5f624..e047126 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -75,7 +75,7 @@ struct of_device* of_platform_device_create(struct device_node *np,
 	if (!dev)
 		return NULL;
 
-	dev->dma_mask = 0xffffffffUL;
+	dev->archdata.dma_mask = 0xffffffffUL;
 	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 
 	dev->dev.bus = &of_platform_bus_type;
diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index 67fe13f..48a5f04 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -374,8 +374,8 @@ static struct macio_dev * macio_add_one_device(struct macio_chip *chip,
 	dev->bus = &chip->lbus;
 	dev->media_bay = in_bay;
 	dev->ofdev.dev.of_node = np;
-	dev->ofdev.dma_mask = 0xffffffffUL;
-	dev->ofdev.dev.dma_mask = &dev->ofdev.dma_mask;
+	dev->ofdev.archdata.dma_mask = 0xffffffffUL;
+	dev->ofdev.dev.dma_mask = &dev->ofdev.archdata.dma_mask;
 	dev->ofdev.dev.parent = parent;
 	dev->ofdev.dev.bus = &macio_bus_type;
 	dev->ofdev.dev.release = macio_release_dev;
diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
index ddb1577..eebdde4 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -220,9 +220,9 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 
 	mutex_init(&dev->lock);
 	spin_lock_init(&dev->low_lock);
-	dev->sound.ofdev.dma_mask = macio->ofdev.dma_mask;
+	dev->sound.ofdev.archdata.dma_mask = macio->ofdev.archdata.dma_mask;
 	dev->sound.ofdev.dev.of_node = np;
-	dev->sound.ofdev.dev.dma_mask = &dev->sound.ofdev.dma_mask;
+	dev->sound.ofdev.dev.dma_mask = &dev->sound.ofdev.archdata.dma_mask;
 	dev->sound.ofdev.dev.parent = &macio->ofdev.dev;
 	dev->sound.ofdev.dev.release = i2sbus_release_dev;
 	dev->sound.attach_codec = i2sbus_attach_codec;
