From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 08/12] of: merge of_read_number() an of_read_ulong()
Date: Tue, 06 Oct 2009 22:31:37 -0600
Message-ID: <20091007043129.16890.85758.stgit__31964.3852687024$1254890250$gmane$org@angua>
References: <20091007041007.16890.62194.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20091007041007.16890.62194.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, microblaze-uclinux
List-Id: devicetree@vger.kernel.org

Merge common code between Microblaze and PowerPC

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/microblaze/include/asm/prom.h |   12 ------------
 arch/powerpc/include/asm/prom.h    |   20 --------------------
 include/linux/of.h                 |   23 +++++++++++++++++++++++
 3 files changed, 23 insertions(+), 32 deletions(-)

diff --git a/arch/microblaze/include/asm/prom.h b/arch/microblaze/include/asm/prom.h
index 180d844..d4f57ff 100644
--- a/arch/microblaze/include/asm/prom.h
+++ b/arch/microblaze/include/asm/prom.h
@@ -82,18 +82,6 @@ extern int release_OF_resource(struct device_node *node, int index);
  * OF address retreival & translation
  */
 
-/* Helper to read a big number; size is in cells (not bytes) */
-static inline u64 of_read_number(const u32 *cell, int size)
-{
-	u64 r = 0;
-	while (size--)
-		r = (r << 32) | *(cell++);
-	return r;
-}
-
-/* Like of_read_number, but we want an unsigned long result */
-#define of_read_ulong(cell, size)	of_read_number(cell, size)
-
 /* Translate an OF address block into a CPU physical address
  */
 extern u64 of_translate_address(struct device_node *np, const u32 *addr);
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 2cfd432..d8c0525 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -89,26 +89,6 @@ extern int release_OF_resource(struct device_node* node, int index);
  * OF address retreival & translation
  */
 
-
-/* Helper to read a big number; size is in cells (not bytes) */
-static inline u64 of_read_number(const u32 *cell, int size)
-{
-	u64 r = 0;
-	while (size--)
-		r = (r << 32) | *(cell++);
-	return r;
-}
-
-/* Like of_read_number, but we want an unsigned long result */
-#ifdef CONFIG_PPC32
-static inline unsigned long of_read_ulong(const u32 *cell, int size)
-{
-	return cell[size-1];
-}
-#else
-#define of_read_ulong(cell, size)	of_read_number(cell, size)
-#endif
-
 /* Translate an OF address block into a CPU physical address
  */
 extern u64 of_translate_address(struct device_node *np, const u32 *addr);
diff --git a/include/linux/of.h b/include/linux/of.h
index d5f6662..18e4379 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -79,6 +79,29 @@ set_node_proc_entry(struct device_node *dn, struct proc_dir_entry *de)
 	dn->pde = de;
 }
 
+/*
+ * OF address retreival & translation
+ */
+
+/* Helper to read a big number; size is in cells (not bytes) */
+static inline u64 of_read_number(const u32 *cell, int size)
+{
+	u64 r = 0;
+	while (size--)
+		r = (r << 32) | *(cell++);
+	return r;
+}
+
+/* Like of_read_number, but we want an unsigned long result */
+#ifdef CONFIG_PPC32
+static inline unsigned long of_read_ulong(const u32 *cell, int size)
+{
+	return cell[size-1];
+}
+#else
+#define of_read_ulong(cell, size)	of_read_number(cell, size)
+#endif
+
 #include <asm/prom.h>
 
 /* flag descriptions */
