From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2,
 5/6] arm64: dts: mt8173: move clock from phy node into port nodes
Date: Fri, 20 Jan 2017 16:18:40 +0800
Message-ID: <1484900321-26933-5-git-send-email-chunfeng.yun@mediatek.com>
References: <1484900321-26933-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484900321-26933-1-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

there is a reference clock for each port, HighSpeed port is 48M,
and SuperSpeed port is 26M which usually comes from 26M oscillator
directly, but some SoCs is not. it is flexible to move it into port
node.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 1074ed2..2ee0863 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -755,8 +755,6 @@
 		u3phy: usb-phy@11290000 {
 			compatible = "mediatek,mt8173-u3phy";
 			reg = <0 0x11290000 0 0x800>;
-			clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
-			clock-names = "u3phya_ref";
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -764,18 +762,24 @@
 
 			u2port0: port@11290800 {
 				reg = <0 0x11290800 0 0x100>;
+				clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+				clock-names = "ref_clk";
 				#phy-cells = <1>;
 				status = "okay";
 			};
 
 			u3port0: port@11290900 {
 				reg = <0 0x11290900 0 0x700>;
+				clocks = <&clk26m>;
+				clock-names = "ref_clk";
 				#phy-cells = <1>;
 				status = "okay";
 			};
 
 			u2port1: port@11291000 {
 				reg = <0 0x11291000 0 0x100>;
+				clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+				clock-names = "ref_clk";
 				#phy-cells = <1>;
 				status = "okay";
 			};
-- 
1.7.9.5
