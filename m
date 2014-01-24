From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 Resend] Documentation: mfd: Add binding document for S2MPA01
Date: Fri, 24 Jan 2014 16:28:07 +0530
Message-ID: <1390561087-31850-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Added initial binding documentation for S2MPA01 MFD.

Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
* Re-organised as suggested by Mark Rutland.
---
 Documentation/devicetree/bindings/mfd/s2mpa01.txt |   86 +++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/s2mpa01.txt

diff --git a/Documentation/devicetree/bindings/mfd/s2mpa01.txt b/Documentation/devicetree/bindings/mfd/s2mpa01.txt
new file mode 100644
index 000000000000..70879b92b24b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/s2mpa01.txt
@@ -0,0 +1,86 @@
+
+* Samsung S2MPA01 Voltage and Current Regulator
+
+The Samsung S2MPA01 is a multi-function device which includes high
+efficiency buck converters including Dual-Phase buck converter, various LDOs,
+and an RTC. It is interfaced to the host controller using an I2C interface.
+Each sub-block is addressed by the host system using different I2C slave
+addresses.
+
+Required properties:
+- compatible: Should be "samsung,s2mpa01-pmic".
+- reg: Specifies the I2C slave address of the PMIC block. It should be 0x66.
+
+Optional properties:
+- interrupt-parent: Specifies the phandle of the interrupt controller to which
+  the interrupts from s2mpa01 are delivered to.
+- interrupts: Interrupt specifier for interrupt source (connected to SoC).
+
+Optional nodes:
+- regulators: The regulators of s2mpa01 that have to be instantiated should be
+  included in a sub-node named 'regulators'. Regulator nodes and constraints
+  included in this sub-node use the standard regulator bindings which are
+  documented elsewhere.
+
+Properties for BUCK regulator nodes:
+ regulator-ramp-delay for BUCKs = [6250/12500(default)/25000/50000] uV/us
+
+ BUCK[1/2/3/4] supports disabling ramp delay on hardware, so explictly
+ regulator-ramp-delay = <0> can be used for them to disable ramp delay.
+ In the absence of the regulator-ramp-delay property, the default ramp
+ delay will be used.
+
+  NOTE: Some BUCKs share the ramp rate setting i.e. same ramp value will be set
+  for a particular group of BUCKs. So provide same regulator-ramp-delay<value>.
+  Grouping of BUCKs sharing ramp rate setting is as follow : BUCK[1, 6],
+  BUCK[2, 4], and BUCK[8, 9, 10]
+
+The following are the names of the regulators that the s2mpa01 PMIC block
+supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
+as per the datasheet of s2mpa01.
+
+	- LDOn
+		  - valid values for n are 1 to 26
+		  - Example: LDO1, LD02, LDO26
+	- BUCKn
+		  - valid values for n are 1 to 10.
+		  - Example: BUCK1, BUCK2, BUCK9
+
+Example:
+
+	s2mpa01_pmic@66 {
+		compatible = "samsung,s2mpa01-pmic";
+		reg = <0x66>;
+
+		regulators {
+			ldo1_reg: LDO1 {
+				regulator-name = "VDD_ALIVE";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "VDDQ_MMC2";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-always-on;
+			};
+
+			buck1_reg: BUCK1 {
+				regulator-name = "vdd_mif";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "vdd_arm";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-ramp-delay = <50000>;
+			};
+		};
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
