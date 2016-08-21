From: Randy Li <ayaka@soulik.info>
Subject: [PATCH 4/4] ARM: dts: rockchip: Point rk3288 dwc2 usb at the full PHY reset
Date: Sun, 21 Aug 2016 15:56:45 +0800
Message-ID: <1471766205-12940-5-git-send-email-ayaka@soulik.info>
References: <4c931176-a09a-546c-d2b6-ea74028c78a2@cogentembedded.com>
 <1471766205-12940-1-git-send-email-ayaka@soulik.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471766205-12940-1-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: johnyoun@synopsys.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, eddie.cai@rock-chips.com, randy.li@rock-chips.com, kishon@ti.com, linux-kernel@vger.kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org, Randy Li <ayaka@soulik.info>
List-Id: devicetree@vger.kernel.org

The "host1" port (AKA the dwc2 port that isn't the OTG port) on rk3288
has a hardware errata that causes everything to get confused when we get
a remote wakeup.  We'll use the reset that's in the CRU to reset the
port when it's in a bad state.

Note that we add the reset to both dwc2 controllers even though only one
has the errata in case we find some other use for this reset that's
unrelated to the current hardware errata.  Only the host port gets the
quirk property, though.

This patch came from Doug Anderson <dianders@chromium.org> originally.

Signed-off-by: Randy Li <ayaka@soulik.info>
---
 arch/arm/boot/dts/rk3288.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 48ca4e4..646f49d 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -855,6 +855,8 @@
 				clocks = <&cru SCLK_OTGPHY0>;
 				clock-names = "phyclk";
 				#clock-cells = <0>;
+				resets = <&cru SRST_USBOTG_PHY>;
+				reset-names = "phy-reset";
 			};
 
 			usbphy1: usb-phy@334 {
@@ -871,6 +873,9 @@
 				clocks = <&cru SCLK_OTGPHY2>;
 				clock-names = "phyclk";
 				#clock-cells = <0>;
+				resets = <&cru SRST_USBHOST1_PHY>;
+				reset-names = "phy-reset";
+
 			};
 		};
 	};
-- 
2.7.4
