From: Matt Porter <matt.porter@linaro.org>
Subject: [PATCH v3 7/9] phy: add Broadcom Kona USB2 PHY DT binding
Date: Mon, 25 Nov 2013 13:16:05 -0500
Message-ID: <1385403367-18144-8-git-send-email-matt.porter@linaro.org>
References: <1385403367-18144-1-git-send-email-matt.porter@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385403367-18144-1-git-send-email-matt.porter@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Christian Daudt <bcm@fixthebug.org>, Paul Zimmerman <paulz@synopsys.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>
List-Id: devicetree@vger.kernel.org

Add a binding that describes the Broadcom Kona USB2 PHY found
on the BCM281xx family of SoCs.

Signed-off-by: Matt Porter <matt.porter@linaro.org>
---
 .../devicetree/bindings/phy/bcm-kona-usb2-phy.txt         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/bcm-kona-usb2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/bcm-kona-usb2-phy.txt b/Documentation/devicetree/bindings/phy/bcm-kona-usb2-phy.txt
new file mode 100644
index 0000000..3dc8b3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/bcm-kona-usb2-phy.txt
@@ -0,0 +1,15 @@
+BROADCOM KONA USB2 PHY
+
+Required properties:
+ - compatible: brcm,kona-usb2-phy
+ - reg: offset and length of the PHY registers
+ - #phy-cells: must be 0
+Refer to phy/phy-bindings.txt for the generic PHY binding properties
+
+Example:
+
+	usbphy: usb-phy@3f130000 {
+		compatible = "brcm,kona-usb2-phy";
+		reg = <0x3f130000 0x28>;
+		#phy-cells = <0>;
+	};
-- 
1.8.4
