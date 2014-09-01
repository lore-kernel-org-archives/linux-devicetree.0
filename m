From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v8 1/3] Documentation: mfd: add docs for hi6421 dt
Date: Mon,  1 Sep 2014 16:28:33 +0800
Message-ID: <1409560115-30646-2-git-send-email-guodong.xu@linaro.org>
References: <1409560115-30646-1-git-send-email-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409560115-30646-1-git-send-email-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, sameo@linux.intel.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, grant.likely@linaro.org, khilman@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhangnian@huawei.com
Cc: Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

Add documentation for HiSilicon Hi6421 PMIC dt binding.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 Documentation/devicetree/bindings/mfd/hi6421.txt | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/hi6421.txt

diff --git a/Documentation/devicetree/bindings/mfd/hi6421.txt b/Documentation/devicetree/bindings/mfd/hi6421.txt
new file mode 100644
index 0000000..0d5a446
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/hi6421.txt
@@ -0,0 +1,38 @@
+* HI6421 Multi-Functional Device (MFD), by HiSilicon Ltd.
+
+Required parent device properties:
+- compatible	: contains "hisilicon,hi6421-pmic";
+- reg		: register range space of hi6421;
+
+Supported Hi6421 sub-devices include:
+
+Device                     IRQ Names              Supply Names   Description
+------                     ---------              ------------   -----------
+regulators               :  None                 : None         : Regulators
+
+Required child device properties:
+None.
+
+Example:
+	hi6421 {
+		compatible = "hisilicon,hi6421-pmic";
+		reg = <0xfcc00000 0x0180>; /* 0x60 << 2 */
+
+		regulators {
+			// supply for MLC NAND/ eMMC
+			hi6421_vout0_reg: hi6421_vout0 {
+				regulator-name = "VOUT0";
+				regulator-min-microvolt = <2850000>;
+				regulator-max-microvolt = <2850000>;
+			};
+
+			// supply for 26M Oscillator
+			hi6421_vout1_reg: hi6421_vout1 {
+				regulator-name = "VOUT1";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
-- 
1.9.1
