From: Kim Phillips <kim.phillips@freescale.com>
Subject: Re: [PATCH v4 3/4] dtc/libfdt: introduce fdt types for
 annotation by endian checkers
Date: Wed, 28 Nov 2012 17:33:01 -0600
Message-ID: <20121128173301.2b52b22a39fe6c3ce5a088fb@freescale.com>
References: <E1TYeB5-0003oB-IS@jdl.com>
	<1352941199-19393-1-git-send-email-kim.phillips@freescale.com>
	<1352941199-19393-3-git-send-email-kim.phillips@freescale.com>
	<20121115044340.GI32290@truffula.fritz.box>
	<20121114231204.8f19082c7acc1cea2a2d794f@freescale.com>
	<20121119023039.GK5735@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <20121119023039.GK5735@truffula.fritz.box>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: David Gibson <david@gibson.dropbear.id.au>
Cc: u-boot@lists.denx.de, jdl@jdl.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Projects such as linux and u-boot run sparse on libfdt.  libfdt
contains the notion of endianness via usage of endian conversion
functions such as fdt32_to_cpu.  As such, in order to pass endian
checks, libfdt has to annotate its fdt variables such that sparse
can warn when mixing bitwise and regular integers.  This patch adds
these new fdtXX_t types and, ifdef __CHECKER__ (a symbol sparse
defines), includes the bitwise annotation.

Signed-off-by: Kim Phillips <kim.phillips@freescale.com>

---
v2:
adds bitwise awareness: determine host endianness manually, and
annotate swabs with __force in fdtXX_to_cpu and cpu_to_fdtXX
conversion functions (the inline endian condition checks are
optimized out at compile time).  This allows us to be able to check
libfdt bitwise conversions with sparse by building dtc with make
CC=cgcc. v2 also moves fdt32 definitions from fdt.h to libfdt_env.h
and changes fdt32 definitions to use __bitwise instead of __be32. No
separate _FDT_SPARSE was introduced because there's no need: using
__CHECKER__ directly is valid because it only occurs once, and in
libfdt_env.h.
In addition, the libfdt sparse fixes have been moved to a subsequent
patch.

v3:  address comments from jdl:
o single set of fdt typedefs, since __bitwise is not defined if !CHECKER
o re-work EXTRACT_BYTE to take 'x' as a parameter, not a global
o SWAB function macros converted to take lowercase 'x' as a parameter,
  not a global

v4:  address comments from David Gibson
o rename byte swap routines CPU_TO_FDTXX
o properly define fdt<->cpu conversion routines
  to use CPU_TO_FDTXX macros with correct checker attributions.

 libfdt/fdt.h        | 42 +++++++++++++++++++++---------------------
 libfdt/libfdt_env.h | 53 ++++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 63 insertions(+), 32 deletions(-)

diff --git a/libfdt/fdt.h b/libfdt/fdt.h
index 48ccfd9..45dd134 100644
--- a/libfdt/fdt.h
+++ b/libfdt/fdt.h
@@ -4,45 +4,45 @@
 #ifndef __ASSEMBLY__
 
 struct fdt_header {
-	uint32_t magic;			 /* magic word FDT_MAGIC */
-	uint32_t totalsize;		 /* total size of DT block */
-	uint32_t off_dt_struct;		 /* offset to structure */
-	uint32_t off_dt_strings;	 /* offset to strings */
-	uint32_t off_mem_rsvmap;	 /* offset to memory reserve map */
-	uint32_t version;		 /* format version */
-	uint32_t last_comp_version;	 /* last compatible version */
+	fdt32_t magic;			 /* magic word FDT_MAGIC */
+	fdt32_t totalsize;		 /* total size of DT block */
+	fdt32_t off_dt_struct;		 /* offset to structure */
+	fdt32_t off_dt_strings;		 /* offset to strings */
+	fdt32_t off_mem_rsvmap;		 /* offset to memory reserve map */
+	fdt32_t version;		 /* format version */
+	fdt32_t last_comp_version;	 /* last compatible version */
 
 	/* version 2 fields below */
-	uint32_t boot_cpuid_phys;	 /* Which physical CPU id we're
+	fdt32_t boot_cpuid_phys;	 /* Which physical CPU id we're
 					    booting on */
 	/* version 3 fields below */
-	uint32_t size_dt_strings;	 /* size of the strings block */
+	fdt32_t size_dt_strings;	 /* size of the strings block */
 
 	/* version 17 fields below */
-	uint32_t size_dt_struct;	 /* size of the structure block */
+	fdt32_t size_dt_struct;		 /* size of the structure block */
 };
 
 struct fdt_reserve_entry {
-	uint64_t address;
-	uint64_t size;
+	fdt64_t address;
+	fdt64_t size;
 };
 
 struct fdt_node_header {
-	uint32_t tag;
+	fdt32_t tag;
 	char name[0];
 };
 
 struct fdt_property {
-	uint32_t tag;
-	uint32_t len;
-	uint32_t nameoff;
+	fdt32_t tag;
+	fdt32_t len;
+	fdt32_t nameoff;
 	char data[0];
 };
 
 #endif /* !__ASSEMBLY */
 
 #define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
