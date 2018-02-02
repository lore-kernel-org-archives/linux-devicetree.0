From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 02/11] soc: renesas: rcar-rst: add R8A77980 support
Date: Fri, 2 Feb 2018 21:27:01 +0300
Message-ID: <76b4144e-423a-65fd-fe17-bfedbc0deb8e@cogentembedded.com>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Add support for R-Car V3H (R8A77980) to the R-Car RST driver -- this driver
is  needed  for the clock driver to work.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/reset/renesas,rst.txt |    1 +
 drivers/soc/renesas/Kconfig                             |    2 +-
 drivers/soc/renesas/rcar-rst.c                          |    1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

Index: renesas/Documentation/devicetree/bindings/reset/renesas,rst.txt
===================================================================
--- renesas.orig/Documentation/devicetree/bindings/reset/renesas,rst.txt
+++ renesas/Documentation/devicetree/bindings/reset/renesas,rst.txt
@@ -27,6 +27,7 @@ Required properties:
 		  - "renesas,r8a7795-rst" (R-Car H3)
 		  - "renesas,r8a7796-rst" (R-Car M3-W)
 		  - "renesas,r8a77970-rst" (R-Car V3M)
+		  - "renesas,r8a77980-rst" (R-Car V3H)
 		  - "renesas,r8a77995-rst" (R-Car D3)
   - reg: Address start and address range for the device.
 
Index: renesas/drivers/soc/renesas/Kconfig
===================================================================
--- renesas.orig/drivers/soc/renesas/Kconfig
+++ renesas/drivers/soc/renesas/Kconfig
@@ -4,7 +4,7 @@ config SOC_RENESAS
 	select SOC_BUS
 	select RST_RCAR if ARCH_RCAR_GEN1 || ARCH_RCAR_GEN2 || \
 			   ARCH_R8A7795 || ARCH_R8A7796 || ARCH_R8A77970 || \
-			   ARCH_R8A77995
+			   ARCH_R8A77980 || ARCH_R8A77995
 	select SYSC_R8A7743 if ARCH_R8A7743
 	select SYSC_R8A7745 if ARCH_R8A7745
 	select SYSC_R8A7779 if ARCH_R8A7779
Index: renesas/drivers/soc/renesas/rcar-rst.c
===================================================================
--- renesas.orig/drivers/soc/renesas/rcar-rst.c
+++ renesas/drivers/soc/renesas/rcar-rst.c
@@ -42,6 +42,7 @@ static const struct of_device_id rcar_rs
 	{ .compatible = "renesas,r8a7795-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a7796-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a77970-rst", .data = &rcar_rst_gen2 },
+	{ .compatible = "renesas,r8a77980-rst", .data = &rcar_rst_gen2 },
 	{ .compatible = "renesas,r8a77995-rst", .data = &rcar_rst_gen2 },
 	{ /* sentinel */ }
 };
