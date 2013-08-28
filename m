From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [PATCH 8/9] ARM: at91/dt: add new at91rm9200ek_mmc board
Date: Wed, 28 Aug 2013 14:37:36 +0200
Message-ID: <1377693456-11133-1-git-send-email-b.brezillon@overkiz.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Joachim Eastwood <manabian@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

Add a new at91rm9200ek_mmc board (based on at91rm9200ek board) which enables
mmc0/slot0.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 arch/arm/boot/dts/at91rm9200ek_mmc.dts |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 arch/arm/boot/dts/at91rm9200ek_mmc.dts

diff --git a/arch/arm/boot/dts/at91rm9200ek_mmc.dts b/arch/arm/boot/dts/at91rm9200ek_mmc.dts
new file mode 100644
index 0000000..c87a861
--- /dev/null
+++ b/arch/arm/boot/dts/at91rm9200ek_mmc.dts
@@ -0,0 +1,23 @@
+/*
+ * at91rm9200ek.dts - Device Tree file for Atmel AT91RM9200 evaluation kit with
+ *                    an MMC slot
+ *
+ *  Copyright (C) 2013 Boris BREZILLON <b.brezillon@overkiz.com>
+ *
+ * Licensed under GPLv2 only
+ */
+/dts-v1/;
+#include "at91rm9200ek.dts"
+
+/ {
+	model = "Atmel AT91RM9200 evaluation kit with MMC slot";
+	compatible = "atmel,at91rm9200ek-mmc", "atmel,at91rm9200ek", "atmel,at91rm9200";
+
+	ahb {
+		apb {
+			mmc0: mmc@fffb4000 {
+				status = "okay";
+			};
+		};
+	};
+};
-- 
1.7.9.5
