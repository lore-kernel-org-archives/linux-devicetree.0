From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v3 3/3] fdt: add support for rng-seed
Date: Thu, 16 May 2019 18:28:17 +0800
Message-ID: <20190516102817.188519-3-hsinyi@chromium.org>
References: <20190516102817.188519-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516102817.188519-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Chintan Pandya <cpandya@codeaurora.org>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@ch>
List-Id: devicetree@vger.kernel.org

Introducing a chosen node, rng-seed, which is an entropy that can be
passed to kernel called very early to increase initial device
randomness. Bootloader should provide this entropy and the value is
read from /chosen/rng-seed in DT.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
change v2->v3:
1. use arch hook for fdt pgprot change
2. handle CONFIG_KEXEC
---
 Documentation/devicetree/bindings/chosen.txt | 14 +++++
 drivers/of/fdt.c                             | 55 ++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 45e79172a646..fef5c82672dc 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -28,6 +28,20 @@ mode) when EFI_RNG_PROTOCOL is supported, it will be overwritten by
 the Linux EFI stub (which will populate the property itself, using
 EFI_RNG_PROTOCOL).
 
+rng-seed
+-----------
+
+This property served as an entropy to add device randomness. It is parsed
+as a byte array, e.g.
+
+/ {
+	chosen {
+		rng-seed = <0x31 0x95 0x1b 0x3c 0xc9 0xfa 0xb3 ...>;
+	};
+};
+
+This random value should be provided by bootloader.
+
 stdout-path
 -----------
 
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index e84971d1e9ea..e9862657268d 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -10,6 +10,7 @@
 
 #include <linux/crc32.h>
 #include <linux/kernel.h>
+#include <linux/kexec.h>
 #include <linux/initrd.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
@@ -24,6 +25,8 @@
 #include <linux/debugfs.h>
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
+#include <linux/random.h>
+#include <linux/reboot.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -1087,11 +1090,14 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 	return 0;
 }
 
+int rng_seed_size;
+
 int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 				     int depth, void *data)
 {
 	int l;
 	const char *p;
+	const void *rng_seed;
 
 	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
 
@@ -1126,6 +1132,16 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	pr_debug("Command line is: %s\n", (char*)data);
 
+	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &rng_seed_size);
+	if (rng_seed && rng_seed_size > 0) {
+		add_device_randomness(rng_seed, rng_seed_size);
+
+		/* try to clear seed so it won't be found. */
+		update_fdt_pgprot(PAGE_KERNEL);
+		fdt_delprop(initial_boot_params, node, "rng-seed");
+		update_fdt_pgprot(PAGE_KERNEL_RO);
+	}
+
 	/* break now */
 	return 1;
 }
@@ -1327,4 +1343,43 @@ static int __init of_fdt_raw_init(void)
 late_initcall(of_fdt_raw_init);
 #endif
 
+#ifdef CONFIG_KEXEC
+static int update_fdt_random_seed(struct notifier_block *nb,
+				  unsigned long code, void *unused)
+{
+	int node;
+	void *rng_seed;
+
+	if (!kexec_in_progress || !rng_seed_size)
+		return NOTIFY_DONE;
+
+	node = fdt_path_offset(initial_boot_params, "/chosen");
+	if (node < 0)
+		node = fdt_path_offset(initial_boot_params, "/chosen@0");
+	if (node < 0)
+		return NOTIFY_DONE;
+
+	rng_seed = kmalloc(rng_seed_size, GFP_ATOMIC);
+	get_random_bytes(rng_seed, rng_seed_size);
+
+	update_fdt_pgprot(PAGE_KERNEL);
+	fdt_setprop(initial_boot_params, node, "rng-seed", rng_seed,
+			rng_seed_size);
+
+	kfree(rng_seed);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block fdt_random_seed_nb = {
+	.notifier_call = update_fdt_random_seed,
+};
+
+static int register_update_fdt_random_seed(void)
+{
+	return register_reboot_notifier(&fdt_random_seed_nb);
+}
+late_initcall(register_update_fdt_random_seed);
+#endif
+
 #endif /* CONFIG_OF_EARLY_FLATTREE */
-- 
2.20.1
