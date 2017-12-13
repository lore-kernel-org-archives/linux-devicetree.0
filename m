From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 3/5] arm64: dts: rockchip: add the aclk_usb3 clocks for
 USB3.
Date: Wed, 13 Dec 2017 11:32:17 +0100
Message-ID: <20171213103219.1464-3-enric.balletbo@collabora.com>
References: <20171213103219.1464-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171213103219.1464-1-enric.balletbo@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@google.com, linux-rockchip@lists.infradead.org, groeck@chromium.org, briannorris@google.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The aclk_usb3 must be enabled to support USB3 for rk3399.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Changes since v1:
 - Split the original patch in different commits

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 17e5e1a..f32e9c4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -397,9 +397,11 @@
 		#size-cells = <2>;
 		ranges;
 		clocks = <&cru SCLK_USB3OTG0_REF>, <&cru SCLK_USB3OTG0_SUSPEND>,
-			 <&cru ACLK_USB3OTG0>, <&cru ACLK_USB3_GRF>;
+			 <&cru ACLK_USB3OTG0>, <&cru ACLK_USB3_RKSOC_AXI_PERF>,
+			 <&cru ACLK_USB3>, <&cru ACLK_USB3_GRF>;
 		clock-names = "ref_clk", "suspend_clk",
-			      "bus_clk", "grf_clk";
+			      "bus_clk", "aclk_usb3_rksoc_axi_perf",
+			      "aclk_usb3", "grf_clk";
 		status = "disabled";
 
 		usbdrd_dwc3_0: dwc3 {
@@ -425,9 +427,11 @@
 		#size-cells = <2>;
 		ranges;
 		clocks = <&cru SCLK_USB3OTG1_REF>, <&cru SCLK_USB3OTG1_SUSPEND>,
-			 <&cru ACLK_USB3OTG1>, <&cru ACLK_USB3_GRF>;
+			 <&cru ACLK_USB3OTG1>, <&cru ACLK_USB3_RKSOC_AXI_PERF>,
+			 <&cru ACLK_USB3>, <&cru ACLK_USB3_GRF>;
 		clock-names = "ref_clk", "suspend_clk",
-			      "bus_clk", "grf_clk";
+			      "bus_clk", "aclk_usb3_rksoc_axi_perf",
+			      "aclk_usb3", "grf_clk";
 		status = "disabled";
 
 		usbdrd_dwc3_1: dwc3 {
-- 
2.9.3
