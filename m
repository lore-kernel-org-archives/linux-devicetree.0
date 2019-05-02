From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 3/5] soc: renesas: Enable RZ/A1 IRQC on RZ/A1H and RZ/A2M
Date: Thu,  2 May 2019 14:32:18 +0200
Message-ID: <20190502123220.3016-4-geert+renesas@glider.be>
References: <20190502123220.3016-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502123220.3016-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Auto-enable support for the RZ/A1 Interrupt Controller when configuring
a kernel which supports RZ/A1H or RZ/A2M SoCs.
Keep selects sorted while at it.

This is similar to how interrupt controllers for other Renesas SoCs are
enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v3:
  - No changes,

v2:
  - Add Reviewed-by,
  - Add RZ/A2M,
  - Sort RZ/A1H selects.
---
 drivers/soc/renesas/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 68bfca6f20ddf8a7..2bbf49e5d441808b 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -57,14 +57,16 @@ config ARCH_R7S72100
 	bool "RZ/A1H (R7S72100)"
 	select PM
 	select PM_GENERIC_DOMAINS
-	select SYS_SUPPORTS_SH_MTU2
 	select RENESAS_OSTM
+	select RENESAS_RZA1_IRQC
+	select SYS_SUPPORTS_SH_MTU2
 
 config ARCH_R7S9210
 	bool "RZ/A2 (R7S9210)"
 	select PM
 	select PM_GENERIC_DOMAINS
 	select RENESAS_OSTM
+	select RENESAS_RZA1_IRQC
 
 config ARCH_R8A73A4
 	bool "R-Mobile APE6 (R8A73A40)"
-- 
2.17.1
