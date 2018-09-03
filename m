From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v2 04/11] net: mscc: ocelot: move the HSIO header to include/soc
Date: Mon,  3 Sep 2018 11:33:01 +0200
Message-ID: <20180903093308.24366-5-quentin.schulz@bootlin.com>
References: <20180903093308.24366-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903093308.24366-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

Since HSIO address space can be used by different drivers (PLL, SerDes
muxing, temperature sensor), let's move it somewhere it can be included
by all drivers.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 drivers/net/ethernet/mscc/ocelot.h                       | 1 -
 drivers/net/ethernet/mscc/ocelot_regs.c                  | 1 +
 {drivers/net/ethernet => include/soc}/mscc/ocelot_hsio.h | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename {drivers/net/ethernet => include/soc}/mscc/ocelot_hsio.h (100%)

diff --git a/drivers/net/ethernet/mscc/ocelot.h b/drivers/net/ethernet/mscc/ocelot.h
index 616bec30dfa3..2da20a352120 100644
--- a/drivers/net/ethernet/mscc/ocelot.h
+++ b/drivers/net/ethernet/mscc/ocelot.h
@@ -16,7 +16,6 @@
 
 #include "ocelot_ana.h"
 #include "ocelot_dev.h"
-#include "ocelot_hsio.h"
 #include "ocelot_qsys.h"
 #include "ocelot_rew.h"
 #include "ocelot_sys.h"
diff --git a/drivers/net/ethernet/mscc/ocelot_regs.c b/drivers/net/ethernet/mscc/ocelot_regs.c
index e334b406c40c..bf0c609caea5 100644
--- a/drivers/net/ethernet/mscc/ocelot_regs.c
+++ b/drivers/net/ethernet/mscc/ocelot_regs.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2017 Microsemi Corporation
  */
 #include "ocelot.h"
+#include <soc/mscc/ocelot_hsio.h>
 
 static const u32 ocelot_ana_regmap[] = {
 	REG(ANA_ADVLEARN,                  0x009000),
diff --git a/drivers/net/ethernet/mscc/ocelot_hsio.h b/include/soc/mscc/ocelot_hsio.h
similarity index 100%
rename from drivers/net/ethernet/mscc/ocelot_hsio.h
rename to include/soc/mscc/ocelot_hsio.h
-- 
2.17.1
