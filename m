From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 5/6] ARM: dts: sunxi: h3/h5: Remove useless phy-names from
 EHCI and OHCI
Date: Tue, 16 Apr 2019 10:28:01 +0200
Message-ID: <0fde1ca2c173ff124aa55811ed066ae215734eb0.1555403233.git-series.maxime.ripard@bootlin.com>
References: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, linux-usb@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Neither the OHCI or EHCI bindings are using the phy-names property, so we
can just drop it.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 3b18fd71efc1..84977d4eb97a 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -304,7 +304,6 @@
 			clocks = <&ccu CLK_BUS_EHCI1>, <&ccu CLK_BUS_OHCI1>;
 			resets = <&ccu RST_BUS_EHCI1>, <&ccu RST_BUS_OHCI1>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -316,7 +315,6 @@
 				 <&ccu CLK_USB_OHCI1>;
 			resets = <&ccu RST_BUS_EHCI1>, <&ccu RST_BUS_OHCI1>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -327,7 +325,6 @@
 			clocks = <&ccu CLK_BUS_EHCI2>, <&ccu CLK_BUS_OHCI2>;
 			resets = <&ccu RST_BUS_EHCI2>, <&ccu RST_BUS_OHCI2>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -339,7 +336,6 @@
 				 <&ccu CLK_USB_OHCI2>;
 			resets = <&ccu RST_BUS_EHCI2>, <&ccu RST_BUS_OHCI2>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -350,7 +346,6 @@
 			clocks = <&ccu CLK_BUS_EHCI3>, <&ccu CLK_BUS_OHCI3>;
 			resets = <&ccu RST_BUS_EHCI3>, <&ccu RST_BUS_OHCI3>;
 			phys = <&usbphy 3>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -362,7 +357,6 @@
 				 <&ccu CLK_USB_OHCI3>;
 			resets = <&ccu RST_BUS_EHCI3>, <&ccu RST_BUS_OHCI3>;
 			phys = <&usbphy 3>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
-- 
git-series 0.9.1
