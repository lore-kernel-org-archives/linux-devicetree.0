From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH] arm64: add support for rng-seed
Date: Tue,  7 May 2019 12:54:33 +0800
Message-ID: <20190507045433.542-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Frank Rowand <frowand.list@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

Introducing a chosen node, rng-seed, which is an 64 bytes entropy
that can be passed to kernel called very early to increase device
randomness. Bootloader should provide this entropy and the value is
read from /chosen/rng-seed in DT.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

---
 Documentation/devicetree/bindings/chosen.txt | 14 +++++++++
 arch/arm64/kernel/setup.c                    |  2 ++
 drivers/of/fdt.c                             | 33 ++++++++++++++++++++
 include/linux/of_fdt.h                       |  1 +
 4 files changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 45e79172a646..bfd360691650 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -28,6 +28,20 @@ mode) when EFI_RNG_PROTOCOL is supported, it will be overwritten by
 the Linux EFI stub (which will populate the property itself, using
 EFI_RNG_PROTOCOL).
 
+rng-seed
+-----------
+
+This property served as an entropy to add device randomness. It is parsed
+as a 64 byte value, e.g.
+
+/ {
+	chosen {
+		rng-seed = <0x31951b3c 0xc9fab3a5 0xffdf1660 ...>
+	};
+};
+
+This random value should be provided by bootloader.
+
 stdout-path
 -----------
 
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 413d566405d1..ade4261516dd 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -292,6 +292,8 @@ void __init setup_arch(char **cmdline_p)
 	early_fixmap_init();
 	early_ioremap_init();
 
+	early_init_dt_rng_seed(__fdt_pointer);
+
 	setup_machine_fdt(__fdt_pointer);
 
 	parse_early_param();
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index de893c9616a1..74e2c0c80b91 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/libfdt.h>
 #include <linux/debugfs.h>
+#include <linux/random.h>
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
 
@@ -1117,6 +1118,38 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 	return 1;
 }
 
+extern void *__init __fixmap_remap_fdt(phys_addr_t dt_phys, int *size,
+				       pgprot_t prot);
+
+void __init early_init_dt_rng_seed(u64 dt_phys)
+{
+	void *fdt;
+	int node, size, i;
+	fdt64_t *prop;
+	u64 rng_seed[8];
+
+	fdt = __fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL);
+	if (!fdt)
+		return;
+
+	node = fdt_path_offset(fdt, "/chosen");
+	if (node < 0)
+		return;
+
+	prop = fdt_getprop_w(fdt, node, "rng-seed", &size);
+	if (!prop || size != sizeof(u64) * 8)
+		return;
+
+	for (i = 0; i < 8; i++) {
+		rng_seed[i] = fdt64_to_cpu(*(prop + i));
+		/* clear seed so it won't be found. */
+		*(prop + i) = 0;
+	}
+	add_device_randomness(rng_seed, size);
+
+	return;
+}
+
 #ifndef MIN_MEMBLOCK_ADDR
 #define MIN_MEMBLOCK_ADDR	__pa(PAGE_OFFSET)
 #endif
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index a713e5d156d8..a4548dd6351e 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -71,6 +71,7 @@ extern uint32_t of_get_flat_dt_phandle(unsigned long node);
 
 extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
 				     int depth, void *data);
+extern void early_init_dt_rng_seed(u64 dt_phys);
 extern int early_init_dt_scan_memory(unsigned long node, const char *uname,
 				     int depth, void *data);
 extern int early_init_dt_scan_chosen_stdout(void);
-- 
2.20.1
