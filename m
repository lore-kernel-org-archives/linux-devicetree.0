From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v2 1/2] fdt: add support for rng-seed
Date: Mon, 13 May 2019 08:38:18 +0800
Message-ID: <20190513003819.356-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, boot-architecture@lists.linaro.org, Michal Hocko <mhocko@suse.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Stephen Boyd <swboyd@chromium.org>, Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Andrew Murray <andrew.murray@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Introducing a chosen node, rng-seed, which is an entropy that can be
passed to kernel called very early to increase initial device
randomness. Bootloader should provide this entropy and the value is
read from /chosen/rng-seed in DT.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
change log:
v1->v2:
* call function in early_init_dt_scan_chosen
* will add doc to devicetree-org/dt-schema on github if this is accepted
---
 Documentation/devicetree/bindings/chosen.txt | 14 ++++++++++++++
 drivers/of/fdt.c                             | 11 +++++++++++
 2 files changed, 25 insertions(+)

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
index de893c9616a1..96ea5eba9dd5 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -24,6 +24,7 @@
 #include <linux/debugfs.h>
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
+#include <linux/random.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -1079,6 +1080,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 {
 	int l;
 	const char *p;
+	const void *rng_seed;
 
 	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
 
@@ -1113,6 +1115,15 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	pr_debug("Command line is: %s\n", (char*)data);
 
+	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
+	if (!rng_seed || l == 0)
+		return 1;
+
+	/* try to clear seed so it won't be found. */
+        fdt_nop_property(initial_boot_params, node, "rng-seed");
+
+        add_device_randomness(rng_seed, l);
+
 	/* break now */
 	return 1;
 }
-- 
2.20.1
