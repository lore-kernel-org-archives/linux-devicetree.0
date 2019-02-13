From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH 09/11] mfd: syscon: atmel: switch to SPDX license identifiers
Date: Wed, 13 Feb 2019 09:00:11 +0000
Message-ID: <20190213085930.31578-10-tudor.ambarus@microchip.com>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213085930.31578-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org, marek.vasut@gmail.com, richard@nod.at, miquel.raynal@bootlin.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
List-Id: devicetree@vger.kernel.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Adopt the SPDX license identifiers to ease license compliance
management.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 include/linux/mfd/syscon/atmel-matrix.h | 6 +-----
 include/linux/mfd/syscon/atmel-mc.h     | 6 +-----
 include/linux/mfd/syscon/atmel-smc.h    | 5 +----
 include/linux/mfd/syscon/atmel-st.h     | 6 +-----
 4 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/include/linux/mfd/syscon/atmel-matrix.h b/include/linux/mfd/sy=
scon/atmel-matrix.h
index 1e2cd118e4e3..20c25665216a 100644
--- a/include/linux/mfd/syscon/atmel-matrix.h
+++ b/include/linux/mfd/syscon/atmel-matrix.h
@@ -1,12 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  *  Copyright (C) 2014 Atmel Corporation.
  *
  * Memory Controllers (MATRIX, EBI) - System peripherals registers.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
=20
 #ifndef _LINUX_MFD_SYSCON_ATMEL_MATRIX_H
diff --git a/include/linux/mfd/syscon/atmel-mc.h b/include/linux/mfd/syscon=
/atmel-mc.h
index afd9b8f1e363..99c56205c410 100644
--- a/include/linux/mfd/syscon/atmel-mc.h
+++ b/include/linux/mfd/syscon/atmel-mc.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2005 Ivan Kokshaysky
  * Copyright (C) SAN People
@@ -5,11 +6,6 @@
  * Memory Controllers (MC, EBI, SMC, SDRAMC, BFC) - System peripherals
  * registers.
  * Based on AT91RM9200 datasheet revision E.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
=20
 #ifndef _LINUX_MFD_SYSCON_ATMEL_MC_H_
diff --git a/include/linux/mfd/syscon/atmel-smc.h b/include/linux/mfd/sysco=
n/atmel-smc.h
index 7a367f34b66a..e9e24f4c4578 100644
--- a/include/linux/mfd/syscon/atmel-smc.h
+++ b/include/linux/mfd/syscon/atmel-smc.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Atmel SMC (Static Memory Controller) register offsets and bit definitio=
ns.
  *
@@ -5,10 +6,6 @@
  * Copyright (C) 2014 Free Electrons
  *
  * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
=20
 #ifndef _LINUX_MFD_SYSCON_ATMEL_SMC_H_
diff --git a/include/linux/mfd/syscon/atmel-st.h b/include/linux/mfd/syscon=
/atmel-st.h
index 8acf1ec1fa32..5b6013d0c440 100644
--- a/include/linux/mfd/syscon/atmel-st.h
+++ b/include/linux/mfd/syscon/atmel-st.h
@@ -1,14 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2005 Ivan Kokshaysky
  * Copyright (C) SAN People
  *
  * System Timer (ST) - System peripherals registers.
  * Based on AT91RM9200 datasheet revision E.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
  */
=20
 #ifndef _LINUX_MFD_SYSCON_ATMEL_ST_H
--=20
2.9.5
