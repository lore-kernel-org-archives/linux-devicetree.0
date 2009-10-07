From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 07/12] of: merge of_node_*_flag() and set_node_proc_entry()
Date: Tue, 06 Oct 2009 22:31:24 -0600
Message-ID: <20091007043117.16890.91667.stgit__12293.8341730789$1254890208$gmane$org@angua>
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

Merge common code between PowerPC and Microblaze

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/microblaze/include/asm/prom.h |   16 ----------------
 arch/powerpc/include/asm/prom.h    |   17 -----------------
 include/linux/of.h                 |   16 ++++++++++++++++
 3 files changed, 16 insertions(+), 33 deletions(-)

diff --git a/arch/microblaze/include/asm/prom.h b/arch/microblaze/include/asm/prom.h
index dfc4afc..180d844 100644
--- a/arch/microblaze/include/asm/prom.h
+++ b/arch/microblaze/include/asm/prom.h
@@ -35,24 +35,8 @@
 
 extern struct device_node *of_chosen;
 
-static inline int of_node_check_flag(struct device_node *n, unsigned long flag)
-{
-	return test_bit(flag, &n->_flags);
-}
-
-static inline void of_node_set_flag(struct device_node *n, unsigned long flag)
-{
-	set_bit(flag, &n->_flags);
-}
-
 #define HAVE_ARCH_DEVTREE_FIXUPS
 
-static inline void set_node_proc_entry(struct device_node *dn,
-					struct proc_dir_entry *de)
-{
-	dn->pde = de;
-}
-
 extern struct device_node *allnodes;	/* temporary while merging */
 extern rwlock_t devtree_lock;	/* temporary while merging */
 
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index ef20e6c..2cfd432 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -32,25 +32,8 @@
 
 extern struct device_node *of_chosen;
 
-static inline int of_node_check_flag(struct device_node *n, unsigned long flag)
-{
-	return test_bit(flag, &n->_flags);
-}
-
-static inline void of_node_set_flag(struct device_node *n, unsigned long flag)
-{
-	set_bit(flag, &n->_flags);
-}
-
-
 #define HAVE_ARCH_DEVTREE_FIXUPS
 
-static inline void set_node_proc_entry(struct device_node *dn, struct proc_dir_entry *de)
-{
-	dn->pde = de;
-}
-
-
 extern struct device_node *of_find_all_nodes(struct device_node *prev);
 extern struct device_node *of_node_get(struct device_node *node);
 extern void of_node_put(struct device_node *node);
diff --git a/include/linux/of.h b/include/linux/of.h
index a66c1eb..d5f6662 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -63,6 +63,22 @@ struct device_node {
 #endif
 };
 
+static inline int of_node_check_flag(struct device_node *n, unsigned long flag)
+{
+	return test_bit(flag, &n->_flags);
+}
+
+static inline void of_node_set_flag(struct device_node *n, unsigned long flag)
+{
+	set_bit(flag, &n->_flags);
+}
+
+static inline void
+set_node_proc_entry(struct device_node *dn, struct proc_dir_entry *de)
+{
+	dn->pde = de;
+}
+
 #include <asm/prom.h>
 
 /* flag descriptions */
