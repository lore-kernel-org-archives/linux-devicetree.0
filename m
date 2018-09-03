From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH v2 09/11] dt-bindings: add constants for Microsemi Ocelot SerDes driver
Date: Mon,  3 Sep 2018 11:33:06 +0200
Message-ID: <20180903093308.24366-10-quentin.schulz@bootlin.com>
References: <20180903093308.24366-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903093308.24366-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

The Microsemi Ocelot has multiple SerDes and requires that the SerDes be
muxed accordingly to the hardware representation.

Let's add a constant for each SerDes available in the Microsemi Ocelot.

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 include/dt-bindings/phy/phy-ocelot-serdes.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/phy/phy-ocelot-serdes.h

diff --git a/include/dt-bindings/phy/phy-ocelot-serdes.h b/include/dt-bindings/phy/phy-ocelot-serdes.h
new file mode 100644
index 000000000000..cf111baa87c8
--- /dev/null
+++ b/include/dt-bindings/phy/phy-ocelot-serdes.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/* Copyright (c) 2018 Microsemi Corporation */
+#ifndef __PHY_OCELOT_SERDES_H__
+#define __PHY_OCELOT_SERDES_H__
+
+#define SERDES1G_0	0
+#define SERDES1G_1	1
+#define SERDES1G_2	2
+#define SERDES1G_3	3
+#define SERDES1G_4	4
+#define SERDES1G_5	5
+#define SERDES1G_MAX	6
+#define SERDES6G_0	SERDES1G_MAX
+#define SERDES6G_1	(SERDES1G_MAX + 1)
+#define SERDES6G_2	(SERDES1G_MAX + 2)
+#define SERDES6G_MAX	(SERDES1G_MAX + 3)
+#define SERDES_MAX	(SERDES1G_MAX + SERDES6G_MAX)
+
+#endif
-- 
2.17.1
