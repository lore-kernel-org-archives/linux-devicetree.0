From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 5/5] arm64: dts: rockchip: add reset property for dwc3 controllers on rk3399.
Date: Fri, 15 Dec 2017 12:00:05 +0100
Message-ID: <20171215110005.7564-5-enric.balletbo@collabora.com>
References: <20171215110005.7564-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215110005.7564-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: dianders@google.com, groeck@chromium.org, briannorris@google.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

After commit '06c47e6286d usb: dwc3: of-simple: Add support to get resets
for the device' you can add the reset property to the dwc3 node, the reset
is required for the controller to work properly, otherwise bind / unbind
stress testing of the USB controller on rk3399 we'd often end up with lots
of failures that looked like this:

  phy phy-ff800000.phy.9: phy poweron failed --> -110
  dwc3 fe900000.dwc3: failed to initialize core
  dwc3: probe of fe900000.dwc3 failed with error -110

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Changes since v1:
 - This patch did not exists in the series.
Changes since v2:
 - Introduced this patch

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index c18ff88..83f0f71 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -402,6 +402,8 @@
 		clock-names = "ref_clk", "suspend_clk",
 			      "bus_clk", "aclk_usb3_rksoc_axi_perf",
 			      "aclk_usb3", "grf_clk";
+		resets = <&cru SRST_A_USB3_OTG0>;
+		reset-names = "usb3-otg";
 		status = "disabled";
 
 		usbdrd_dwc3_0: dwc3 {
@@ -433,6 +435,8 @@
 		clock-names = "ref_clk", "suspend_clk",
 			      "bus_clk", "aclk_usb3_rksoc_axi_perf",
 			      "aclk_usb3", "grf_clk";
+		resets = <&cru SRST_A_USB3_OTG1>;
+		reset-names = "usb3-otg";
 		status = "disabled";
 
 		usbdrd_dwc3_1: dwc3 {
-- 
2.9.3
