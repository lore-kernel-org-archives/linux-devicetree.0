From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH v3 6/6] arm: mach-artpec: add entry to MAINTAINERS
Date: Thu, 11 Feb 2016 17:06:21 +0100
Message-ID: <164f1c0049b0e1564e133a293ea18920019e3328.1455205057.git.larper@axis.com>
References: <cover.1455205057.git.larper@axis.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1455205057.git.larper@axis.com>
In-Reply-To: <cover.1455205057.git.larper@axis.com>
References: <cover.1455205057.git.larper@axis.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>, Jesper Nilsson <jespern@axis.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lars Persson <larper@axis.com>
Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f1fa4f..d32c1aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -932,6 +932,16 @@ M:	Tsahee Zidenberg <tsahee@annapurnalabs.com>
 S:	Maintained
 F:	arch/arm/mach-alpine/
 
+ARM/ARTPEC MACHINE SUPPORT
+M:	Jesper Nilsson <jesper.nilsson@axis.com>
+M:	Lars Persson <lars.persson@axis.com>
+M:	Niklas Cassel <niklas.cassel@axis.com>
+S:	Maintained
+L:	linux-arm-kernel@axis.com
+F:	arch/arm/mach-artpec
+F:	arch/arm/boot/dts/artpec6*
+F:	drivers/clk/clk-artpec6.c
+
 ARM/ATMEL AT91RM9200, AT91SAM9 AND SAMA5 SOC SUPPORT
 M:	Nicolas Ferre <nicolas.ferre@atmel.com>
 M:	Alexandre Belloni <alexandre.belloni@free-electrons.com>
-- 
2.1.4
