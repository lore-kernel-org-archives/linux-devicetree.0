From: "jeffrey.lin" <yajohn@gmail.com>
Subject: [PATCH] dt-bindings: input: add Raydium I2C touch bindings
Date: Fri, 25 Mar 2016 11:32:37 +0800
Message-ID: <1458876757-2773-1-git-send-email-jeffrey.lin@rad-ic.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, dmitry.torokhov@gmail.com, treding@nvidia.com, bleung@chromium.org, djkurtz@chromium.org, drinkcat@chromium.org, ajaykumar.rs@samsung.com, dusonlin@emc.com.tw, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jeffrey.lin@rad-ic.com, roger.yang@rad-ic.com, KP.li@rad-ic.com, albert.shieh@rad-ic.com
List-Id: devicetree@vger.kernel.org

Document the device tree binfings of Raydium I2C touch.

Signed-off-by: jeffrey.lin <jeffrey.lin@rad-ic.com>
---
 .../devicetree/bindings/input/raydium_i2c_ts.txt     | 20 ++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt          |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/raydium_i2c_ts.txt

diff --git a/Documentation/devicetree/bindings/input/raydium_i2c_ts.txt b/Documentation/devicetree/bindings/input/raydium_i2c_ts.txt
new file mode 100644
index 0000000..52a7bf0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/raydium_i2c_ts.txt
@@ -0,0 +1,20 @@
+Raydium I2C touchscreen
+
+Required properties:
+- compatible : must be "raydium,rm32380"
+- reg: The I2C address of the device
+- interrupt-parent: the phandle for the interrupt controller
+- interrupts: interrupt to which the chip is connected
+    See ../interrupt-controller/interrupts.txt
+Optional properties:
+- avdd-supply : analog power supply needed to power device
+- vccio-supply : IO Power source
+- reset-gpios : reset gpio the chip is connected to.
+
+Example:
+	raydium_i2c@39 {
+		compatible = "raydium,rm32380";
+		reg = <0x39>;
+		interrupt-parent = <&gpio>;
+		interrupts = <0x0 IRQ_TYPE_EDGE_FALLING>;
+	};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index af49e0f..5b6224b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -126,6 +126,7 @@ radxa	Radxa
 raidsonic	RaidSonic Technology GmbH
 ralink	Mediatek/Ralink Technology Corp.
 ramtron	Ramtron International
+raydium Raydium Semiconductor Corp.
 realtek Realtek Semiconductor Corp.
 renesas	Renesas Electronics Corporation
 ricoh	Ricoh Co. Ltd.
-- 
2.1.2
