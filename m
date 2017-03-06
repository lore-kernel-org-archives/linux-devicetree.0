From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RESEND PATCH v3 7/8] arm64: dts: mt8173: move clock from phy node
 into port nodes
Date: Mon, 6 Mar 2017 21:49:28 +0800
Message-ID: <1488808169-6031-7-git-send-email-chunfeng.yun@mediatek.com>
References: <1488808169-6031-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488808169-6031-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

there is a reference clock for each port, HighSpeed port is 48M,
and SuperSpeed port is 26M which usually comes from 26M oscillator
directly, but some SoCs is not. it is flexible to move it into port
node.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 1dc4629..1c9e0d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -764,8 +764,6 @@
 		u3phy: usb-phy@11290000 {
 			compatible = "mediatek,mt8173-u3phy";
 			reg = <0 0x11290000 0 0x800>;
-			clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
-			clock-names = "u3phya_ref";
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -773,18 +771,24 @@
 
 			u2port0: usb-phy@11290800 {
 				reg = <0 0x11290800 0 0x100>;
+				clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+				clock-names = "ref";
 				#phy-cells = <1>;
 				status = "okay";
 			};
 
 			u3port0: usb-phy@11290900 {
 				reg = <0 0x11290900 0 0x700>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
 				#phy-cells = <1>;
 				status = "okay";
 			};
 
 			u2port1: usb-phy@11291000 {
 				reg = <0 0x11291000 0 0x100>;
+				clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+				clock-names = "ref";
 				#phy-cells = <1>;
 				status = "okay";
 			};
-- 
1.7.9.5
