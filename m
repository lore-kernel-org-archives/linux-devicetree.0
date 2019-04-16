From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 3/4] ARM: dts: rockchip: Hook resets up to USB PHYs on rk3288.
Date: Tue, 16 Apr 2019 14:53:50 -0700
Message-ID: <20190416215351.242246-4-dianders@chromium.org>
References: <20190416215351.242246-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416215351.242246-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: amstan@chromium.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>, mka@chromium.org, ryandcase@chromium.org, jwerner@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Let's hook up the resets to the three USB PHYs on rk3288 as per the
bindings.  This is in preparation for a future patch that will set the
"snps,reset-phy-on-wake" on the host port.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2: None

 arch/arm/boot/dts/rk3288.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 74c9517c4f92..7e70ecf2b95a 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -909,6 +909,8 @@
 				clocks = <&cru SCLK_OTGPHY0>;
 				clock-names = "phyclk";
 				#clock-cells = <0>;
+				resets = <&cru SRST_USBOTG_PHY>;
+				reset-names = "phy-reset";
 			};
 
 			usbphy1: usb-phy@334 {
@@ -917,6 +919,8 @@
 				clocks = <&cru SCLK_OTGPHY1>;
 				clock-names = "phyclk";
 				#clock-cells = <0>;
+				resets = <&cru SRST_USBHOST0_PHY>;
+				reset-names = "phy-reset";
 			};
 
 			usbphy2: usb-phy@348 {
@@ -925,6 +929,8 @@
 				clocks = <&cru SCLK_OTGPHY2>;
 				clock-names = "phyclk";
 				#clock-cells = <0>;
+				resets = <&cru SRST_USBHOST1_PHY>;
+				reset-names = "phy-reset";
 			};
 		};
 	};
-- 
2.21.0.593.g511ec345e18-goog
