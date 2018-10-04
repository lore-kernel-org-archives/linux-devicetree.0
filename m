From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v4 09/11] dt-bindings: add constants for Microsemi Ocelot SerDes driver
Date: Thu,  4 Oct 2018 14:22:06 +0200
Message-ID: <20181004122208.32272-10-quentin.schulz@bootlin.com>
References: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

The Microsemi Ocelot has multiple SerDes and requires that the SerDes be
muxed accordingly to the hardware representation.

Let's add a constant for each SerDes available in the Microsemi Ocelot.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 include/dt-bindings/phy/phy-ocelot-serdes.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 include/dt-bindings/phy/phy-ocelot-serdes.h

diff --git a/include/dt-bindings/phy/phy-ocelot-serdes.h b/include/dt-bindings/phy/phy-ocelot-serdes.h
new file mode 100644
index 000000000000..bd28f21206f6
--- /dev/null
+++ b/include/dt-bindings/phy/phy-ocelot-serdes.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/* Copyright (c) 2018 Microsemi Corporation */
+#ifndef __PHY_OCELOT_SERDES_H__
+#define __PHY_OCELOT_SERDES_H__
+
+#define SERDES1G(x)	(x)
+#define SERDES1G_MAX	SERDES1G(5)
+#define SERDES6G(x)	(SERDES1G_MAX + 1 + (x))
+#define SERDES6G_MAX	SERDES6G(2)
+#define SERDES_MAX	SERDES6G_MAX
+
+#endif
-- 
2.17.1
