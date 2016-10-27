Return-Path: <j-keerthy@ti.com>
From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 2/4] mfd: palmas: Reset the POWERHOLD mux during power off
Date: Thu, 27 Oct 2016 14:40:12 +0530
Message-ID: <1477559414-12520-3-git-send-email-j-keerthy@ti.com>
In-Reply-To: <1477559414-12520-1-git-send-email-j-keerthy@ti.com>
References: <1477559414-12520-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: tony@atomide.com, lee.jones@linaro.org, robh+dt@kernel.org
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, nm@ti.com, j-keerthy@ti.com, t-kristo@ti.com
List-ID: <devicetree@vger.kernel.org>

POWERHOLD signal has higher priority  over the DEV_ON bit.
So power off will not happen if the POWERHOLD is held high.
Hence reset the MUX to GPIO_7 mode to release the POWERHOLD
and the DEV_ON bit to take effect to power off the PMIC.

PMIC Power off happens in dire situations like thermal shutdown
so irrespective of the POWERHOLD setting go ahead and turn off
the powerhold.  Currently poweroff is broken on boards that have
powerhold enabled. This fixes poweroff on those boards.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/mfd/palmas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index 8f8bacb..8fbc5e0 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -430,10 +430,28 @@ static void palmas_power_off(void)
 {
 	unsigned int addr;
 	int ret, slave;
+	struct device_node *node;
+	bool override_powerhold;
 
 	if (!palmas_dev)
 		return;
 
+	node = palmas_dev->dev->of_node;
+	override_powerhold = of_property_read_bool(node,
+					"ti,palmas-override-powerhold");
+
+	if (override_powerhold) {
+		addr = PALMAS_BASE_TO_REG(PALMAS_PU_PD_OD_BASE,
+					  PALMAS_PRIMARY_SECONDARY_PAD2);
+		slave = PALMAS_BASE_TO_SLAVE(PALMAS_PU_PD_OD_BASE);
+
+		ret = regmap_update_bits(palmas_dev->regmap[slave], addr,
+					 PALMAS_PRIMARY_SECONDARY_PAD2_GPIO_7_MASK, 0);
+		if (ret)
+			pr_err("%s: Unable to write PALMAS_PRIMARY_SECONDARY_PAD2 %d\n",
+			       __func__, ret);
+	}
+
 	slave = PALMAS_BASE_TO_SLAVE(PALMAS_PMU_CONTROL_BASE);
 	addr = PALMAS_BASE_TO_REG(PALMAS_PMU_CONTROL_BASE, PALMAS_DEV_CTRL);
 
-- 
1.9.1
