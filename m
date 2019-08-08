From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH RESEND v7 2/3] fdt: add support for rng-seed
Date: Fri,  9 Aug 2019 01:38:05 +0800
Message-ID: <20190808173803.1146-3-hsinyi@chromium.org>
References: <20190808173803.1146-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808173803.1146-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

Introducing a chosen node, rng-seed, which is an entropy that can be
passed to kernel called very early to increase initial device
randomness. Bootloader should provide this entropy and the value is
read from /chosen/rng-seed in DT.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 drivers/of/fdt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 9cdf14b9aaab..640c817cf65b 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -24,6 +24,7 @@
 #include <linux/debugfs.h>
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
+#include <linux/random.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -1044,6 +1045,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 {
 	int l;
 	const char *p;
+	const void *rng_seed;
 
 	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
 
@@ -1078,6 +1080,14 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	pr_debug("Command line is: %s\n", (char*)data);
 
+	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
+	if (rng_seed && l > 0) {
+		add_device_randomness(rng_seed, l);
+
+		/* try to clear seed so it won't be found. */
+		fdt_nop_property(initial_boot_params, node, "rng-seed");
+	}
+
 	/* break now */
 	return 1;
 }
-- 
2.20.1
