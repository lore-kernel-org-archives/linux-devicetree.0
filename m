From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC PATCH 06/12] of: merge struct boot_param_header from Microblaze
	and PowerPC
Date: Tue, 06 Oct 2009 22:31:12 -0600
Message-ID: <20091007043104.16890.73844.stgit__17964.0323076912$1254890160$gmane$org@angua>
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

Merge common code for working with Flattened Device Tree data structure

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/microblaze/include/asm/prom.h |   30 ------------------------------
 arch/powerpc/include/asm/prom.h    |   31 -------------------------------
 include/linux/of_fdt.h             |   30 ++++++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 61 deletions(-)

diff --git a/arch/microblaze/include/asm/prom.h b/arch/microblaze/include/asm/prom.h
index 5f461f0..dfc4afc 100644
--- a/arch/microblaze/include/asm/prom.h
+++ b/arch/microblaze/include/asm/prom.h
@@ -33,36 +33,6 @@
 #define of_prop_cmp(s1, s2)		strcmp((s1), (s2))
 #define of_node_cmp(s1, s2)		strcasecmp((s1), (s2))
 
-/*
- * This is what gets passed to the kernel by prom_init or kexec
- *
- * The dt struct contains the device tree structure, full pathes and
- * property contents. The dt strings contain a separate block with just
- * the strings for the property names, and is fully page aligned and
- * self contained in a page, so that it can be kept around by the kernel,
- * each property name appears only once in this page (cheap compression)
- *
- * the mem_rsvmap contains a map of reserved ranges of physical memory,
- * passing it here instead of in the device-tree itself greatly simplifies
- * the job of everybody. It's just a list of u64 pairs (base/size) that
- * ends when size is 0
- */
-struct boot_param_header {
-	u32	magic; /* magic word OF_DT_HEADER */
-	u32	totalsize; /* total size of DT block */
-	u32	off_dt_struct; /* offset to structure */
-	u32	off_dt_strings; /* offset to strings */
-	u32	off_mem_rsvmap; /* offset to memory reserve map */
-	u32	version; /* format version */
-	u32	last_comp_version; /* last compatible version */
-	/* version 2 fields below */
-	u32	boot_cpuid_phys; /* Physical CPU id we're booting on */
-	/* version 3 fields below */
-	u32	dt_strings_size; /* size of the DT strings block */
-	/* version 17 fields below */
-	u32	dt_struct_size; /* size of the DT structure block */
-};
-
 extern struct device_node *of_chosen;
 
 static inline int of_node_check_flag(struct device_node *n, unsigned long flag)
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 7181f8a..ef20e6c 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -30,37 +30,6 @@
 #define of_prop_cmp(s1, s2)		strcmp((s1), (s2))
 #define of_node_cmp(s1, s2)		strcasecmp((s1), (s2))
 
-/*
- * This is what gets passed to the kernel by prom_init or kexec
- *
- * The dt struct contains the device tree structure, full pathes and
- * property contents. The dt strings contain a separate block with just
- * the strings for the property names, and is fully page aligned and
- * self contained in a page, so that it can be kept around by the kernel,
- * each property name appears only once in this page (cheap compression)
- *
- * the mem_rsvmap contains a map of reserved ranges of physical memory,
- * passing it here instead of in the device-tree itself greatly simplifies
- * the job of everybody. It's just a list of u64 pairs (base/size) that
- * ends when size is 0
- */
-struct boot_param_header
-{
-	u32	magic;			/* magic word OF_DT_HEADER */
-	u32	totalsize;		/* total size of DT block */
-	u32	off_dt_struct;		/* offset to structure */
-	u32	off_dt_strings;		/* offset to strings */
-	u32	off_mem_rsvmap;		/* offset to memory reserve map */
-	u32	version;		/* format version */
-	u32	last_comp_version;	/* last compatible version */
-	/* version 2 fields below */
-	u32	boot_cpuid_phys;	/* Physical CPU id we're booting on */
-	/* version 3 fields below */
-	u32	dt_strings_size;	/* size of the DT strings block */
-	/* version 17 fields below */
-	u32	dt_struct_size;		/* size of the DT structure block */
-};
-
 extern struct device_node *of_chosen;
 
 static inline int of_node_check_flag(struct device_node *n, unsigned long flag)
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index f81d3f8..8b87bcb 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -27,4 +27,34 @@
 
 #define OF_DT_VERSION		0x10
 
+/*
+ * This is what gets passed to the kernel by prom_init or kexec
+ *
+ * The dt struct contains the device tree structure, full pathes and
+ * property contents. The dt strings contain a separate block with just
+ * the strings for the property names, and is fully page aligned and
+ * self contained in a page, so that it can be kept around by the kernel,
+ * each property name appears only once in this page (cheap compression)
+ *
+ * the mem_rsvmap contains a map of reserved ranges of physical memory,
+ * passing it here instead of in the device-tree itself greatly simplifies
+ * the job of everybody. It's just a list of u64 pairs (base/size) that
+ * ends when size is 0
+ */
+struct boot_param_header {
+	u32	magic;			/* magic word OF_DT_HEADER */
+	u32	totalsize;		/* total size of DT block */
+	u32	off_dt_struct;		/* offset to structure */
+	u32	off_dt_strings;		/* offset to strings */
+	u32	off_mem_rsvmap;		/* offset to memory reserve map */
+	u32	version;		/* format version */
+	u32	last_comp_version;	/* last compatible version */
+	/* version 2 fields below */
+	u32	boot_cpuid_phys;	/* Physical CPU id we're booting on */
+	/* version 3 fields below */
+	u32	dt_strings_size;	/* size of the DT strings block */
+	/* version 17 fields below */
+	u32	dt_struct_size;		/* size of the DT structure block */
+};
+
 #endif /* _LINUX_OF_FDT_H */
