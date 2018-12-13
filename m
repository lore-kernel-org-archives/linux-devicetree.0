From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v4 1/6] regulator: act8945a-regulator: unlock expert registers
Date: Thu, 13 Dec 2018 12:49:48 +0000
Message-ID: <1544703110-27161-2-git-send-email-claudiu.beznea@microchip.com>
References: <1544703110-27161-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544703110-27161-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Unlock expert registers for act8945a.
This is based on orginal work of Boris Brezillon at [1].

[1] https://www.spinics.net/lists/kernel/msg2942960.html

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/regulator/act8945a-regulator.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/act8945a-regulator.c b/drivers/regulator/act=
8945a-regulator.c
index 43fda8b4455a..8d71d9893d0d 100644
--- a/drivers/regulator/act8945a-regulator.c
+++ b/drivers/regulator/act8945a-regulator.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
=20
@@ -23,6 +24,7 @@
  */
 #define ACT8945A_SYS_MODE	0x00
 #define ACT8945A_SYS_CTRL	0x01
+#define ACT8945A_SYS_UNLK_REGS	0x0b
 #define ACT8945A_DCDC1_VSET1	0x20
 #define ACT8945A_DCDC1_VSET2	0x21
 #define ACT8945A_DCDC1_CTRL	0x22
@@ -123,9 +125,17 @@ static int act8945a_pmic_probe(struct platform_device =
*pdev)
 	struct regulator_config config =3D { };
 	const struct regulator_desc *regulators;
 	struct regulator_dev *rdev;
+	struct regmap *regmap;
 	int i, num_regulators;
 	bool voltage_select;
=20
+	regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap) {
+		dev_err(&pdev->dev,
+			"could not retrieve regmap from parent device\n");
+		return -EINVAL;
+	}
+
 	voltage_select =3D of_property_read_bool(pdev->dev.parent->of_node,
 					       "active-semi,vsel-high");
=20
@@ -149,7 +159,8 @@ static int act8945a_pmic_probe(struct platform_device *=
pdev)
 		}
 	}
=20
-	return 0;
+	/* Unlock expert registers. */
+	return regmap_write(regmap, ACT8945A_SYS_UNLK_REGS, 0xef);
 }
=20
 static struct platform_driver act8945a_pmic_driver =3D {
--=20
2.7.4
