From: nixiaoming <nixiaoming@huawei.com>
Subject: [PATCH] scripts/dtc: Fixed format mismatch in fprintf
Date: Thu, 24 May 2018 10:50:18 +0800
Message-ID: <20180524025018.73187-1-nixiaoming@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, nixiaoming@huawei.com
List-Id: devicetree@vger.kernel.org

format specifier "d" need arg type "int" , but the according arg
"fdt32_to_cpu(xxx)" has type "unsigned int"

Signed-off-by: nixiaoming <nixiaoming@huawei.com>
---
 scripts/dtc/fdtdump.c  | 6 +++---
 scripts/dtc/flattree.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/dtc/fdtdump.c b/scripts/dtc/fdtdump.c
index 7d460a5..851bb6f 100644
--- a/scripts/dtc/fdtdump.c
+++ b/scripts/dtc/fdtdump.c
@@ -66,12 +66,12 @@ static void dump_blob(void *blob)
 
 	printf("/dts-v1/;\n");
 	printf("// magic:\t\t0x%x\n", fdt32_to_cpu(bph->magic));
-	printf("// totalsize:\t\t0x%x (%d)\n", totalsize, totalsize);
+	printf("// totalsize:\t\t0x%x (%u)\n", totalsize, totalsize);
 	printf("// off_dt_struct:\t0x%x\n", off_dt);
 	printf("// off_dt_strings:\t0x%x\n", off_str);
 	printf("// off_mem_rsvmap:\t0x%x\n", off_mem_rsvmap);
-	printf("// version:\t\t%d\n", version);
-	printf("// last_comp_version:\t%d\n",
+	printf("// version:\t\t%u\n", version);
+	printf("// last_comp_version:\t%u\n",
 	       fdt32_to_cpu(bph->last_comp_version));
 	if (version >= 2)
 		printf("// boot_cpuid_phys:\t0x%x\n",
diff --git a/scripts/dtc/flattree.c b/scripts/dtc/flattree.c
index 8d268fb..28da281 100644
--- a/scripts/dtc/flattree.c
+++ b/scripts/dtc/flattree.c
@@ -393,7 +393,7 @@ void dt_to_blob(FILE *f, struct dt_info *dti, int version)
 			padlen = 0;
 			if (quiet < 1)
 				fprintf(stderr,
-					"Warning: blob size %d >= minimum size %d\n",
+					"Warning: blob size %u >= minimum size %d\n",
 					fdt32_to_cpu(fdt.totalsize), minsize);
 		}
 	}
-- 
2.10.1
