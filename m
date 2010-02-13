From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 5/9] of: put default string compare and #a/s-cell values into
	common header
Date: Sat, 13 Feb 2010 09:02:53 -0700
Message-ID: <20100213160252.4767.94582.stgit__7193.36120314455$1266077220$gmane$org@angua>
References: <20100213154838.4767.83881.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100213154838.4767.83881.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, sparclinu
List-Id: devicetree@vger.kernel.org

Most architectures don't need to change these.  Put them into common
code to eliminate some duplication

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/microblaze/include/asm/prom.h |    7 -------
 arch/powerpc/include/asm/prom.h    |    7 -------
 include/linux/of.h                 |   13 +++++++++++++
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/microblaze/include/asm/prom.h b/arch/microblaze/include/asm/prom.h
index 6c6b386..ddc5c57 100644
--- a/arch/microblaze/include/asm/prom.h
+++ b/arch/microblaze/include/asm/prom.h
@@ -26,13 +26,6 @@
 #include <asm/irq.h>
 #include <asm/atomic.h>
 
-#define OF_ROOT_NODE_ADDR_CELLS_DEFAULT	1
-#define OF_ROOT_NODE_SIZE_CELLS_DEFAULT	1
-
-#define of_compat_cmp(s1, s2, l)	strncasecmp((s1), (s2), (l))
-#define of_prop_cmp(s1, s2)		strcmp((s1), (s2))
-#define of_node_cmp(s1, s2)		strcasecmp((s1), (s2))
-
 extern struct device_node *of_chosen;
 
 #define HAVE_ARCH_DEVTREE_FIXUPS
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index f384db8..4a5070e 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -23,13 +23,6 @@
 #include <asm/irq.h>
 #include <asm/atomic.h>
 
-#define OF_ROOT_NODE_ADDR_CELLS_DEFAULT	1
-#define OF_ROOT_NODE_SIZE_CELLS_DEFAULT	1
-
-#define of_compat_cmp(s1, s2, l)	strcasecmp((s1), (s2))
-#define of_prop_cmp(s1, s2)		strcmp((s1), (s2))
-#define of_node_cmp(s1, s2)		strcasecmp((s1), (s2))
-
 extern struct device_node *of_chosen;
 
 #define HAVE_ARCH_DEVTREE_FIXUPS
diff --git a/include/linux/of.h b/include/linux/of.h
index 48b0ee6..5cd2840 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -116,6 +116,19 @@ static inline unsigned long of_read_ulong(const __be32 *cell, int size)
 
 #include <asm/prom.h>
 
+/* Default #address and #size cells.  Allow arch asm/prom.h to override */
+#if !defined(OF_ROOT_NODE_ADDR_CELLS_DEFAULT)
+#define OF_ROOT_NODE_ADDR_CELLS_DEFAULT 1
+#define OF_ROOT_NODE_SIZE_CELLS_DEFAULT 1
+#endif
+
+/* Default string compare functions, Allow arch asm/prom.h to override */
+#if !defined(of_compat_cmp)
+#define of_compat_cmp(s1, s2, l)	strncasecmp((s1), (s2), (l))
+#define of_prop_cmp(s1, s2)		strcmp((s1), (s2))
+#define of_node_cmp(s1, s2)		strcasecmp((s1), (s2))
+#endif
+
 /* flag descriptions */
 #define OF_DYNAMIC	1 /* node and properties were allocated via kmalloc */
 #define OF_DETACHED	2 /* node has been detached from the device tree */
