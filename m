From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v4 4/5] mfd: rn5t618: register power off callback optionally
Date: Mon, 27 Jun 2016 23:27:56 -0700
Message-ID: <20160628062757.24490-5-stefan@agner.ch>
References: <20160628062757.24490-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160628062757.24490-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, carlo@caione.org
Cc: b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, linux@roeck-us.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Only register power off if the PMIC is defined as system power
controller (see Documentation/devicetree/bindings/power/
power-controller.txt).

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---
 drivers/mfd/rn5t618.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index c86160d..1831740 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -102,9 +102,13 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
-	if (!pm_power_off) {
-		rn5t618_pm_power_off = priv;
-		pm_power_off = rn5t618_power_off;
+	if (of_device_is_system_power_controller(i2c->dev.of_node)) {
+		if (!pm_power_off) {
+			rn5t618_pm_power_off = priv;
+			pm_power_off = rn5t618_power_off;
+		} else {
+			dev_warn(&i2c->dev, "Poweroff callback already assigned\n");
+		}
 	}
 
 	return 0;
-- 
2.8.3
