Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}
Date: Tue, 15 May 2018 21:07:39 +0900
Message-Id: <1526386059-6173-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526386059-6173-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526386059-6173-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds workaround for 3DG-{A,B} of R-Car E3 ES1.0 because
the SoC has a restriction about the order.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/r8a77990-sysc.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/r8a77990-sysc.c b/drivers/soc/renesas/r8a77990-sysc.c
index a8c6417..15579eb 100644
--- a/drivers/soc/renesas/r8a77990-sysc.c
+++ b/drivers/soc/renesas/r8a77990-sysc.c
@@ -7,12 +7,13 @@
 
 #include <linux/bug.h>
 #include <linux/kernel.h>
+#include <linux/sys_soc.h>
 
 #include <dt-bindings/power/r8a77990-sysc.h>
 
 #include "rcar-sysc.h"
 
-static const struct rcar_sysc_area r8a77990_areas[] __initconst = {
+static struct rcar_sysc_area r8a77990_areas[] __initdata = {
 	{ "always-on",	    0, 0, R8A77990_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
 	{ "ca53-scu",	0x140, 0, R8A77990_PD_CA53_SCU,  R8A77990_PD_ALWAYS_ON,
 	  PD_SCU },
@@ -27,7 +28,41 @@
 	{ "3dg-b",	0x100, 1, R8A77990_PD_3DG_B,	R8A77990_PD_3DG_A },
 };
 
+static void __init rcar_sysc_fix_parent(struct rcar_sysc_area *areas,
+					unsigned int num_areas, u8 id,
+					int new_parent)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_areas; i++)
+		if (areas[i].isr_bit == id) {
+			areas[i].parent = new_parent;
+			return;
+		}
+}
+
+/* Fixups for R-Car E3 ES1.0 revision */
+static const struct soc_device_attribute r8a77990[] __initconst = {
+	{ .soc_id = "r8a77990", .revision = "ES1.0" },
+	{ /* sentinel */ }
+};
+
+static int __init r8a77990_sysc_init(void)
+{
+	if (soc_device_match(r8a77990)) {
+		rcar_sysc_fix_parent(r8a77990_areas,
+				     ARRAY_SIZE(r8a77990_areas),
+				     R8A77990_PD_3DG_A, R8A77990_PD_3DG_B);
+		rcar_sysc_fix_parent(r8a77990_areas,
+				     ARRAY_SIZE(r8a77990_areas),
+				     R8A77990_PD_3DG_B, R8A77990_PD_ALWAYS_ON);
+	}
+
+	return 0;
+}
+
 const struct rcar_sysc_info r8a77990_sysc_info __initconst = {
+	.init = r8a77990_sysc_init,
 	.areas = r8a77990_areas,
 	.num_areas = ARRAY_SIZE(r8a77990_areas),
 };
-- 
1.9.1
