From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH v2 3/3] mtd: spi-nor: stm32-quadspi: change license text
Date: Thu, 26 Oct 2017 17:12:35 +0200
Message-ID: <1509030755-19044-4-git-send-email-ludovic.Barre@st.com>
References: <1509030755-19044-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509030755-19044-1-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

-Change the license text with long template.
-Change Copyright to STMicroelectronics.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 drivers/mtd/spi-nor/stm32-quadspi.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/stm32-quadspi.c b/drivers/mtd/spi-nor/stm32-quadspi.c
index 70710be..b3c7f6a 100644
--- a/drivers/mtd/spi-nor/stm32-quadspi.c
+++ b/drivers/mtd/spi-nor/stm32-quadspi.c
@@ -1,9 +1,22 @@
 /*
- * stm32_quadspi.c
+ * Driver for stm32 quadspi controller
  *
- * Copyright (C) 2017, Ludovic Barre
+ * Copyright (C) 2017, STMicroelectronics - All Rights Reserved
+ * Author(s): Ludovic Barre author <ludovic.barre@st.com>.
  *
- * License terms: GNU General Public License (GPL), version 2
+ * License terms: GPL V2.0.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
+ * details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * This program. If not, see <http://www.gnu.org/licenses/>.
  */
 #include <linux/clk.h>
 #include <linux/errno.h>
-- 
2.7.4
