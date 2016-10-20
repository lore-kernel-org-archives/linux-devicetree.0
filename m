From: Randy Li <ayaka@soulik.info>
Subject: [PATCH v9 2/2] ARM: dts: rockchip: Point rk3288 dwc2 usb at the full PHY reset
Date: Fri, 21 Oct 2016 02:37:07 +0800
Message-ID: <1476988627-14953-3-git-send-email-ayaka@soulik.info>
References: <1476988627-14953-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476988627-14953-1-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: John.Youn@synopsys.com, kishon@ti.com, felipe.balbi@linux.intel.com, mark.rutland@arm.com, devicetree@vger.kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, randy.li@rock-chips.com, Randy Li <ayaka@soulik.info>
List-Id: devicetree@vger.kernel.org

The "host1" port (AKA the dwc2 port that isn't the OTG port) on rk3288
has a hardware errata that causes everything to get confused when we get
a remote wakeup.  We'll use the reset that's in the CRU to reset the
port when it's in a bad state.

Note that we add the reset to both dwc2 controllers even though only one
has the errata in case we find some other use for this reset that's
unrelated to the current hardware errata.  Only the host port gets the
quirk property, though.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 arch/arm/boot/dts/rk3288.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 2f814ff..4ef058c 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -859,6 +859,8 @@
 				clocks = <&cru SCLK_OTGPHY0>;
 				clock-names = "phyclk";
 				#clock-cells = <0>;
+				resets = <&cru SRST_USBOTG_PHY>;
+				reset-names = "phy-reset";
 			};
 
 			usbphy1: usb-phy@334 {
@@ -875,6 +877,8 @@
 				clocks = <&cru SCLK_OTGPHY2>;
 				clock-names = "phyclk";
 				#clock-cells = <0>;
+				resets = <&cru SRST_USBHOST1_PHY>;
+				reset-names = "phy-reset";
 			};
 		};
 	};
-- 
2.7.4
