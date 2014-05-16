From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 3/5] ARM: mvebu: add Device Tree description of USB cluster controller on Armada 375
Date: Fri, 16 May 2014 18:22:54 +0200
Message-ID: <1400257376-13251-3-git-send-email-gregory.clement@free-electrons.com>
References: <1400257376-13251-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400257376-13251-1-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Armada 375, the USB cluster allows to control the cluster composed
of the USB2 and USB3 host controllers.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/boot/dts/armada-375.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/armada-375.dtsi b/arch/arm/boot/dts/armada-375.dtsi
index 53baeb2f1fe8..31b3ac0f9c77 100644
--- a/arch/arm/boot/dts/armada-375.dtsi
+++ b/arch/arm/boot/dts/armada-375.dtsi
@@ -293,6 +293,12 @@
 				#clock-cells = <1>;
 			};
 
+			usbcluster: usb-cluster@18400 {
+				compatible = "marvell,armada-375-usb-cluster";
+				reg = <0x18400 0x4>;
+				#phy-cells = <1>;
+			};
+
 			mbusc: mbus-controller@20000 {
 				compatible = "marvell,mbus-controller";
 				reg = <0x20000 0x100>, <0x20180 0x20>;
-- 
1.8.1.2
