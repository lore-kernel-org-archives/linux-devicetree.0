From: thesven73@gmail.com
Subject: [PATCH v1] regulator: pfuze100-regulator: add coin support for pfuze100
Date: Fri,  2 Nov 2018 13:12:08 -0400
Message-ID: <20181102171208.29658-1-TheSven73@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, broonie@kernel.org, robh+dt@kernel.org
Cc: lgirdwood@gmail.com, mark.rutland@arm.com, george.mccollister@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for PF0100 coin cell/super capacitor charger which works as
a current limited voltage source via the LICELL pin. When VIN goes below
a certain threshold LICELL is used to provide power for VSNVS which is
usually used to hold up secure non-volatile storage and the real-time
clock on the SoC.

This extends a previous commit, where coin support was added for PF0200
only.

Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>
References: c6182ac9609 ("regulator: pfuze100-regulator: add coin support")
---
 Documentation/devicetree/bindings/regulator/pfuze100.txt | 4 ++++
 drivers/regulator/pfuze100-regulator.c                   | 2 ++
 include/linux/regulator/pfuze100.h                       | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index c7610718adff..a69f7626e650 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -127,6 +127,10 @@ Example 1: PFUZE100
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
+			coin_reg: coin {
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
 		};
 	};
 
diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index 31c3a236120a..d8eb59fe3ab6 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -357,6 +357,7 @@ static struct pfuze_regulator pfuze100_regulators[] = {
 	PFUZE100_VGEN_REG(PFUZE100, VGEN4, PFUZE100_VGEN4VOL, 1800000, 3300000, 100000),
 	PFUZE100_VGEN_REG(PFUZE100, VGEN5, PFUZE100_VGEN5VOL, 1800000, 3300000, 100000),
 	PFUZE100_VGEN_REG(PFUZE100, VGEN6, PFUZE100_VGEN6VOL, 1800000, 3300000, 100000),
+	PFUZE100_COIN_REG(PFUZE100, COIN, PFUZE100_COINVOL, 0x7, pfuze100_coin),
 };
 
 static struct pfuze_regulator pfuze200_regulators[] = {
@@ -423,6 +424,7 @@ static struct of_regulator_match pfuze100_matches[] = {
 	{ .name = "vgen4",	},
 	{ .name = "vgen5",	},
 	{ .name = "vgen6",	},
+	{ .name = "coin",	},
 };
 
 /* PFUZE200 */
diff --git a/include/linux/regulator/pfuze100.h b/include/linux/regulator/pfuze100.h
index cb5aecd40f07..331d7d940c7a 100644
--- a/include/linux/regulator/pfuze100.h
+++ b/include/linux/regulator/pfuze100.h
@@ -33,7 +33,8 @@
 #define PFUZE100_VGEN4		12
 #define PFUZE100_VGEN5		13
 #define PFUZE100_VGEN6		14
-#define PFUZE100_MAX_REGULATOR	15
+#define PFUZE100_COIN		15
+#define PFUZE100_MAX_REGULATOR	16
 
 #define PFUZE200_SW1AB		0
 #define PFUZE200_SW2		1
-- 
2.17.1
