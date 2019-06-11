From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 5/6] ARM: pxa: Switch to SPDX header
Date: Tue, 11 Jun 2019 09:29:20 +0200
Message-ID: <20190611072921.2979446-6-lkundrak@v3.sk>
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
 arch/arm/mach-pxa/littleton.c | 5 +----
 arch/arm/mach-pxa/pxa-dt.c    | 5 +----
 arch/arm/mach-pxa/saar.c      | 5 +----
 arch/arm/mach-pxa/tavorevb.c  | 5 +----
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-pxa/littleton.c b/arch/arm/mach-pxa/littleton.=
c
index 464b8bd2bcb9..5c78bf53be5c 100644
--- a/arch/arm/mach-pxa/littleton.c
+++ b/arch/arm/mach-pxa/littleton.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-pxa/littleton.c
  *
@@ -9,10 +10,6 @@
  *
  *  2007-11-22  modified to align with latest kernel
  *              eric miao <eric.miao@marvell.com>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/init.h>
diff --git a/arch/arm/mach-pxa/pxa-dt.c b/arch/arm/mach-pxa/pxa-dt.c
index aa9b255f5570..e5508e04fadc 100644
--- a/arch/arm/mach-pxa/pxa-dt.c
+++ b/arch/arm/mach-pxa/pxa-dt.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-pxa/pxa-dt.c
  *
  *  Copyright (C) 2012 Daniel Mack
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/irq.h>
diff --git a/arch/arm/mach-pxa/saar.c b/arch/arm/mach-pxa/saar.c
index 834991034f30..a5f5bc5c20fb 100644
--- a/arch/arm/mach-pxa/saar.c
+++ b/arch/arm/mach-pxa/saar.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-pxa/saar.c
  *
  *  Support for the Marvell PXA930 Handheld Platform (aka SAAR)
  *
  *  Copyright (C) 2007-2008 Marvell International Ltd.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/module.h>
diff --git a/arch/arm/mach-pxa/tavorevb.c b/arch/arm/mach-pxa/tavorevb.c
index 4b38e821ac9c..129b7de675a7 100644
--- a/arch/arm/mach-pxa/tavorevb.c
+++ b/arch/arm/mach-pxa/tavorevb.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  linux/arch/arm/mach-pxa/tavorevb.c
  *
  *  Support for the Marvell PXA930 Evaluation Board
  *
  *  Copyright (C) 2007-2008 Marvell International Ltd.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
  */
=20
 #include <linux/module.h>
--=20
2.21.0
