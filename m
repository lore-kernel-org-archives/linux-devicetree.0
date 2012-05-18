From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH] regulator: dt: fix the name of regulator supply
Date: Sat, 19 May 2012 01:01:54 +0530
Message-ID: <1337369514-27007-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, lrg@ti.com
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

If there is any input supply for reglator then the name
of supply need to provided by init_data->supply_regulator.
In dt case, the input supply is searched by the <name>-supply
and here it is require to fix the name so that correct device
node can be identified at the time of regulator registration.

Fixing the name for input supply as "regulator-supply".

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../devicetree/bindings/regulator/regulator.txt    |    4 ++--
 drivers/regulator/of_regulator.c                   |    3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 5b7a408..6c8de69 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -9,7 +9,7 @@ Optional properties:
 - regulator-max-microamp: largest current consumers may set
 - regulator-always-on: boolean, regulator should never be disabled
 - regulator-boot-on: bootloader/firmware enabled regulator
-- <name>-supply: phandle to the parent supply/regulator node
+- regulator-supply: phandle to the parent supply/regulator node
 
 Example:
 
@@ -17,7 +17,7 @@ Example:
 		regulator-min-microvolt = <1000000>;
 		regulator-max-microvolt = <2500000>;
 		regulator-always-on;
-		vin-supply = <&vin>;
+		regulator-supply = <&vin>;
 	};
 
 Regulator Consumers:
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 56593b7..48d6449 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -60,6 +60,9 @@ static void of_get_regulation_constraints(struct device_node *np,
 		constraints->always_on = true;
 	else /* status change should be possible if not always on. */
 		constraints->valid_ops_mask |= REGULATOR_CHANGE_STATUS;
+
+	if (of_find_property(np, "regulator-supply", NULL))
+		(*init_data)->supply_regulator = "regulator";
 }
 
 /**
-- 
1.7.1.1


-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
