From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 4/4] ipmi: bt-bmc: move Aspeed IPMI BMC driver to ipmi_bmc
Date: Fri,  4 Aug 2017 18:18:55 -0700
Message-ID: <20170805011855.1027-5-brendanhiggins@google.com>
References: <20170805011855.1027-1-brendanhiggins@google.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20170805011855.1027-1-brendanhiggins@google.com>
Sender: linux-doc-owner@vger.kernel.org
To: corbet@lwn.net, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, minyard@acm.org, joel@jms.id.au, benh@kernel.crashing.org, benjaminfair@google.com
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org, openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
List-Id: devicetree@vger.kernel.org

From: Benjamin Fair <benjaminfair@google.com>

The ipmi_bmc folder contains drivers for a BMC to communicate using
IPMI. The ipmi folder is only for drivers on the host side using the
OpenIPMI framework.

Signed-off-by: Benjamin Fair <benjaminfair@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Added in v2:
---
 drivers/char/ipmi/Kconfig                                     | 9 ---------
 drivers/char/ipmi/Makefile                                    | 1 -
 drivers/char/ipmi_bmc/Kconfig                                 | 9 +++++++++
 drivers/char/ipmi_bmc/Makefile                                | 1 +
 drivers/char/{ipmi/bt-bmc.c => ipmi_bmc/ipmi_bmc_bt_aspeed.c} | 0
 5 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/char/{ipmi/bt-bmc.c => ipmi_bmc/ipmi_bmc_bt_aspeed.c} (100%)

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index a8734a369cb0..09ce9f64abf8 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -84,12 +84,3 @@ config IPMI_BT_I2C
 	tristate 'BT IPMI bmc driver over I2c'
 
 endif # IPMI_HANDLER
-
-config ASPEED_BT_IPMI_BMC
-	depends on ARCH_ASPEED || COMPILE_TEST
-       depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
-	tristate "BT IPMI bmc driver"
-	help
-	  Provides a driver for the BT (Block Transfer) IPMI interface
-	  found on Aspeed SOCs (AST2400 and AST2500). The driver
-	  implements the BMC side of the BT interface.
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 323de0b0b8b5..f0b5672cdca9 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -13,4 +13,3 @@ obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
 obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
 obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
 obj-$(CONFIG_IPMI_BT_I2C) += ipmi_bt_i2c.o
-obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
diff --git a/drivers/char/ipmi_bmc/Kconfig b/drivers/char/ipmi_bmc/Kconfig
index 26c8e0cb765c..b6af38455702 100644
--- a/drivers/char/ipmi_bmc/Kconfig
+++ b/drivers/char/ipmi_bmc/Kconfig
@@ -19,4 +19,13 @@ config IPMI_BMC_BT_I2C
 	  Provides a driver that uses IPMI Block Transfer messages and
 	  semantics on top of plain old I2C.
 
+config ASPEED_BT_IPMI_BMC
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
+	tristate "BT IPMI bmc driver"
+	help
+	  Provides a driver for the BT (Block Transfer) IPMI interface
+	  found on Aspeed SOCs (AST2400 and AST2500). The driver
+	  implements the BMC side of the BT interface.
+
 endif # IPMI_BMC
diff --git a/drivers/char/ipmi_bmc/Makefile b/drivers/char/ipmi_bmc/Makefile
index dfe5128f8158..8bff32b55c24 100644
--- a/drivers/char/ipmi_bmc/Makefile
+++ b/drivers/char/ipmi_bmc/Makefile
@@ -3,3 +3,4 @@
 #
 
 obj-$(CONFIG_IPMI_BMC_BT_I2C) += ipmi_bmc_bt_i2c.o
+obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += ipmi_bmc_bt_aspeed.o
diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi_bmc/ipmi_bmc_bt_aspeed.c
similarity index 100%
rename from drivers/char/ipmi/bt-bmc.c
rename to drivers/char/ipmi_bmc/ipmi_bmc_bt_aspeed.c
-- 
2.14.0.rc1.383.gd1ce394fe2-goog

