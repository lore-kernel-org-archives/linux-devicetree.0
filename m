From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 4/6] ARM: mmp: Switch to SPDX header
Date: Tue, 11 Jun 2019 09:29:19 +0200
Message-ID: <20190611072921.2979446-5-lkundrak@v3.sk>
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
 arch/arm/mach-mmp/aspenite.c      | 5 +----
 arch/arm/mach-mmp/avengers_lite.c | 5 +----
 arch/arm/mach-mmp/brownstone.c    | 5 +----
 arch/arm/mach-mmp/flint.c         | 5 +----
 arch/arm/mach-mmp/gplugd.c        | 5 +----
 arch/arm/mach-mmp/jasper.c        | 5 +----
 arch/arm/mach-mmp/mmp-dt.c        | 5 +----
 arch/arm/mach-mmp/mmp2-dt.c       | 5 +----
 arch/arm/mach-mmp/tavorevb.c      | 5 +----
 arch/arm/mach-mmp/teton_bga.c     | 5 +----
 arch/arm/mach-mmp/teton_bga.h     | 5 +----
 arch/arm/mach-mmp/ttc_dkb.c       | 5 +----
 12 files changed, 12 insertions(+), 48 deletions(-)

diff --git a/arch/arm/mach-mmp/aspenite.c b/arch/arm/mach-mmp/aspenite.c
index 75b2d7db643e..7eebeb979b05 100644
--- a/arch/arm/mach-mmp/aspenite.c
+++ b/arch/arm/mach-mmp/aspenite.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/aspenite.c
  *
  *  Support for the Marvell PXA168-based Aspenite and Zylonite2
  *  Development Platform.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
 #include <linux/gpio.h>
 #include <linux/gpio-pxa.h>
diff --git a/arch/arm/mach-mmp/avengers_lite.c b/arch/arm/mach-mmp/avenge=
rs_lite.c
index 3d2aea830ef7..19b476e590eb 100644
--- a/arch/arm/mach-mmp/avengers_lite.c
+++ b/arch/arm/mach-mmp/avengers_lite.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/avengers_lite.c
  *
  *  Support for the Marvell PXA168-based Avengers lite Development Platf=
orm.
  *
  *  Copyright (C) 2009-2010 Marvell International Ltd.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/init.h>
diff --git a/arch/arm/mach-mmp/brownstone.c b/arch/arm/mach-mmp/brownston=
e.c
index d2560fb1e835..8d8704382cf3 100644
--- a/arch/arm/mach-mmp/brownstone.c
+++ b/arch/arm/mach-mmp/brownstone.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/brownstone.c
  *
  *  Support for the Marvell Brownstone Development Platform.
  *
  *  Copyright (C) 2009-2010 Marvell International Ltd.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/init.h>
diff --git a/arch/arm/mach-mmp/flint.c b/arch/arm/mach-mmp/flint.c
index 078b98034960..48e04c3f2193 100644
--- a/arch/arm/mach-mmp/flint.c
+++ b/arch/arm/mach-mmp/flint.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/flint.c
  *
  *  Support for the Marvell Flint Development Platform.
  *
  *  Copyright (C) 2009 Marvell International Ltd.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/init.h>
diff --git a/arch/arm/mach-mmp/gplugd.c b/arch/arm/mach-mmp/gplugd.c
index c224119dc0f4..24f8797893e7 100644
--- a/arch/arm/mach-mmp/gplugd.c
+++ b/arch/arm/mach-mmp/gplugd.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/gplugd.c
  *
  *  Support for the Marvell PXA168-based GuruPlug Display (gplugD) Platf=
orm.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/init.h>
diff --git a/arch/arm/mach-mmp/jasper.c b/arch/arm/mach-mmp/jasper.c
index 5dbb753a77ac..104c18853ea8 100644
--- a/arch/arm/mach-mmp/jasper.c
+++ b/arch/arm/mach-mmp/jasper.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/jasper.c
  *
  *  Support for the Marvell Jasper Development Platform.
  *
  *  Copyright (C) 2009-2010 Marvell International Ltd.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/init.h>
diff --git a/arch/arm/mach-mmp/mmp-dt.c b/arch/arm/mach-mmp/mmp-dt.c
index 6e155f03b83c..829a3ddeab13 100644
--- a/arch/arm/mach-mmp/mmp-dt.c
+++ b/arch/arm/mach-mmp/mmp-dt.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/mmp-dt.c
  *
  *  Copyright (C) 2012 Marvell Technology Group Ltd.
  *  Author: Haojian Zhuang <haojian.zhuang@marvell.com>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/irqchip.h>
diff --git a/arch/arm/mach-mmp/mmp2-dt.c b/arch/arm/mach-mmp/mmp2-dt.c
index e3ef1da26d5e..51482f23f253 100644
--- a/arch/arm/mach-mmp/mmp2-dt.c
+++ b/arch/arm/mach-mmp/mmp2-dt.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/mmp2-dt.c
  *
  *  Copyright (C) 2012 Marvell Technology Group Ltd.
  *  Author: Haojian Zhuang <haojian.zhuang@marvell.com>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/io.h>
diff --git a/arch/arm/mach-mmp/tavorevb.c b/arch/arm/mach-mmp/tavorevb.c
index efe35fadeb60..e272b9218e17 100644
--- a/arch/arm/mach-mmp/tavorevb.c
+++ b/arch/arm/mach-mmp/tavorevb.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/tavorevb.c
  *
  *  Support for the Marvell PXA910-based TavorEVB Development Platform.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
 #include <linux/gpio.h>
 #include <linux/gpio-pxa.h>
diff --git a/arch/arm/mach-mmp/teton_bga.c b/arch/arm/mach-mmp/teton_bga.=
c
index cf038eb3bb4b..122f8288526e 100644
--- a/arch/arm/mach-mmp/teton_bga.c
+++ b/arch/arm/mach-mmp/teton_bga.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/teton_bga.c
  *
@@ -6,10 +7,6 @@
  *  Author: Mark F. Brown <mark.brown314@gmail.com>
  *
  *  This code is based on aspenite.c
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/init.h>
diff --git a/arch/arm/mach-mmp/teton_bga.h b/arch/arm/mach-mmp/teton_bga.=
h
index 019730f5aa56..d3c764aa4f97 100644
--- a/arch/arm/mach-mmp/teton_bga.h
+++ b/arch/arm/mach-mmp/teton_bga.h
@@ -1,9 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  Support for the Marvell PXA168 Teton BGA Development Platform.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
 #ifndef __ASM_MACH_TETON_BGA_H
 #define __ASM_MACH_TETON_BGA_H
diff --git a/arch/arm/mach-mmp/ttc_dkb.c b/arch/arm/mach-mmp/ttc_dkb.c
index 09b53ace08ac..0091a97d4f33 100644
--- a/arch/arm/mach-mmp/ttc_dkb.c
+++ b/arch/arm/mach-mmp/ttc_dkb.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-mmp/ttc_dkb.c
  *
  *  Support for the Marvell PXA910-based TTC_DKB Development Platform.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/init.h>
--=20
2.21.0
