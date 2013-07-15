From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RESEND PATCH v7 12/22] bus: mvebu-mbus: Remove the no longer used
 name-based API
Date: Mon, 15 Jul 2013 11:57:41 -0300
Message-ID: <1373900271-4722-13-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1373900271-4722-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373900271-4722-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Now that every user of the deprecated name-based API has been
converted to using the ID-based API, let's remove the former one.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/bus/mvebu-mbus.c | 38 --------------------------------------
 include/linux/mbus.h     |  5 -----
 2 files changed, 43 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 5f0bfa3..9aee344 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -766,44 +766,6 @@ int mvebu_mbus_add_window_remap_by_id(unsigned int target,
 	return mvebu_mbus_alloc_window(s, base, size, remap, target, attribute);
 }
 
-int mvebu_mbus_add_window_remap_flags(const char *devname, phys_addr_t base,
-				      size_t size, phys_addr_t remap,
-				      unsigned int flags)
-{
-	struct mvebu_mbus_state *s = &mbus_state;
-	u8 target, attr;
-	int i;
-
-	if (!s->soc->map)
-		return -ENODEV;
-
-	for (i = 0; s->soc->map[i].name; i++)
-		if (!strcmp(s->soc->map[i].name, devname))
-			break;
-
-	if (!s->soc->map[i].name) {
-		pr_err("unknown device '%s'\n", devname);
-		return -ENODEV;
-	}
-
-	target = s->soc->map[i].target;
-	attr   = s->soc->map[i].attr;
-
-	if (flags == MVEBU_MBUS_PCI_MEM)
-		attr |= 0x8;
-	else if (flags == MVEBU_MBUS_PCI_WA)
-		attr |= 0x28;
-
-	return mvebu_mbus_add_window_remap_by_id(target, attr, base,
-						 size, remap);
-}
-
-int mvebu_mbus_add_window(const char *devname, phys_addr_t base, size_t size)
-{
-	return mvebu_mbus_add_window_remap_flags(devname, base, size,
-						 MVEBU_MBUS_NO_REMAP, 0);
-}
-
 int mvebu_mbus_add_window_by_id(unsigned int target, unsigned int attribute,
 				phys_addr_t base, size_t size)
 {
diff --git a/include/linux/mbus.h b/include/linux/mbus.h
index 650bc15..345b8c5 100644
--- a/include/linux/mbus.h
+++ b/include/linux/mbus.h
@@ -63,15 +63,10 @@ static inline const struct mbus_dram_target_info *mv_mbus_dram_info(void)
 
 void mvebu_mbus_get_pcie_mem_aperture(struct resource *res);
 void mvebu_mbus_get_pcie_io_aperture(struct resource *res);
-int mvebu_mbus_add_window_remap_flags(const char *devname, phys_addr_t base,
-				      size_t size, phys_addr_t remap,
-				      unsigned int flags);
 int mvebu_mbus_add_window_remap_by_id(unsigned int target,
 				      unsigned int attribute,
 				      phys_addr_t base, size_t size,
 				      phys_addr_t remap);
-int mvebu_mbus_add_window(const char *devname, phys_addr_t base,
-			  size_t size);
 int mvebu_mbus_add_window_by_id(unsigned int target, unsigned int attribute,
 				phys_addr_t base, size_t size);
 int mvebu_mbus_del_window(phys_addr_t base, size_t size);
-- 
1.8.1.5
