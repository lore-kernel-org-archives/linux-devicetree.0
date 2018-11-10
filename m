From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 14/17] soc: bcm: Switch raspberrypi-power to SPDX identifier
Date: Sat, 10 Nov 2018 17:29:23 +0100
Message-ID: <1541867363-8022-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5094279106441894056=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Alexander Aring <aring@mojatatu.com>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============5094279106441894056==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Adopt the SPDX license identifier headers to ease license compliance
management.

Cc: Alexander Aring <aring@mojatatu.com>
Cc: Eric Anholt <eric@anholt.net>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/soc/bcm/raspberrypi-power.c           | 5 +----
 include/dt-bindings/power/raspberrypi-power.h | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/bcm/raspberrypi-power.c b/drivers/soc/bcm/raspberrypi-power.c
index a78dfe0..5d1aacd 100644
--- a/drivers/soc/bcm/raspberrypi-power.c
+++ b/drivers/soc/bcm/raspberrypi-power.c
@@ -1,9 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /* (C) 2015 Pengutronix, Alexander Aring <aar@pengutronix.de>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * Authors:
  * Alexander Aring <aar@pengutronix.de>
  * Eric Anholt <eric@anholt.net>
diff --git a/include/dt-bindings/power/raspberrypi-power.h b/include/dt-bindings/power/raspberrypi-power.h
index b3ff8e0..d6d58c98 100644
--- a/include/dt-bindings/power/raspberrypi-power.h
+++ b/include/dt-bindings/power/raspberrypi-power.h
@@ -1,9 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  *  Copyright © 2015 Broadcom
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef _DT_BINDINGS_ARM_BCM2835_RPI_POWER_H
-- 
2.7.4



--===============5094279106441894056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5094279106441894056==--
