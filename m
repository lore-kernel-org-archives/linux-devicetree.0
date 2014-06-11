From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v8 7/7] arm: mediatek: add dts for Aquaris5 mobile phone
Date: Wed, 11 Jun 2014 14:34:15 +0200
Message-ID: <1402490055-15197-8-git-send-email-matthias.bgg@gmail.com>
References: <1402490055-15197-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402490055-15197-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, grant.likely@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, soren.brinkmann@xilinx.com, shawn.guo@freescale.com, anders.berg@lsi.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Aquaris5 is a mobile phone based on the MT6589 SoC.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/mt6589-aquaris5.dts |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt6589-aquaris5.dts

diff --git a/arch/arm/boot/dts/mt6589-aquaris5.dts b/arch/arm/boot/dts/mt6589-aquaris5.dts
new file mode 100644
index 0000000..443b446
--- /dev/null
+++ b/arch/arm/boot/dts/mt6589-aquaris5.dts
@@ -0,0 +1,25 @@
+/*
+ * Copyright (c) 2014 MundoReader S.L.
+ * Author: Matthias Brugger <matthias.bgg@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+#include "mt6589.dtsi"
+
+/ {
+	model = "bq Aquaris5";
+
+	memory {
+		reg = <0x80000000 0x40000000>;
+	};
+};
-- 
1.7.9.5
