From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 02/12] of: merge phandle, ihandle and struct property
Date: Tue, 06 Oct 2009 22:30:22 -0600
Message-ID: <20091007043015.16890.5220.stgit__46499.0928223871$1254889964$gmane$org@angua>
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

Merge of common code duplicated between Sparc, PowerPC and Microblaze

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/microblaze/include/asm/prom.h |   10 ----------
 arch/powerpc/include/asm/prom.h    |   12 ------------
 arch/sparc/include/asm/prom.h      |   12 ------------
 include/linux/of.h                 |   12 ++++++++++++
 4 files changed, 12 insertions(+), 34 deletions(-)

diff --git a/arch/microblaze/include/asm/prom.h b/arch/microblaze/include/asm/prom.h
index 6636889..11cb484 100644
--- a/arch/microblaze/include/asm/prom.h
+++ b/arch/microblaze/include/asm/prom.h
@@ -73,16 +73,6 @@ struct boot_param_header {
 	u32	dt_struct_size; /* size of the DT structure block */
 };
 
-typedef u32 phandle;
-typedef u32 ihandle;
-
-struct property {
-	char	*name;
-	int	length;
-	void	*value;
-	struct property *next;
-};
-
 struct device_node {
 	const char *name;
 	const char *type;
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index b0a84ea..c236326 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -71,18 +71,6 @@ struct boot_param_header
 	u32	dt_struct_size;		/* size of the DT structure block */
 };
 
-
-
-typedef u32 phandle;
-typedef u32 ihandle;
-
-struct property {
-	char	*name;
-	int	length;
-	void	*value;
-	struct property *next;
-};
-
 struct device_node {
 	const char *name;
 	const char *type;
diff --git a/arch/sparc/include/asm/prom.h b/arch/sparc/include/asm/prom.h
index 0733170..b34f988 100644
--- a/arch/sparc/include/asm/prom.h
+++ b/arch/sparc/include/asm/prom.h
@@ -29,18 +29,6 @@
 #define of_prop_cmp(s1, s2)		strcasecmp((s1), (s2))
 #define of_node_cmp(s1, s2)		strcmp((s1), (s2))
 
-typedef u32 phandle;
-typedef u32 ihandle;
-
-struct property {
-	char	*name;
-	int	length;
-	void	*value;
-	struct property *next;
-	unsigned long _flags;
-	unsigned int unique_id;
-};
-
 struct of_irq_controller;
 struct device_node {
 	const char	*name;
diff --git a/include/linux/of.h b/include/linux/of.h
index 7be2d10..4668b29 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -19,6 +19,18 @@
 #include <linux/bitops.h>
 #include <linux/mod_devicetable.h>
 
+typedef u32 phandle;
+typedef u32 ihandle;
+
+struct property {
+	char	*name;
+	int	length;
+	void	*value;
+	struct property *next;
+	unsigned long _flags;
+	unsigned int unique_id;
+};
+
 #include <asm/prom.h>
 
 /* flag descriptions */
