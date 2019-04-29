From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] soc: renesas: Enable RZ/A1 IRQC on RZ/A1H
Date: Mon, 29 Apr 2019 11:36:29 +0200
Message-ID: <20190429093631.10799-4-geert+renesas@glider.be>
References: <20190429093631.10799-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429093631.10799-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Auto-enable the RZ/A1 Interrupt Controller when configuring a kernel
with support for RZ/A1H SoCs.

This is similar to how interrupt controllers for other Renesas SoCs are
enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 68bfca6f20ddf8a7..1448b6dbcdb20bae 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -57,6 +57,7 @@ config ARCH_R7S72100
 	bool "RZ/A1H (R7S72100)"
 	select PM
 	select PM_GENERIC_DOMAINS
+	select RENESAS_RZA1_IRQC
 	select SYS_SUPPORTS_SH_MTU2
 	select RENESAS_OSTM
 
-- 
2.17.1
