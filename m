From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of: fdt: fix memory range check
Date: Tue, 23 Sep 2014 10:59:09 +0100
Message-ID: <1411466349-14166-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In cases where board has below memory DT node

memory{
	device_type = "memory";
	reg = <0x80000000 0x80000000>;
};

Check on the memory range in fdt.c will always fail because it is
comparing MAX_PHYS_ADDR with base + size, in fact it should compare
it with base + size - 1.

This issue was originally noticed on Qualcomm IFC6410 board.
Without this patch kernel shows up noticed unnecessary warnings

[    0.000000] Machine model: Qualcomm APQ8064/IFC6410
[    0.000000] Ignoring memory range 0xffffffff - 0x100000000
[    0.000000] cma: Reserved 64 MiB at ab800000

as a result the size get reduced to 0x7fffffff which looks wrong.

This patch fixes the check involved in generating this warning and
as a result it also fixes the wrong size calculation.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 79cb831..3f5736c 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -937,7 +937,7 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
 		return;
 	}
 
-	if (base + size > MAX_PHYS_ADDR) {
+	if (base + size - 1 > MAX_PHYS_ADDR) {
 		pr_warning("Ignoring memory range 0x%lx - 0x%llx\n",
 				ULONG_MAX, base + size);
 		size = MAX_PHYS_ADDR - base;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
