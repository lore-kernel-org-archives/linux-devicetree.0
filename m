From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 03/21] ARM: keystone: remove unnecessary prom.h include
Date: Thu, 26 Sep 2013 13:50:38 -0500
Message-ID: <1380221456-11192-4-git-send-email-robherring2@gmail.com>
References: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Remove unnecessary prom.h include in preparation to make prom.h optional.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
---
 arch/arm/mach-keystone/platsmp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-keystone/platsmp.c b/arch/arm/mach-keystone/platsmp.c
index c122961..5cf0683 100644
--- a/arch/arm/mach-keystone/platsmp.c
+++ b/arch/arm/mach-keystone/platsmp.c
@@ -17,7 +17,6 @@
 #include <linux/io.h>
 
 #include <asm/smp_plat.h>
-#include <asm/prom.h>
 
 #include "keystone.h"
 
-- 
1.8.1.2
