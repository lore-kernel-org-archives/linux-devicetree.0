From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [v2 PATCH 6/6] arm64: dts: mt8173: update properties about USB wakeup
Date: Wed, 3 Jan 2018 16:53:22 +0800
Message-ID: <10e220e2456f620442cd52c25fcda009dbbb653c.1514967463.git.chunfeng.yun@mediatek.com>
References: <41c6b0f2e959c07eff261060e57fd180a750071a.1514967463.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <41c6b0f2e959c07eff261060e57fd180a750071a.1514967463.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use new binding about USB wakeup which now supports multi USB
wakeup glue layer between SSUSB and SPM.
Meanwhile remove dummy clocks of USB wakeup.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts |  2 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 12 +++---------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 1c3634f..0acba1f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -505,7 +505,7 @@
 	vbus-supply = <&usb_p0_vbus>;
 	extcon = <&extcon_usb>;
 	dr_mode = "otg";
-	mediatek,enable-wakeup;
+	wakeup-source;
 	pinctrl-names = "default", "id_float", "id_ground";
 	pinctrl-0 = <&usb_id_pins_float>;
 	pinctrl-1 = <&usb_id_pins_float>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 26396ef..9263d9f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -731,15 +731,9 @@
 			       <&u3port0 PHY_TYPE_USB3>,
 			       <&u2port1 PHY_TYPE_USB2>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
-			clocks = <&topckgen CLK_TOP_USB30_SEL>,
-				 <&clk26m>,
-				 <&pericfg CLK_PERI_USB0>,
-				 <&pericfg CLK_PERI_USB1>;
-			clock-names = "sys_ck",
-				      "ref_ck",
-				      "wakeup_deb_p0",
-				      "wakeup_deb_p1";
-			mediatek,syscon-wakeup = <&pericfg>;
+			clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
+			clock-names = "sys_ck", "ref_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x400 1>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-- 
1.9.1
