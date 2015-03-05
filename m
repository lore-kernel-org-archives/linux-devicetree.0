From: Axel Lin <axel.lin@ingics.com>
Subject: [RFC][PATCH 2/2] phy: miphy365x: Convert to use phy.h instead of
 phy-miphy365x.h
Date: Thu, 05 Mar 2015 09:57:45 +0800
Message-ID: <1425520665.1637.10.camel@phoenix>
References: <1425520379.1637.7.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425520379.1637.7.camel@phoenix>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Lee Jones <lee.jones@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

The defines in phy-miphy365x.h are all covered in phy.h:

MIPHY_TYPE_SATA == PHY_TYPE_STA
MIPHY_TYPE_PCIE == PHY_TYPE_PCIE
MIPPHY_TYPE_USB == PHY_TYPE_USB2

So covert to use phy.h and then delete phy-miphy365x.h.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 Documentation/devicetree/bindings/ata/ahci-st.txt       |  2 +-
 Documentation/devicetree/bindings/phy/phy-miphy365x.txt |  8 ++++----
 arch/arm/boot/dts/stih416.dtsi                          |  4 ++--
 drivers/phy/phy-miphy365x.c                             | 14 +++++++-------
 include/dt-bindings/phy/phy-miphy365x.h                 | 14 --------------
 5 files changed, 14 insertions(+), 28 deletions(-)
 delete mode 100644 include/dt-bindings/phy/phy-miphy365x.h

diff --git a/Documentation/devicetree/bindings/ata/ahci-st.txt b/Documentation/devicetree/bindings/ata/ahci-st.txt
index 0574a77..070748b 100644
--- a/Documentation/devicetree/bindings/ata/ahci-st.txt
+++ b/Documentation/devicetree/bindings/ata/ahci-st.txt
@@ -21,7 +21,7 @@ Example:
 		reg             = <0xfe380000 0x1000>;
 		interrupts      = <GIC_SPI 157 IRQ_TYPE_NONE>;
 		interrupt-names = "hostc";
-		phys	        = <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
+		phys	        = <&miphy365x_phy MIPHY_PORT_0 PHY_TYPE_SATA>;
 		phy-names       = "ahci_phy";
 		resets	        = <&powerdown STIH416_SATA0_POWERDOWN>,
 				  <&softreset STIH416_SATA0_SOFTRESET>;
diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
index 9802d5d..087294d 100644
--- a/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
+++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
@@ -20,8 +20,8 @@ Required nodes	:  A sub-node is required for each channel the controller
 Required properties (port (child) node):
 - #phy-cells 	: Should be 1 (See second example)
 		  Cell after port phandle is device type from:
-			- MIPHY_TYPE_SATA
-			- MIPHY_TYPE_PCI
+			- PHY_TYPE_SATA
+			- PHY_TYPE_PCIE
 - reg        	: Address and length of register sets for each device in
 		  "reg-names"
 - reg-names     : The names of the register addresses corresponding to the
@@ -68,10 +68,10 @@ property, containing a phandle to the phy port node and a device type.
 
 Example:
 
-#include <dt-bindings/phy/phy-miphy365x.h>
+#include <dt-bindings/phy/phy.h>
 
 	sata0: sata@fe380000 {
 		...
-		phys	  = <&phy_port0 MIPHY_TYPE_SATA>;
+		phys	  = <&phy_port0 PHY_TYPE_SATA>;
 		...
 	};
diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index ea28eba..eeb7afe 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -10,7 +10,7 @@
 #include "stih416-clock.dtsi"
 #include "stih416-pinctrl.dtsi"
 
