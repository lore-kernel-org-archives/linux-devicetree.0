From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [PATCH v2 3/4] ARM: dts: keystone: enable accumulator channels
Date: Mon, 12 Oct 2015 15:46:50 -0400
Message-ID: <1444679211-823-4-git-send-email-m-karicheri2@ti.com>
References: <1444679211-823-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444679211-823-1-git-send-email-m-karicheri2@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: corbet@lwn.net, ssantosh@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Add low priority accumulator channel that can monitor multiple QMSS
queues. User for example could use the accumular queue for Netcp
Rx completion. While at it, also add an extra line end of each top
level node in DTS to make it more readable.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 - firmware name removed in v2
 arch/arm/boot/dts/k2e-netcp.dtsi  | 23 +++++++++++++++++++++++
 arch/arm/boot/dts/k2hk-netcp.dtsi | 24 ++++++++++++++++++++++++
 arch/arm/boot/dts/k2l-netcp.dtsi  | 23 +++++++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/k2e-netcp.dtsi b/arch/arm/boot/dts/k2e-netcp.dtsi
index b13b3c9..ac990f6 100644
--- a/arch/arm/boot/dts/k2e-netcp.dtsi
+++ b/arch/arm/boot/dts/k2e-netcp.dtsi
@@ -72,7 +72,17 @@ qmss: qmss@2a40000 {
 				qalloc-by-id;
 			};
 		};
+		accumulator {
+			acc-low-0 {
+				qrange = <480 32>;
+				accumulator = <0 47 16 2 50>;
+				interrupts = <0 226 0xf01>;
+				multi-queue;
+				qalloc-by-id;
+			};
+		};
 	};
+
 	descriptor-regions {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -83,6 +93,19 @@ qmss: qmss@2a40000 {
 			link-index = <0x4000>;
 		};
 	};
+
+	pdsps {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		pdsp0@0x2a10000 {
+			reg = <0x2a10000 0x1000    /*iram */
+			       0x2a0f000 0x100     /*reg*/
+			       0x2a0c000 0x3c8	   /*intd */
+			       0x2a20000 0x4000>;  /*cmd*/
+			id = <0>;
+		};
+	};
 }; /* qmss */
 
 knav_dmas: knav_dmas@0 {
diff --git a/arch/arm/boot/dts/k2hk-netcp.dtsi b/arch/arm/boot/dts/k2hk-netcp.dtsi
index 77a32c3..f86d6dd 100644
--- a/arch/arm/boot/dts/k2hk-netcp.dtsi
+++ b/arch/arm/boot/dts/k2hk-netcp.dtsi
@@ -47,6 +47,7 @@ qmss: qmss@2a40000 {
 				    "region", "push", "pop";
 		};
 	};
+
 	queue-pools {
 		qpend {
 			qpend-0 {
@@ -88,7 +89,17 @@ qmss: qmss@2a40000 {
 				qalloc-by-id;
 			};
 		};
+		accumulator {
+			acc-low-0 {
+				qrange = <480 32>;
+				accumulator = <0 47 16 2 50>;
+				interrupts = <0 226 0xf01>;
+				multi-queue;
+				qalloc-by-id;
+			};
+		};
 	};
+
 	descriptor-regions {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -99,6 +110,19 @@ qmss: qmss@2a40000 {
 			link-index = <0x4000>;
 		};
 	};
+
+	pdsps {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		pdsp0@0x2a10000 {
+			reg = <0x2a10000 0x1000    /*iram */
+			       0x2a0f000 0x100     /*reg*/
+			       0x2a0c000 0x3c8	   /*intd */
+			       0x2a20000 0x4000>;  /*cmd*/
+			id = <0>;
+		};
+	};
 }; /* qmss */
 
 knav_dmas: knav_dmas@0 {
diff --git a/arch/arm/boot/dts/k2l-netcp.dtsi b/arch/arm/boot/dts/k2l-netcp.dtsi
index 6b95284..01aef23 100644
--- a/arch/arm/boot/dts/k2l-netcp.dtsi
+++ b/arch/arm/boot/dts/k2l-netcp.dtsi
@@ -72,7 +72,16 @@ qmss: qmss@2a40000 {
 				qalloc-by-id;
 			};
 		};
+		accumulator {
+			acc-low-0 {
+				qrange = <480 32>;
+				accumulator = <0 47 16 2 50>;
+				interrupts = <0 226 0xf01>;
+				multi-queue;
+			};
+		};
 	};
+
 	descriptor-regions {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -83,6 +92,20 @@ qmss: qmss@2a40000 {
 			link-index = <0x4000>;
 		};
 	};
+
+	pdsps {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		pdsp0@0x2a10000 {
+			reg = <0x2a10000 0x1000    /*iram */
+			       0x2a0f000 0x100     /*reg*/
+			       0x2a0c000 0x3c8	   /*intd */
+			       0x2a20000 0x4000>;  /*cmd*/
+			id = <0>;
+		};
+	};
+
 }; /* qmss */
 
 knav_dmas: knav_dmas@0 {
-- 
1.9.1
