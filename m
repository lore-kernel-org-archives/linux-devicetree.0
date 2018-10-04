From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v4 04/11] net: mscc: ocelot: move the HSIO header to include/soc
Date: Thu,  4 Oct 2018 14:22:01 +0200
Message-ID: <20181004122208.32272-5-quentin.schulz@bootlin.com>
References: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

Since HSIO address space can be used by different drivers (PLL, SerDes
muxing, temperature sensor), let's move it somewhere it can be included
by all drivers.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 drivers/net/ethernet/mscc/ocelot.h                       | 2 +-
 {drivers/net/ethernet => include/soc}/mscc/ocelot_hsio.h | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {drivers/net/ethernet => include/soc}/mscc/ocelot_hsio.h (100%)

diff --git a/drivers/net/ethernet/mscc/ocelot.h b/drivers/net/ethernet/mscc/ocelot.h
index 616bec30dfa3..d3980158c4a3 100644
--- a/drivers/net/ethernet/mscc/ocelot.h
+++ b/drivers/net/ethernet/mscc/ocelot.h
@@ -13,10 +13,10 @@
 #include <linux/if_vlan.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <soc/mscc/ocelot_hsio.h>
 
 #include "ocelot_ana.h"
 #include "ocelot_dev.h"
-#include "ocelot_hsio.h"
 #include "ocelot_qsys.h"
 #include "ocelot_rew.h"
 #include "ocelot_sys.h"
diff --git a/drivers/net/ethernet/mscc/ocelot_hsio.h b/include/soc/mscc/ocelot_hsio.h
similarity index 100%
rename from drivers/net/ethernet/mscc/ocelot_hsio.h
rename to include/soc/mscc/ocelot_hsio.h
-- 
2.17.1
