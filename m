From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 10/10] ARM64: dts: rockchip: Add Landingship config
Date: Mon,  8 Feb 2016 03:17:39 +0100
Message-ID: <1454897859-7601-11-git-send-email-afaerber@suse.de>
References: <1454897859-7601-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454897859-7601-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v2: New - showcases inclusion of GeekBox module config
=20
 arch/arm64/boot/dts/rockchip/Makefile              |  1 +
 .../dts/rockchip/rk3368-geekbox-landingship.dts    | 56 ++++++++++++++=
++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox-landing=
ship.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dt=
s/rockchip/Makefile
index df37865e8ced..201bcd9863ce 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -1,5 +1,6 @@
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox-landingship.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
=20
 always		:=3D $(dtb-y)
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox-landingship.dt=
s b/arch/arm64/boot/dts/rockchip/rk3368-geekbox-landingship.dts
new file mode 100644
index 000000000000..e4a117597a0c
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox-landingship.dts
@@ -0,0 +1,56 @@
+/*
+ * Copyright (c) 2016 Andreas F=C3=A4rber
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of =
the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "rk3368-geekbox.dts"
+
+/ {
+	model =3D "GeekBox on Landingship";
+	compatible =3D "geekbuying,landingship", "geekbuying,geekbox", "rockc=
hip,rk3368";
+};
+
+&i2c1 {
+	status =3D "okay";
+};
+
+&i2c2 {
+	status =3D "okay";
+};
--=20
2.6.2
