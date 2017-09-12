From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 01/11] soc: renesas: identify R-Car V3M
Date: Tue, 12 Sep 2017 23:37:17 +0300
Message-ID: <20170912210506.997827638@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline; filename=soc-renesas-identify-R-Car-V3M.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add support for identifying the R-Car V3M (R8A77970) SoC.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/soc/renesas/renesas-soc.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: renesas/drivers/soc/renesas/renesas-soc.c
===================================================================
--- renesas.orig/drivers/soc/renesas/renesas-soc.c
+++ renesas/drivers/soc/renesas/renesas-soc.c
@@ -144,6 +144,11 @@ static const struct renesas_soc soc_rcar
 	.id	= 0x52,
 };
 
+static const struct renesas_soc soc_rcar_v3m __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x54,
+};
+
 static const struct renesas_soc soc_rcar_d3 __initconst __maybe_unused = {
 	.family	= &fam_rcar_gen3,
 	.id	= 0x58,
@@ -204,6 +209,9 @@ static const struct of_device_id renesas
 #ifdef CONFIG_ARCH_R8A7796
 	{ .compatible = "renesas,r8a7796",	.data = &soc_rcar_m3_w },
 #endif
+#ifdef CONFIG_ARCH_R8A77970
+	{ .compatible = "renesas,r8a77970",	.data = &soc_rcar_v3m },
+#endif
 #ifdef CONFIG_ARCH_R8A77995
 	{ .compatible = "renesas,r8a77995",	.data = &soc_rcar_d3 },
 #endif
