From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH 8/8] regulator: bd718xx: renme bd71837 to 718xx
Date: Wed, 29 Aug 2018 15:39:54 +0300
Message-ID: <9b442ffad56fad12a726dc9c0e4b07985adb8b8d.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

rename bd71837-regulator.c to bd718x7-regulator.c to reflect the
fact that also BD71847 is now supported by the driver.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/Kconfig                                      | 2 +-
 drivers/regulator/Makefile                                     | 2 +-
 drivers/regulator/{bd71837-regulator.c => bd718x7-regulator.c} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/regulator/{bd71837-regulator.c => bd718x7-regulator.c} (100%)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 329cdd33ed62..6e96ef1bd74a 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -189,7 +189,7 @@ config REGULATOR_BD718XX
 	  and LDO regulators.
 
 	  This driver can also be built as a module. If so, the module
-	  will be called bd71837-regulator.
+	  will be called bd718x7-regulator.
 
 config REGULATOR_BD9571MWV
 	tristate "ROHM BD9571MWV Regulators"
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 801d9a34a203..eac4d794f3b8 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_REGULATOR_AS3711) += as3711-regulator.o
 obj-$(CONFIG_REGULATOR_AS3722) += as3722-regulator.o
 obj-$(CONFIG_REGULATOR_AXP20X) += axp20x-regulator.o
 obj-$(CONFIG_REGULATOR_BCM590XX) += bcm590xx-regulator.o
-obj-$(CONFIG_REGULATOR_BD718XX) += bd71837-regulator.o
+obj-$(CONFIG_REGULATOR_BD718XX) += bd718x7-regulator.o
 obj-$(CONFIG_REGULATOR_BD9571MWV) += bd9571mwv-regulator.o
 obj-$(CONFIG_REGULATOR_DA903X)	+= da903x.o
 obj-$(CONFIG_REGULATOR_DA9052)	+= da9052-regulator.o
diff --git a/drivers/regulator/bd71837-regulator.c b/drivers/regulator/bd718x7-regulator.c
similarity index 100%
rename from drivers/regulator/bd71837-regulator.c
rename to drivers/regulator/bd718x7-regulator.c
-- 
2.14.3
