From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 02/22] bus: mvebu-mbus: Add new API for window creation
Date: Tue,  9 Jul 2013 13:41:04 -0300
Message-ID: <1373388084-29520-3-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1373388084-29520-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373388084-29520-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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

We add an API to create MBus address decoding windows from the target
ID and attribute. This function will be used later and deprecate the
current name based scheme.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/bus/mvebu-mbus.c | 33 +++++++++++++++++++++++++--------
 include/linux/mbus.h     |  6 ++++++
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 33c6947..827468a 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -748,6 +748,22 @@ static const struct of_device_id of_mvebu_mbus_ids[] = {
 /*
  * Public API of the driver
  */
+int mvebu_mbus_add_window_remap_by_id(unsigned int target,
+				      unsigned int attribute,
+				      phys_addr_t base, size_t size,
+				      phys_addr_t remap)
+{
+	struct mvebu_mbus_state *s = &mbus_state;
+
+	if (!mvebu_mbus_window_conflicts(s, base, size, target, attribute)) {
+		pr_err("cannot add window '%x:%x', conflicts with another window\n",
+		       target, attribute);
+		return -EINVAL;
+	}
+
+	return mvebu_mbus_alloc_window(s, base, size, remap, target, attribute);
+}
+
 int mvebu_mbus_add_window_remap_flags(const char *devname, phys_addr_t base,
 				      size_t size, phys_addr_t remap,
 				      unsigned int flags)
@@ -776,14 +792,8 @@ int mvebu_mbus_add_window_remap_flags(const char *devname, phys_addr_t base,
 	else if (flags == MVEBU_MBUS_PCI_WA)
 		attr |= 0x28;
 
-	if (!mvebu_mbus_window_conflicts(s, base, size, target, attr)) {
-		pr_err("cannot add window '%s', conflicts with another window\n",
-		       devname);
-		return -EINVAL;
-	}
-
-	return mvebu_mbus_alloc_window(s, base, size, remap, target, attr);
-
+	return mvebu_mbus_add_window_remap_by_id(target, attr, base,
+						 size, remap);
 }
 
 int mvebu_mbus_add_window(const char *devname, phys_addr_t base, size_t size)
@@ -792,6 +802,13 @@ int mvebu_mbus_add_window(const char *devname, phys_addr_t base, size_t size)
 						 MVEBU_MBUS_NO_REMAP, 0);
 }
 
+int mvebu_mbus_add_window_by_id(unsigned int target, unsigned int attribute,
+				phys_addr_t base, size_t size)
+{
+	return mvebu_mbus_add_window_remap_by_id(target, attribute, base,
+						 size, MVEBU_MBUS_NO_REMAP);
+}
+
 int mvebu_mbus_del_window(phys_addr_t base, size_t size)
 {
 	int win;
diff --git a/include/linux/mbus.h b/include/linux/mbus.h
index dba482e..9245b66 100644
--- a/include/linux/mbus.h
+++ b/include/linux/mbus.h
@@ -62,8 +62,14 @@ static inline const struct mbus_dram_target_info *mv_mbus_dram_info(void)
 int mvebu_mbus_add_window_remap_flags(const char *devname, phys_addr_t base,
 				      size_t size, phys_addr_t remap,
 				      unsigned int flags);
+int mvebu_mbus_add_window_remap_by_id(unsigned int target,
+				      unsigned int attribute,
+				      phys_addr_t base, size_t size,
+				      phys_addr_t remap);
 int mvebu_mbus_add_window(const char *devname, phys_addr_t base,
 			  size_t size);
+int mvebu_mbus_add_window_by_id(unsigned int target, unsigned int attribute,
+				phys_addr_t base, size_t size);
 int mvebu_mbus_del_window(phys_addr_t base, size_t size);
 int mvebu_mbus_init(const char *soc, phys_addr_t mbus_phys_base,
 		    size_t mbus_size, phys_addr_t sdram_phys_base,
-- 
1.8.1.5
