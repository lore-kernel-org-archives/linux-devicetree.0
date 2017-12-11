From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 14/20] ARM: dts: Add OpenBMC flash layout
Date: Mon, 11 Dec 2017 15:36:58 +1030
Message-ID: <20171211050704.20621-15-joel@jms.id.au>
References: <20171211050704.20621-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171211050704.20621-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This is a layout used by OpenBMC systems. It describes the fixed flash
layout of a 32MB mtd device.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/openbmc-flash-layout.dtsi | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout.dtsi

diff --git a/arch/arm/boot/dts/openbmc-flash-layout.dtsi b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
new file mode 100644
index 000000000000..63ad8db7a431
--- /dev/null
+++ b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	u-boot@0 {
+		reg = <0x0 0x60000>;
+		label = "u-boot";
+	};
+
+	u-boot-env@60000 {
+		reg = <0x60000 0x20000>;
+		label = "u-boot-env";
+	};
+
+	kernel@80000 {
+		reg = <0x80000 0x440000>;
+		label = "kernel";
+	};
+
+	rofs@0c0000 {
+		reg = <0x4c0000 0x1740000>;
+		label = "rofs";
+	};
+
+	rwfs@1c00000 {
+		reg = <0x1c00000 0x400000>;
+		label = "rwfs";
+	};
+};
-- 
2.14.1
