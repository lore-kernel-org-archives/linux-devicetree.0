From: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Subject: [PATCH 2/5] Move of_drconf_cell struct definition to asm/prom.h
Date: Tue, 02 Oct 2012 21:56:11 -0500
Message-ID: <506BA94B.4030204@linux.vnet.ibm.com>
References: <506B2E63.5090900@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <506B2E63.5090900@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, cbe-oss-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This patch moves the definition of the of_drconf_cell struct to asm/prom.h 
to make it available for all powerpc/pseries code.

Signed-off-by: Nathan Fontenot <nfont@linux.vnet.ibm.com>

---
 arch/powerpc/include/asm/prom.h |   16 ++++++++++++++++
 arch/powerpc/mm/numa.c          |   12 ------------
 2 files changed, 16 insertions(+), 12 deletions(-)

Index: dt-next/arch/powerpc/mm/numa.c
===================================================================
--- dt-next.orig/arch/powerpc/mm/numa.c	2012-10-02 08:30:23.000000000 -0500
+++ dt-next/arch/powerpc/mm/numa.c	2012-10-02 08:41:42.000000000 -0500
@@ -397,18 +397,6 @@
 	return result;
 }
 
-struct of_drconf_cell {
-	u64	base_addr;
-	u32	drc_index;
-	u32	reserved;
-	u32	aa_index;
-	u32	flags;
-};
-
-#define DRCONF_MEM_ASSIGNED	0x00000008
-#define DRCONF_MEM_AI_INVALID	0x00000040
-#define DRCONF_MEM_RESERVED	0x00000080
-
 /*
  * Read the next memblock list entry from the ibm,dynamic-memory property
  * and return the information in the provided of_drconf_cell structure.
Index: dt-next/arch/powerpc/include/asm/prom.h
===================================================================
--- dt-next.orig/arch/powerpc/include/asm/prom.h	2011-11-17 09:12:07.000000000 -0600
+++ dt-next/arch/powerpc/include/asm/prom.h	2012-10-02 08:41:42.000000000 -0500
@@ -58,6 +58,22 @@
 
 extern void of_instantiate_rtc(void);
 
+/* The of_drconf_cell struct defines the layout of the LMB array
+ * specified in the device tree property
+ * ibm,dynamic-reconfiguration-memory/ibm,dynamic-memory
+ */
+struct of_drconf_cell {
+	u64	base_addr;
+	u32	drc_index;
+	u32	reserved;
+	u32	aa_index;
+	u32	flags;
+};
+
+#define DRCONF_MEM_ASSIGNED	0x00000008
+#define DRCONF_MEM_AI_INVALID	0x00000040
+#define DRCONF_MEM_RESERVED	0x00000080
+
 /* These includes are put at the bottom because they may contain things
  * that are overridden by this file.  Ideally they shouldn't be included
  * by this file, but there are a bunch of .c files that currently depend
