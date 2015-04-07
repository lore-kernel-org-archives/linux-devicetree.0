From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V2 1/3] phy: Add binding document for Pistachio USB2.0 PHY
Date: Tue,  7 Apr 2015 15:04:16 -0700
Message-ID: <1428444258-25852-2-git-send-email-abrestic@chromium.org>
References: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add a binding document for the USB2.0 PHY found on the IMG Pistachio SoC.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
No changes from v1.
---
 .../devicetree/bindings/phy/pistachio-usb-phy.txt  | 29 ++++++++++++++++++++++
 include/dt-bindings/phy/phy-pistachio-usb.h        | 16 ++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
 create mode 100644 include/dt-bindings/phy/phy-pistachio-usb.h

diff --git a/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
new file mode 100644
index 0000000..afbc7e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
@@ -0,0 +1,29 @@
+IMG Pistachio USB PHY
+=====================
+
+Required properties:
+--------------------
+ - compatible: Must be "img,pistachio-usb-phy".
+ - #phy-cells: Must be 0.  See ./phy-bindings.txt for details.
+ - clocks: Must contain an entry for each entry in clock-names.
+   See ../clock/clock-bindings.txt for details.
+ - clock-names: Must include "usb_phy".
+ - img,cr-top: Must constain a phandle to the CR_TOP syscon node.
+ - img,refclk: Indicates the reference clock source for the USB PHY.
+   See <dt-bindings/phy/phy-pistachio-usb.h> for a list of valid values.
+
+Optional properties:
+--------------------
+ - phy-supply: USB VBUS supply.  Must supply 5.0V.
+
+Example:
+--------
+usb_phy: usb-phy {
+	compatible = "img,pistachio-usb-phy";
+	clocks = <&clk_core CLK_USB_PHY>;
+	clock-names = "usb_phy";
+	phy-supply = <&usb_vbus>;
+	img,refclk = <REFCLK_CLK_CORE>;
+	img,cr-top = <&cr_top>;
+	#phy-cells = <0>;
+};
diff --git a/include/dt-bindings/phy/phy-pistachio-usb.h b/include/dt-bindings/phy/phy-pistachio-usb.h
new file mode 100644
index 0000000..d1877aa
--- /dev/null
+++ b/include/dt-bindings/phy/phy-pistachio-usb.h
@@ -0,0 +1,16 @@
+/*
+ * Copyright (C) 2015 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ */
+
+#ifndef _DT_BINDINGS_PHY_PISTACHIO
+#define _DT_BINDINGS_PHY_PISTACHIO
+
+#define REFCLK_XO_CRYSTAL	0x0
+#define REFCLK_X0_EXT_CLK	0x1
+#define REFCLK_CLK_CORE		0x2
+
+#endif /* _DT_BINDINGS_PHY_PISTACHIO */
-- 
2.2.0.rc0.207.ga3a616c
