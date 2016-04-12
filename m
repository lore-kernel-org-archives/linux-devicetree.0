From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 07/13] ARM: dts: db600c: add usb support
Date: Tue, 12 Apr 2016 10:33:56 +0100
Message-ID: <1460453642-5809-8-git-send-email-srinivas.kandagatla@linaro.org>
References: <1460453642-5809-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1460453642-5809-1-git-send-email-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds usb host and otg support on board with required
regulators.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts | 64 +++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
index d921424..2c563df 100644
--- a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
@@ -58,6 +58,12 @@
 					bias-pull-down;
 				};
 
+				s3 {
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1400000>;
+					qcom,switch-mode-frequency = <4800000>;
+				};
+
 				s4 {
 					regulator-min-microvolt	= <1800000>;
 					regulator-max-microvolt	= <1800000>;
@@ -72,6 +78,18 @@
 					qcom,switch-mode-frequency = <3200000>;
 				 };
 
+				l3 {
+					regulator-min-microvolt = <3050000>;
+					regulator-max-microvolt = <3300000>;
+					bias-pull-down;
+				};
+
+				l4 {
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1800000>;
+					bias-pull-down;
+				};
+
 				l5 {
 					regulator-min-microvolt = <2750000>;
 					regulator-max-microvolt = <3000000>;
@@ -85,6 +103,12 @@
 					regulator-max-microvolt = <2950000>;
 					bias-pull-down;
 				};
+
+				l23 {
+					regulator-min-microvolt = <1700000>;
+					regulator-max-microvolt = <1900000>;
+					bias-pull-down;
+				};
 			};
 		};
 
@@ -111,6 +135,46 @@
 			};
 		};
 
+		/* OTG */
+		phy@12500000 {
+			status		= "okay";
+			dr_mode		= "peripheral";
+			vddcx-supply	= <&pm8921_s3>;
+			v3p3-supply	= <&pm8921_l3>;
+			v1p8-supply	= <&pm8921_l4>;
+		};
+
+		phy@12520000 {
+			status		= "okay";
+			vddcx-supply	= <&pm8921_s3>;
+			v3p3-supply	= <&pm8921_l3>;
+			v1p8-supply	= <&pm8921_l23>;
+		};
+
+		phy@12530000 {
+			status		= "okay";
+			vddcx-supply	= <&pm8921_s3>;
+			v3p3-supply	= <&pm8921_l3>;
+			v1p8-supply	= <&pm8921_l23>;
+		};
+
+		gadget@12500000 {
+			status = "okay";
+		};
+
+		/* OTG */
+		usb@12500000 {
+			status = "okay";
+		};
+
+		usb@12520000 {
+			status = "okay";
+		};
+
+		usb@12530000 {
+			status = "okay";
+		};
+
 		amba {
 			/* eMMC */
 			sdcc@12400000 {
-- 
2.5.0