-#include <dt-bindings/phy/phy-miphy365x.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset-controller/stih416-resets.h>
 / {
@@ -306,7 +306,7 @@
 			reg             = <0xfe380000 0x1000>;
 			interrupts      = <GIC_SPI 157 IRQ_TYPE_NONE>;
 			interrupt-names = "hostc";
-			phys	        = <&phy_port0 MIPHY_TYPE_SATA>;
+			phys	        = <&phy_port0 PHY_TYPE_SATA>;
 			phy-names       = "sata-phy";
 			resets	        = <&powerdown STIH416_SATA0_POWERDOWN>,
 					  <&softreset STIH416_SATA0_SOFTRESET>;
diff --git a/drivers/phy/phy-miphy365x.c b/drivers/phy/phy-miphy365x.c
index 51b459d..019c2d7 100644
--- a/drivers/phy/phy-miphy365x.c
+++ b/drivers/phy/phy-miphy365x.c
@@ -25,7 +25,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/phy/phy-miphy365x.h>
+#include <dt-bindings/phy/phy.h>
 
 #define HFC_TIMEOUT		100
 
@@ -177,7 +177,7 @@ static u8 rx_tx_spd[] = {
 static int miphy365x_set_path(struct miphy365x_phy *miphy_phy,
 			      struct miphy365x_dev *miphy_dev)
 {
-	bool sata = (miphy_phy->type == MIPHY_TYPE_SATA);
+	bool sata = (miphy_phy->type == PHY_TYPE_SATA);
 
 	return regmap_update_bits(miphy_dev->regmap,
 				  miphy_phy->ctrlreg,
@@ -431,7 +431,7 @@ static int miphy365x_init(struct phy *phy)
 	}
 
 	/* Initialise Miphy for PCIe or SATA */
-	if (miphy_phy->type == MIPHY_TYPE_PCIE)
+	if (miphy_phy->type == PHY_TYPE_PCIE)
 		ret = miphy365x_init_pcie_port(miphy_phy, miphy_dev);
 	else
 		ret = miphy365x_init_sata_port(miphy_phy, miphy_dev);
@@ -455,8 +455,8 @@ int miphy365x_get_addr(struct device *dev, struct miphy365x_phy *miphy_phy,
 		return ret;
 	}
 
-	if (!((!strncmp(name, "sata", 4) && type == MIPHY_TYPE_SATA) ||
-	      (!strncmp(name, "pcie", 4) && type == MIPHY_TYPE_PCIE)))
+	if (!((!strncmp(name, "sata", 4) && type == PHY_TYPE_SATA) ||
+	      (!strncmp(name, "pcie", 4) && type == PHY_TYPE_PCIE)))
 		return 0;
 
 	miphy_phy->base = of_iomap(phynode, index);
@@ -499,8 +499,8 @@ static struct phy *miphy365x_xlate(struct device *dev,
 
 	miphy_phy->type = args->args[0];
 
-	if (!(miphy_phy->type == MIPHY_TYPE_SATA ||
-	      miphy_phy->type == MIPHY_TYPE_PCIE)) {
+	if (!(miphy_phy->type == PHY_TYPE_SATA ||
+	      miphy_phy->type == PHY_TYPE_PCIE)) {
 		dev_err(dev, "Unsupported device type: %d\n", miphy_phy->type);
 		return ERR_PTR(-EINVAL);
 	}
diff --git a/include/dt-bindings/phy/phy-miphy365x.h b/include/dt-bindings/phy/phy-miphy365x.h
deleted file mode 100644
index 8ef8aba..0000000
--- a/include/dt-bindings/phy/phy-miphy365x.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * This header provides constants for the phy framework
- * based on the STMicroelectronics MiPHY365x.
- *
- * Author: Lee Jones <lee.jones@linaro.org>
- */
-#ifndef _DT_BINDINGS_PHY_MIPHY
-#define _DT_BINDINGS_PHY_MIPHY
-
-#define MIPHY_TYPE_SATA		1
-#define MIPHY_TYPE_PCIE		2
-#define MIPPHY_TYPE_USB		3
-
-#endif /* _DT_BINDINGS_PHY_MIPHY */
-- 
1.9.1
