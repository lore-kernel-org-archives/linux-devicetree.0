From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH] arm64: dts: actions: Convert to new-style SPDX license identifiers
Date: Sun, 21 Jan 2018 17:23:17 +0100
Message-ID: <20180121162317.24361-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Cc: Thomas Liau <thomas.liau@actions-semi.com>, Jeff Chen <jeff.chen@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, =?UTF-8?q?=E6=A2=85=E5=88=A9?= <harrymei@actions-semi.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Move SPDX-License-Identifier to the top and add one for the Makefile.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm64/boot/dts/actions/Makefile              | 2 ++
 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts | 3 +--
 arch/arm64/boot/dts/actions/s900.dtsi             | 3 +--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/actions/Makefile b/arch/arm64/boot/dts/actions/Makefile
index d8b923480f5a..b57fd2372ecd 100644
--- a/arch/arm64/boot/dts/actions/Makefile
+++ b/arch/arm64/boot/dts/actions/Makefile
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0+
+
 dtb-$(CONFIG_ARCH_ACTIONS) += s700-cubieboard7.dtb
 
 dtb-$(CONFIG_ARCH_ACTIONS) += s900-bubblegum-96.dtb
diff --git a/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts b/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
index e1dcedf69733..47990e5a10a2 100644
--- a/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
+++ b/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
@@ -1,7 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright (c) 2017 Andreas Färber
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
index dd086a80b795..094a35ccfc56 100644
--- a/arch/arm64/boot/dts/actions/s900.dtsi
+++ b/arch/arm64/boot/dts/actions/s900.dtsi
@@ -1,7 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright (c) 2017 Andreas Färber
- *
- * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.13.6
