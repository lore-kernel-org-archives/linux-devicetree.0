From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH 10/11] memory: atmel-ebi: switch to SPDX license identifiers
Date: Wed, 13 Feb 2019 09:00:14 +0000
Message-ID: <20190213085930.31578-11-tudor.ambarus@microchip.com>
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
 drivers/memory/atmel-ebi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 8515196c2b03..14386d0b5f57 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * EBI driver for Atmel chips
  * inspired by the fsl weim bus driver
  *
  * Copyright (C) 2013 Jean-Jacques Hiblot <jjhiblot@traphandler.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
=20
 #include <linux/clk.h>
--=20
2.9.5
