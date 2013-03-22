From: Ian Lartey <ian@slimlogic.co.uk>
Subject: [PATCH v9 01/11] mfd: palmas: is_palmas_charger needed by multiple
 drivers
Date: Fri, 22 Mar 2013 13:36:03 +0000
Message-ID: <1363959373-10671-2-git-send-email-ian@slimlogic.co.uk>
References: <1363959373-10671-1-git-send-email-ian@slimlogic.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1363959373-10671-1-git-send-email-ian@slimlogic.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linus.walleij@linaro.org, grant.likely@secretlab.ca, wim@iguana.be, ldewangan@nvidia.com, gg@slimlogic.co.uk, linux-leds@vger.kernel.org, sfr@canb.auug.org.au, mturquette@linaro.org, sameo@linux.intel.com, linux-watchdog@vger.kernel.org, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, cooloney@gmail.com, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, j-keerthy@ti.com, broonie@opensource.wolfsonmicro.com, lgirdwood@gmail.com, t-kristo@ti.com, rpurdie@rpsys.net, rob@landley.net, akpm@linux-foundation.org
List-Id: devicetree@vger.kernel.org

is_palmas_charger checks for the presence of charging
functionality in the device

Signed-off-by: Graeme Gregory <gg@slimlogic.co.uk>
Signed-off-by: Ian Lartey <ian@slimlogic.co.uk>
Acked-by: Laxman Dewangani <ldewangan@nvidia.com>
---
 include/linux/mfd/palmas.h |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/include/linux/mfd/palmas.h b/include/linux/mfd/palmas.h
index 3bbda22..4a066d0 100644
--- a/include/linux/mfd/palmas.h
+++ b/include/linux/mfd/palmas.h
@@ -1,9 +1,10 @@
 /*
  * TI Palmas
  *
- * Copyright 2011 Texas Instruments Inc.
+ * Copyright 2011-2013 Texas Instruments Inc.
  *
  * Author: Graeme Gregory <gg@slimlogic.co.uk>
+ * Author: Ian Lartey <ian@slimlogic.co.uk>
  *
  *  This program is free software; you can redistribute it and/or modify it
  *  under  the terms of the GNU General  Public License as published by the
@@ -22,6 +23,15 @@
 
 #define PALMAS_NUM_CLIENTS		3
 
+/* The ID_REVISION NUMBERS */
+#define PALMAS_CHIP_OLD_ID		0x0000
+#define PALMAS_CHIP_ID			0xC035
+#define PALMAS_CHIP_CHARGER_ID		0xC036
+
+#define is_palmas(a)	(((a) == PALMAS_CHIP_OLD_ID) || \
+			((a) == PALMAS_CHIP_ID))
+#define is_palmas_charger(a) ((a) == PALMAS_CHIP_CHARGER_ID)
+
 struct palmas_pmic;
 struct palmas_gpadc;
 struct palmas_resource;
-- 
1.7.0.4
