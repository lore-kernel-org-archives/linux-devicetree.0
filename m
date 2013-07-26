From: Robin Gong <b38343@freescale.com>
Subject: [PATCH] regulator:pfuze100:  fix build warning and correct the binding doc
Date: Fri, 26 Jul 2013 10:27:18 +0800
Message-ID: <1374805638-12299-1-git-send-email-b38343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@kernel.org, shawn.guo@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, lgirdwood@gmail.com, s.trumtrar@pengutronix.de
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

fix building warning and correct the binding doc

Signed-off-by: Robin Gong <b38343@freescale.com>
---
 .../devicetree/bindings/regulator/pfuze100.txt     |    2 ++
 drivers/regulator/pfuze100-regulator.c             |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index 22e1a48..fc989b2 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -3,6 +3,8 @@ PFUZE100 family of regulators
 Required properties:
 - compatible: "fsl,pfuze100"
 - reg: I2C slave address
+
+Required child node:
 - regulators: This is the list of child nodes that specify the regulator
   initialization data for defined regulators. Please refer to below doc
   Documentation/devicetree/bindings/regulator/regulator.txt.
diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index fcc7cd0..e2f9dcf 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -295,7 +295,7 @@ static inline struct device_node *match_of_node(int index)
 #else
 static int pfuze_parse_regulators_dt(struct pfuze_chip *chip)
 {
-	return NULL;
+	return 0;
 }
 
 static inline struct regulator_init_data *match_init_data(int index)
-- 
1.7.5.4


