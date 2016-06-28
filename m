From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] ARM: dts: sun7i: Fix pll3x2 and pll7x2 not having a parent
 clock
Date: Tue, 28 Jun 2016 22:11:14 +0200
Message-ID: <1467144674-21322-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org

Fix pll3x2 and pll7x2 not having a parent clock, specifically this
fixes the kernel turning of pll3 while simplefb is using it when
uboot has configured things to use pll3x2 as lcd ch clk parent.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 1ae54d1..1146197 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -234,6 +234,7 @@
 		pll3x2: pll3x2_clk {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
+			clocks = <&pll3>;
 			clock-div = <1>;
 			clock-mult = <2>;
 			clock-output-names = "pll3-2x";
@@ -275,6 +276,7 @@
 		pll7x2: pll7x2_clk {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
+			clocks = <&pll7>;
 			clock-div = <1>;
 			clock-mult = <2>;
 			clock-output-names = "pll7-2x";
-- 
2.7.4
