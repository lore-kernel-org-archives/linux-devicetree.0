From: Jayachandran C <jnair@caviumnetworks.com>
Subject: [PATCH v3 3/5] arm64: dts: add device tree for ARCH_THUNDER2
Date: Tue, 7 Feb 2017 21:19:57 +0000
Message-ID: <1486502399-2950-4-git-send-email-jnair@caviumnetworks.com>
References: <1486502399-2950-1-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1486502399-2950-1-git-send-email-jnair@caviumnetworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add board device tree file for Cavium's ThunderX2 CN99XX arm64
server processors. The SoC is compatible with the discontinued
Broadcom Vulcan ARM64 SoC.

Update the Makefile to build the thunder-99xx.dtb when the
ARCH_THUNDER2 option is selected.

Signed-off-by: Jayachandran C <jnair@caviumnetworks.com>
---
 arch/arm64/boot/dts/cavium/Makefile         |  1 +
 arch/arm64/boot/dts/cavium/thunder-99xx.dts | 34 +++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cavium/thunder-99xx.dts

diff --git a/arch/arm64/boot/dts/cavium/Makefile b/arch/arm64/boot/dts/cavium/Makefile
index e34f89d..557c8be 100644
--- a/arch/arm64/boot/dts/cavium/Makefile
+++ b/arch/arm64/boot/dts/cavium/Makefile
@@ -1,4 +1,5 @@
 dtb-$(CONFIG_ARCH_THUNDER) += thunder-88xx.dtb
+dtb-$(CONFIG_ARCH_THUNDER2) += thunder-99xx.dtb
 
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
diff --git a/arch/arm64/boot/dts/cavium/thunder-99xx.dts b/arch/arm64/boot/dts/cavium/thunder-99xx.dts
new file mode 100644
index 0000000..39614b8
--- /dev/null
+++ b/arch/arm64/boot/dts/cavium/thunder-99xx.dts
@@ -0,0 +1,34 @@
+/*
+ * dts file for Cavium ThunderX2 CN99XX based Evaluation Boards
+ *
+ * Copyright (c) 2017 Cavium Inc.
+ * Copyright (c) 2013-2016 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ */
+
+/dts-v1/;
+
+#include "../broadcom/vulcan.dtsi"
+
+/ {
+	model = "Cavium ThunderX2 CN99XX";
+	compatible = "cavium,thunder-99xx", "brcm,vulcan-soc";
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0x0 0x80000000>,  /* 2G @ 2G  */
+		      <0x00000008 0x80000000 0x0 0x80000000>;  /* 2G @ 34G */
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
-- 
2.7.4
