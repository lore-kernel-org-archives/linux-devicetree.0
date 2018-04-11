Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/4] soc: renesas: rcar-rst: Add support for R-Car E3
Date: Wed, 11 Apr 2018 18:36:26 +0900
Message-Id: <1523439386-1032-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds definition of reset vector for the R8A77990 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[shimoda: rebase]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
 drivers/soc/renesas/Kconfig                             | 3 ++-
 drivers/soc/renesas/rcar-rst.c                          | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
index 7be61ef..67e83b0 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.txt
@@ -30,6 +30,7 @@ Required properties:
 		  - "renesas,r8a77965-rst" (R-Car M3-N)
 		  - "renesas,r8a77970-rst" (R-Car V3M)
 		  - "renesas,r8a77980-rst" (R-Car V3H)
+		  - "renesas,r8a77990-rst" (R-Car E3)
 		  - "renesas,r8a77995-rst" (R-Car D3)
   - reg: Address start and address range for the device.
 
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 36bec60..1d824cb 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -4,7 +4,8 @@ config SOC_RENESAS
 	select SOC_BUS
 	select RST_RCAR if ARCH_RCAR_GEN1 || ARCH_RCAR_GEN2 || \
 			   ARCH_R8A7795 || ARCH_R8A7796 || ARCH_R8A77965 || \
-			   ARCH_R8A77970 || ARCH_R8A77980 || ARCH_R8A77995
+			   ARCH_R8A77970 || ARCH_R8A77980 || ARCH_R8A77990 || \
+			   ARCH_R8A77995
 	select SYSC_R8A7743 if ARCH_R8A7743
 	select SYSC_R8A7745 if ARCH_R8A7745
 	select SYSC_R8A77470 if ARCH_R8A77470
diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 66d7dba..d9c1034 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -60,6 +60,7 @@ struct rst_config {
 	{ .compatible = "renesas,r8a77965-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77970-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77980-rst", .data = &rcar_rst_gen3 },
+	{ .compatible = "renesas,r8a77990-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77995-rst", .data = &rcar_rst_gen3 },
 	{ /* sentinel */ }
 };
-- 
1.9.1
