From: Grant Likely <grant.likely@secretlab.ca>
Subject: [PATCH 2/2] arch/microblaze: Move dma_mask from of_device into
	pdev_archdata
Date: Thu, 11 Mar 2010 11:12:30 -0700
Message-ID: <20100311181229.13022.81026.stgit@angua>
References: <20100311180952.13022.82694.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20100311180952.13022.82694.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: monstr@monstr.eu, benh@kernel.crashing.org, sfr@canb.auug.org.au, jeremy.kerr@canonical.com, microblaze-uclinux@itee.uq.edu.au, linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

By moving dma_mask into pdev_archdata, and adding archdata to
struct of_device, it makes it possible to substitute of_device
with struct platform_device, which is a stepping stone to
removing the of_platform bus entirely.

Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
---

 arch/microblaze/include/asm/device.h    |    1 +
 arch/microblaze/include/asm/of_device.h |    2 +-
 arch/microblaze/kernel/of_device.c      |    2 +-
 arch/microblaze/kernel/of_platform.c    |    2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/microblaze/include/asm/device.h b/arch/microblaze/include/asm/device.h
index 8d46822..aae3b3c 100644
--- a/arch/microblaze/include/asm/device.h
+++ b/arch/microblaze/include/asm/device.h
@@ -15,6 +15,7 @@ struct dev_archdata {
 };
 
 struct pdev_archdata {
+	u64 dma_mask;
 };
 
 #endif /* _ASM_MICROBLAZE_DEVICE_H */
diff --git a/arch/microblaze/include/asm/of_device.h b/arch/microblaze/include/asm/of_device.h
index ab25a40..73cb980 100644
--- a/arch/microblaze/include/asm/of_device.h
+++ b/arch/microblaze/include/asm/of_device.h
@@ -21,8 +21,8 @@
  * probed using OF properties.
  */
 struct of_device {
-	u64			dma_mask; /* DMA mask */
 	struct device		dev; /* Generic device interface */
+	struct pdev_archdata	archdata;
 };
 
 extern ssize_t of_device_get_modalias(struct of_device *ofdev,
diff --git a/arch/microblaze/kernel/of_device.c b/arch/microblaze/kernel/of_device.c
index ac7e6e1..b372787 100644
--- a/arch/microblaze/kernel/of_device.c
+++ b/arch/microblaze/kernel/of_device.c
@@ -50,7 +50,7 @@ struct of_device *of_device_alloc(struct device_node *np,
 		return NULL;
 
 	dev->dev.of_node = of_node_get(np);
-	dev->dev.dma_mask = &dev->dma_mask;
+	dev->dev.dma_mask = &dev->archdata.dma_mask;
 	dev->dev.parent = parent;
 	dev->dev.release = of_release_dev;
 
diff --git a/arch/microblaze/kernel/of_platform.c b/arch/microblaze/kernel/of_platform.c
index ea7d024..f96a3a6 100644
--- a/arch/microblaze/kernel/of_platform.c
+++ b/arch/microblaze/kernel/of_platform.c
@@ -48,7 +48,7 @@ struct of_device *of_platform_device_create(struct device_node *np,
 	if (!dev)
 		return NULL;
 
-	dev->dma_mask = 0xffffffffUL;
+	dev->archdata.dma_mask = 0xffffffffUL;
 	dev->dev.bus = &of_platform_bus_type;
 
 	/* We do not fill the DMA ops for platform devices by default.
