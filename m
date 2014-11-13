From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v4 3/7] Phy: DT binding documentation for the Armada 375 USB cluster binding
Date: Thu, 13 Nov 2014 12:47:45 +0100
Message-ID: <1415879269-29711-4-git-send-email-gregory.clement@free-electrons.com>
References: <1415879269-29711-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415879269-29711-1-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Armada 375 comes with an USB2 host and device controller and an USB3
controller. The USB cluster control register allows to manage common
features of both USB controllers. This commit adds the Device Tree
binding documentation for this piece of hardware.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 Documentation/devicetree/bindings/phy/phy-mvebu.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-mvebu.txt b/Documentation/devicetree/bindings/phy/phy-mvebu.txt
index 6cb3364aeafb..f95b6260a3b3 100644
--- a/Documentation/devicetree/bindings/phy/phy-mvebu.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mvebu.txt
@@ -20,3 +20,24 @@ Example:
 			#phy-cells = <0>;
 			status = "ok";
 		};
+
+Armada 375 USB cluster
+----------------------
+
+Armada 375 comes with an USB2 host and device controller and an USB3
+controller. The USB cluster control register allows to manage common
+features of both USB controllers.
+
+Required properties:
+
+- compatible: "marvell,armada-375-usb-cluster"
+- reg: Should contain usb cluster register location and length.
+- #phy-cells : from the generic phy bindings, must be 1. Possible
+values are 1 (USB2), 2 (USB3).
+
+Example:
+		usbcluster: usb-cluster@18400 {
+			compatible = "marvell,armada-375-usb-cluster";
+			reg = <0x18400 0x4>;
+			#phy-cells = <1>
+		};
-- 
1.9.1
