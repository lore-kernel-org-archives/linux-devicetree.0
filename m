From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v3 1/3] include/of_fdt.h: add a weak arch hook to update fdt pgprot
Date: Thu, 16 May 2019 18:28:15 +0800
Message-ID: <20190516102817.188519-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Chintan Pandya <cpandya@codeaurora.org>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@ch>
List-Id: devicetree@vger.kernel.org

Does nothing as default, arch can implement their function to map
fdt to RO/RW. This is convenient if arch map fdt to RO during init
but needs to write fdt in some special cases after that.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/of/fdt.c       | 13 +++++++++++++
 include/linux/of_fdt.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index de893c9616a1..e84971d1e9ea 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -30,6 +30,19 @@
 
 #include "of_private.h"
 
+/*
+ * update_fdt_pgprot - Arch hook for changing fdt pgprot
+ *
+ * @prot: page protection flags for fdt
+ *
+ * Architecture can implement this function if they want to chagne
+ * fdt page protection flags before or after doing modification and
+ * fixups to fdt.
+ *
+ * Default does nothing.
+ */
+__weak void update_fdt_pgprot(pgprot_t prot) {}
+
 /*
  * of_fdt_limit_memory - limit the number of regions in the /memory node
  * @limit: maximum entries
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index a713e5d156d8..406c3e7b2b75 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -109,5 +109,7 @@ static inline void unflatten_device_tree(void) {}
 static inline void unflatten_and_copy_device_tree(void) {}
 #endif /* CONFIG_OF_EARLY_FLATTREE */
 
+extern void update_fdt_pgprot(pgprot_t prot);
+
 #endif /* __ASSEMBLY__ */
 #endif /* _LINUX_OF_FDT_H */
-- 
2.20.1
