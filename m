From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 3/4] arm64: dts: juno/fast models: sort couple of device nodes
Date: Fri, 25 Jan 2019 17:56:05 +0000
Message-ID: <20190125175606.6607-3-sudeep.holla@arm.com>
References: <20190125175606.6607-1-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125175606.6607-1-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

Sort the couple device nodes with unit addresses which are out of order.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi        | 70 +++++++++----------
 .../boot/dts/arm/rtsm_ve-motherboard.dtsi     | 12 ++--
 2 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 3a72c04247cb..7446e0dc154d 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -220,6 +220,41 @@
 		};
 	};
 
+	replicator@20120000 {
+		compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+		reg = <0 0x20120000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* replicator output ports */
+			port@0 {
+				reg = <0>;
+				replicator_out_port0: endpoint {
+					remote-endpoint = <&tpiu_in_port>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				replicator_out_port1: endpoint {
+					remote-endpoint = <&etr_in_port>;
+				};
+			};
+		};
+		in-ports {
+			port {
+				replicator_in_port0: endpoint {
+				};
+			};
+		};
+	};
+
 	cpu_debug0: cpu-debug@22010000 {
 		compatible = "arm,coresight-cpu-debug", "arm,primecell";
 		reg = <0x0 0x22010000 0x0 0x1000>;
@@ -452,41 +487,6 @@
 		};
 	};
 
-	replicator@20120000 {
-		compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
-		reg = <0 0x20120000 0 0x1000>;
-
-		clocks = <&soc_smc50mhz>;
-		clock-names = "apb_pclk";
-		power-domains = <&scpi_devpd 0>;
-
-		out-ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			/* replicator output ports */
-			port@0 {
-				reg = <0>;
-				replicator_out_port0: endpoint {
-					remote-endpoint = <&tpiu_in_port>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-				replicator_out_port1: endpoint {
-					remote-endpoint = <&etr_in_port>;
-				};
-			};
-		};
-		in-ports {
-			port {
-				replicator_in_port0: endpoint {
-				};
-			};
-		};
-	};
-
 	sram: sram@2e000000 {
 		compatible = "arm,juno-sram-ns", "mmio-sram";
 		reg = <0x0 0x2e000000 0x0 0x8000>;
diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
index 102e93744edc..454cf6c44c49 100644
--- a/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/rtsm_ve-motherboard.dtsi
@@ -167,6 +167,12 @@
 					clock-names = "timclken1", "timclken2", "apb_pclk";
 				};
 
+				virtio-block@130000 {
+					compatible = "virtio,mmio";
+					reg = <0x130000 0x200>;
+					interrupts = <42>;
+				};
+
 				rtc@170000 {
 					compatible = "arm,pl031", "arm,primecell";
 					reg = <0x170000 0x1000>;
@@ -193,12 +199,6 @@
 						};
 					};
 				};
-
-				virtio-block@130000 {
-					compatible = "virtio,mmio";
-					reg = <0x130000 0x200>;
-					interrupts = <42>;
-				};
 			};
 
 			v2m_fixed_3v3: v2m-3v3 {
-- 
2.17.1
