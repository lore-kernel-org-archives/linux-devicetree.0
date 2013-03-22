From: Ian Lartey <ian@slimlogic.co.uk>
Subject: [PATCH v10 02/12] mfd: palmas: is_palmas_charger needed by multiple drivers
Date: Fri, 22 Mar 2013 14:55:12 +0000
Message-ID: <1363964122-19201-3-git-send-email-ian@slimlogic.co.uk>
References: <1363964122-19201-1-git-send-email-ian@slimlogic.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363964122-19201-1-git-send-email-ian@slimlogic.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org, grant.likely@secretlab.ca, broonie@opensource.wolfsonmicro.com, rob.herring@calxeda.com, rob@landley.net, mturquette@linaro.org, linus.walleij@linaro.org, cooloney@gmail.com, sfr@canb.auug.org.au, rpurdie@rpsys.net, akpm@linux-foundation.org, sameo@linux.intel.com, wim@iguana.be, lgirdwood@gmail.com, gg@slimlogic.co.uk, j-keerthy@ti.com, ldewangan@nvidia.com, t-kristo@ti.com
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
