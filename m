From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 1/1] ARM: dts: zynq: Add Parallella device tree
Date: Sun, 29 Jun 2014 22:50:21 +0200
Message-ID: <1404075022-28745-2-git-send-email-afaerber@suse.de>
References: <1404075022-28745-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404075022-28745-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Andreas Olofsson <andreas@adapteva.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

This allows to boot the Adapteva Parallella board to serial console.

Cc: Andreas Olofsson <andreas@adapteva.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm/boot/dts/Makefile            |  4 ++-
 arch/arm/boot/dts/zynq-parallella.dts | 63 +++++++++++++++++++++++++++=
++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/zynq-parallella.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5986ff6..2a536f6 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -419,7 +419,9 @@ dtb-$(CONFIG_ARCH_VT8500) +=3D vt8500-bv07.dtb \
 	wm8650-mid.dtb \
 	wm8750-apc8750.dtb \
 	wm8850-w70v2.dtb
-dtb-$(CONFIG_ARCH_ZYNQ) +=3D zynq-zc702.dtb \
+dtb-$(CONFIG_ARCH_ZYNQ) +=3D \
+	zynq-parallella.dtb \
+	zynq-zc702.dtb \
 	zynq-zc706.dtb \
 	zynq-zed.dtb
 dtb-$(CONFIG_MACH_ARMADA_370) +=3D \
diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/=
zynq-parallella.dts
new file mode 100644
index 0000000..98df66c
--- /dev/null
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -0,0 +1,63 @@
+/*
+ * Copyright (c) 2014 SUSE LINUX Products GmbH
+ *
+ * Derived from zynq-zed.dts:
+ *
+ *  Copyright (C) 2011 Xilinx
+ *  Copyright (C) 2012 National Instruments Corp.
+ *  Copyright (C) 2013 Xilinx
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, an=
d
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+/dts-v1/;
+/include/ "zynq-7000.dtsi"
+
+/ {
+	model =3D "Parallella Board";
+	compatible =3D "xlnx,zynq-7000";
+
+	memory {
+		device_type =3D "memory";
+		reg =3D <0 0x20000000>;
+	};
+
+	chosen {
+		bootargs =3D "console=3DttyPS0,115200 earlyprintk root=3D/dev/mmcblk=
0p2 rootfstype=3Dext4 rw rootwait";
+	};
+};
+
+&gem0 {
+	status =3D "okay";
+	phy-mode =3D "rgmii-id";
+	phy-handle =3D <&ethernet_phy>;
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+
+	ethernet_phy: ethernet-phy@0 {
+		/* Marvell 88E1318 */
+		compatible =3D "ethernet-phy-id0141.0e90",
+		             "ethernet-phy-ieee802.3-c22";
+		reg =3D <0>;
+		marvell,reg-init =3D <0x3 0x10 0xff00 0x1e>,
+		                   <0x3 0x11 0xfff0 0xa>;
+	};
+};
+
+&i2c0 {
+	status =3D "okay";
+};
+
+&sdhci1 {
+	status =3D "okay";
+};
+
+&uart1 {
+	status =3D "okay";
+};
--=20
1.9.3