-#define FDT_TAGSIZE	sizeof(uint32_t)
+#define FDT_TAGSIZE	sizeof(fdt32_t)
 
 #define FDT_BEGIN_NODE	0x1		/* Start node: full name */
 #define FDT_END_NODE	0x2		/* End node */
@@ -51,10 +51,10 @@ struct fdt_property {
 #define FDT_NOP		0x4		/* nop */
 #define FDT_END		0x9
 
-#define FDT_V1_SIZE	(7*sizeof(uint32_t))
-#define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(uint32_t))
-#define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(uint32_t))
+#define FDT_V1_SIZE	(7*sizeof(fdt32_t))
+#define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
+#define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
 #define FDT_V16_SIZE	FDT_V3_SIZE
-#define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(uint32_t))
+#define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
 
 #endif /* _FDT_H */
diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index 213d7fb..956b4ae 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -5,25 +5,56 @@
 #include <stdint.h>
 #include <string.h>
 
-#define EXTRACT_BYTE(n)	((unsigned long long)((uint8_t *)&x)[n])
-static inline uint16_t fdt16_to_cpu(uint16_t x)
+#ifdef __CHECKER__
+#define __force __attribute__((force))
+#define __bitwise __attribute__((bitwise))
+#else
+#define __force
+#define __bitwise
+#endif
+
+typedef uint16_t __bitwise fdt16_t;
+typedef uint32_t __bitwise fdt32_t;
+typedef uint64_t __bitwise fdt64_t;
+
+#define EXTRACT_BYTE(x, n)	((unsigned long long)((uint8_t *)&x)[n])
+#define CPU_TO_FDT16(x) ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
+#define CPU_TO_FDT32(x) ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, 1) << 16) | \
+			 (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
+#define CPU_TO_FDT64(x) ((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, 1) << 48) | \
+			 (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
+			 (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
+			 (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
+
+static inline uint16_t fdt16_to_cpu(fdt16_t x)
+{
+	return (__force uint16_t)CPU_TO_FDT16(x);
+}
+static inline fdt16_t cpu_to_fdt16(uint16_t x)
 {
-	return (EXTRACT_BYTE(0) << 8) | EXTRACT_BYTE(1);
+	return (__force fdt16_t)CPU_TO_FDT16(x);
 }
-#define cpu_to_fdt16(x) fdt16_to_cpu(x)
 
-static inline uint32_t fdt32_to_cpu(uint32_t x)
+static inline uint32_t fdt32_to_cpu(fdt32_t x)
 {
-	return (EXTRACT_BYTE(0) << 24) | (EXTRACT_BYTE(1) << 16) | (EXTRACT_BYTE(2) << 8) | EXTRACT_BYTE(3);
+	return (__force uint32_t)CPU_TO_FDT32(x);
+}
+static inline fdt32_t cpu_to_fdt32(uint32_t x)
+{
+	return (__force fdt32_t)CPU_TO_FDT32(x);
 }
-#define cpu_to_fdt32(x) fdt32_to_cpu(x)
 
-static inline uint64_t fdt64_to_cpu(uint64_t x)
+static inline uint64_t fdt64_to_cpu(fdt64_t x)
+{
+	return (__force uint64_t)CPU_TO_FDT64(x);
+}
+static inline fdt64_t cpu_to_fdt64(uint64_t x)
 {
-	return (EXTRACT_BYTE(0) << 56) | (EXTRACT_BYTE(1) << 48) | (EXTRACT_BYTE(2) << 40) | (EXTRACT_BYTE(3) << 32)
-		| (EXTRACT_BYTE(4) << 24) | (EXTRACT_BYTE(5) << 16) | (EXTRACT_BYTE(6) << 8) | EXTRACT_BYTE(7);
+	return (__force fdt64_t)CPU_TO_FDT64(x);
 }
-#define cpu_to_fdt64(x) fdt64_to_cpu(x)
+#undef CPU_TO_FDT64
+#undef CPU_TO_FDT32
+#undef CPU_TO_FDT16
 #undef EXTRACT_BYTE
 
 #endif /* _LIBFDT_ENV_H */
-- 
1.8.0.1
