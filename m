From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 2/6] ARM: dts: pxa: Switch to SPDX header
Date: Tue, 11 Jun 2019 09:29:17 +0200
Message-ID: <20190611072921.2979446-3-lkundrak@v3.sk>
References: <20190611072921.2979446-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611072921.2979446-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Wei Xu <xuwei5@hisilicon.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Patrice Chotard <patrice.chotard@st.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The original license text had a typo ("publishhed") which would be
likely to confuse automated licensing auditing tools. Let's just switch
to SPDX instead of fixing the wording.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/pxa168-aspenite.dts | 5 +----
 arch/arm/boot/dts/pxa168.dtsi         | 5 +----
 arch/arm/boot/dts/pxa910-dkb.dts      | 5 +----
 arch/arm/boot/dts/pxa910.dtsi         | 5 +----
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/pxa168-aspenite.dts b/arch/arm/boot/dts/px=
a168-aspenite.dts
index 0a988b3fb248..4928a109557d 100644
--- a/arch/arm/boot/dts/pxa168-aspenite.dts
+++ b/arch/arm/boot/dts/pxa168-aspenite.dts
@@ -1,10 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  Copyright (C) 2012 Marvell Technology Group Ltd.
  *  Author: Haojian Zhuang <haojian.zhuang@marvell.com>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 /dts-v1/;
diff --git a/arch/arm/boot/dts/pxa168.dtsi b/arch/arm/boot/dts/pxa168.dts=
i
index 7137f3550183..ad6f428a33ea 100644
--- a/arch/arm/boot/dts/pxa168.dtsi
+++ b/arch/arm/boot/dts/pxa168.dtsi
@@ -1,10 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  Copyright (C) 2012 Marvell Technology Group Ltd.
  *  Author: Haojian Zhuang <haojian.zhuang@marvell.com>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <dt-bindings/clock/marvell,pxa168.h>
diff --git a/arch/arm/boot/dts/pxa910-dkb.dts b/arch/arm/boot/dts/pxa910-=
dkb.dts
index c82f2810ec73..a43a51d2ae81 100644
--- a/arch/arm/boot/dts/pxa910-dkb.dts
+++ b/arch/arm/boot/dts/pxa910-dkb.dts
@@ -1,10 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  Copyright (C) 2012 Marvell Technology Group Ltd.
  *  Author: Haojian Zhuang <haojian.zhuang@marvell.com>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 /dts-v1/;
diff --git a/arch/arm/boot/dts/pxa910.dtsi b/arch/arm/boot/dts/pxa910.dts=
i
index c88553a8ee29..69d152c2d52c 100644
--- a/arch/arm/boot/dts/pxa910.dtsi
+++ b/arch/arm/boot/dts/pxa910.dtsi
@@ -1,10 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  Copyright (C) 2012 Marvell Technology Group Ltd.
  *  Author: Haojian Zhuang <haojian.zhuang@marvell.com>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <dt-bindings/clock/marvell,pxa910.h>
--=20
2.21.0
