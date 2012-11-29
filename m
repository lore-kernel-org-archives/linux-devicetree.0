From: Qing Xu <qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 7/7] mfd: max8925: add dts
Date: Thu, 29 Nov 2012 11:35:20 +0800
Message-ID: <1354160120-1923-1-git-send-email-qingx@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, cxie4-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Qing Xu <qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

add max8925 dts support into mmp2 brownstone platform

Signed-off-by: Qing Xu <qingx-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/mmp2-brownstone.dts |  158 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mmp2.dtsi           |    4 +-
 2 files changed, 161 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2-brownstone.dts b/arch/arm/boot/dts/mmp2-brownstone.dts
index c9b4f27..f03d4f4 100644
--- a/arch/arm/boot/dts/mmp2-brownstone.dts
+++ b/arch/arm/boot/dts/mmp2-brownstone.dts
@@ -29,6 +29,164 @@
 			};
 			twsi1: i2c@d4011000 {
 				status = "okay";
+				pmic: max8925@3c {
+					compatible = "maxim,max8925";
+					reg = <0x3c>;
+					interrupts = <1>;
+					interrupt-parent = <&intcmux4>;
+					interrupt-controller;
+					#interrupt-cells = <1>;
+					tsc-irq = <0>;
+
+					regulators {
+						SDV1 {
+							regulator-min-microvolt = <637500>;
+							regulator-max-microvolt = <1425000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						SDV2 {
+							regulator-min-microvolt = <650000>;
+							regulator-max-microvolt = <2225000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						SDV3 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO1 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO2 {
+							regulator-min-microvolt = <650000>;
+							regulator-max-microvolt = <2250000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO3 {
+							regulator-min-microvolt = <650000>;
+							regulator-max-microvolt = <2250000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO4 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO5 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO6 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO7 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO8 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO9 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO10 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+						};
+						LDO11 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO12 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO13 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO14 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO15 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO16 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO17 {
+							regulator-min-microvolt = <650000>;
+							regulator-max-microvolt = <2250000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO18 {
+							regulator-min-microvolt = <650000>;
+							regulator-max-microvolt = <2250000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO19 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+						LDO20 {
+							regulator-min-microvolt = <750000>;
+							regulator-max-microvolt = <3900000>;
+							regulator-boot-on;
+							regulator-always-on;
+						};
+					};
+					backlight {
+						max8925-dual-string = <0>;
+					};
+					charger {
+						batt-detect = <0>;
+						topoff-threshold = <1>;
+						fast-charge = <7>;
+						no-temp-support = <0>;
+						no-insert-detect = <0>;
+					};
+				};
 			};
 			rtc: rtc@d4010000 {
 				status = "okay";
diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 80f74e2..76f9cc7 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -41,7 +41,7 @@
 				mrvl,intc-nr-irqs = <64>;
 			};
 
-			intcmux4@d4282150 {
+			intcmux4: interrupt-controller@d4282150 {
 				compatible = "mrvl,mmp2-mux-intc";
 				interrupts = <4>;
 				interrupt-controller;
@@ -196,6 +196,8 @@
 				compatible = "mrvl,mmp-twsi";
 				reg = <0xd4011000 0x1000>;
 				interrupts = <7>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				mrvl,i2c-fast-mode;
 				status = "disabled";
 			};
-- 
1.7.0.4
