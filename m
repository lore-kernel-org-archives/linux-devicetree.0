From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of/unittest: Fix I2C bus unit-address error
Date: Wed, 19 Sep 2018 15:07:53 -0700
Message-ID: <20180919220753.27273-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

dtc has new checks for I2C buses. Fix the warnings in unit-addresses in
the unittests.

drivers/of/unittest-data/testcases.dtb: Warning (i2c_bus_reg): /testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest14/i2c@0/test-mux-dev: I2C bus unit address format error, expected "20"
drivers/of/unittest-data/overlay_15.dtb: Warning (i2c_bus_reg): /fragment@0/__overlay__/test-unittest15/i2c@0/test-mux-dev: I2C bus unit address format error, expected "20"

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/unittest-data/overlay_15.dts     | 4 ++--
 drivers/of/unittest-data/tests-overlay.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/of/unittest-data/overlay_15.dts b/drivers/of/unittest-data/overlay_15.dts
index b98f2514df4b..5728490474f6 100644
--- a/drivers/of/unittest-data/overlay_15.dts
+++ b/drivers/of/unittest-data/overlay_15.dts
@@ -20,8 +20,8 @@
 			#size-cells = <0>;
 			reg = <0>;
 
-			test-mux-dev {
-				reg = <32>;
+			test-mux-dev@20 {
+				reg = <0x20>;
 				compatible = "unittest-i2c-dev";
 				status = "okay";
 			};
diff --git a/drivers/of/unittest-data/tests-overlay.dtsi b/drivers/of/unittest-data/tests-overlay.dtsi
index 25cf397b8f6b..4ea024d908ee 100644
--- a/drivers/of/unittest-data/tests-overlay.dtsi
+++ b/drivers/of/unittest-data/tests-overlay.dtsi
@@ -103,8 +103,8 @@
 							#size-cells = <0>;
 							reg = <0>;
 
-							test-mux-dev {
-								reg = <32>;
+							test-mux-dev@20 {
+								reg = <0x20>;
 								compatible = "unittest-i2c-dev";
 								status = "okay";
 							};
-- 
2.17.1
