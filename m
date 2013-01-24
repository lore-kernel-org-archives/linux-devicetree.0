From: "Vishwanathrao Badarkhe, Manish" <manishv.b-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 6/6] ARM: davinci: da850: add tps6507x regulator DT data
Date: Thu, 24 Jan 2013 16:25:20 +0530
Message-ID: <1359024920-32190-7-git-send-email-manishv.b@ti.com>
References: <1359024920-32190-1-git-send-email-manishv.b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1359024920-32190-1-git-send-email-manishv.b-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
Cc: khilman-l0cyMroinI0@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, anilkumar-l0cyMroinI0@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add tps6507x regulator device tree data to da850-evm by
adding regulator consumers with tightened constraints
and regulator-name.TPS6507x regulator handle can be obtained
by using this regulator name.
Regulator constraints are added as per da850 board file.

Regulator names are given as per maximum output voltage the
regulator is capable to provide.
for e.g. regulator name for dcdc1 is "VDCDC1_3.3V".
Also, add tps6507x PMIC I2C slave device under I2C0 node.

Tested on da850-evm.

Signed-off-by: Vishwanathrao Badarkhe, Manish <manishv.b-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/da850-evm.dts |   64 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 64 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 3d8290a..605a13e 100755
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -29,8 +29,72 @@
 		};
 		i2c0@1c22000 {
 			status = "okay";
+
+			tps: tps@48 {
+				reg = <0x48>;
+			};
 		};
 	};
+
+	vbat: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+	};
+};
+
+/include/ "tps6507x.dtsi"
+
+&tps {
+        vdcdc1_2-supply = <&vbat>;
+        vdcdc3-supply = <&vbat>;
+        vldo1_2-supply = <&vbat>;
+
+        regulators {
+                vdcdc1_reg: regulator@0 {
+                        regulator-name = "VDCDC1_3.3V";
+                        regulator-min-microvolt = <3150000>;
+                        regulator-max-microvolt = <3450000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                };
+
+                vdcdc2_reg: regulator@1 {
+                        regulator-name = "VDCDC2_3.3V";
+                        regulator-min-microvolt = <1710000>;
+                        regulator-max-microvolt = <3450000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                        ti,defdcdc_default = <1>;
+                };
+
+                vdcdc3_reg: regulator@2 {
+                        regulator-name = "VDCDC3_1.2V";
+                        regulator-min-microvolt = <950000>;
+                        regulator-max-microvolt = <1350000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                        ti,defdcdc_default = <1>;
+                };
+
+                ldo1_reg: regulator@3 {
+                        regulator-name = "LDO1_1.8V";
+                        regulator-min-microvolt = <1710000>;
+                        regulator-max-microvolt = <1890000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                };
+
+                ldo2_reg: regulator@4 {
+                        regulator-name = "LDO2_1.2V";
+                        regulator-min-microvolt = <1140000>;
+                        regulator-max-microvolt = <1320000>;
+                        regulator-always-on;
+                        regulator-boot-on;
+                };
+        };
 };
 &pmx_core {
 	pinctrl-names = "default";
-- 
1.7.4.1
