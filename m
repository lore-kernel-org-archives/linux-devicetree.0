From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 02/11] coresight: dts: binding: Update coresight binding examples
Date: Wed, 12 Sep 2018 14:53:43 +0100
Message-ID: <20180912135352.19722-3-suzuki.poulose@arm.com>
References: <20180912135352.19722-1-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180912135352.19722-1-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, frowand.list@gmail.com, coresight@lists.linaro.org, leo.yan@linaro.org, suzuki.poulose@arm.com
List-Id: devicetree@vger.kernel.org

While we updated the coresight DT bindings, some of the
new examples were not updated due to the order in which they
were merged. Let us update all the missed out ones to the
new bindings to avoid confusion.

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 .../devicetree/bindings/arm/coresight.txt     | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
index 13b6198ce01c..f8aff65ab921 100644
--- a/Documentation/devicetree/bindings/arm/coresight.txt
+++ b/Documentation/devicetree/bindings/arm/coresight.txt
@@ -147,22 +147,16 @@ Example:
 
 		clocks = <&oscclk6a>;
 		clock-names = "apb_pclk";
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			/* input port */
-			port@0 {
-				reg =  <0>;
+		in-ports {
+			port {
 				etr_in_port: endpoint {
-					slave-mode;
 					remote-endpoint = <&replicator2_out_port0>;
 				};
 			};
+		};
 
-			/* CATU link represented by output port */
-			port@1 {
-				reg = <1>;
+		out-ports {
+			port {
 				etr_out_port: endpoint {
 					remote-endpoint = <&catu_in_port>;
 				};
@@ -310,10 +304,11 @@ Example:
 		clock-names = "apb_pclk";
 
 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
-		port {
-			catu_in_port: endpoint {
-				slave-mode;
-				remote-endpoint = <&etr_out_port>;
+		in-ports {
+			port {
+				catu_in_port: endpoint {
+					remote-endpoint = <&etr_out_port>;
+				};
 			};
 		};
 	};
-- 
2.19.0
