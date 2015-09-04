From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v1 2/2] ARM: dts: keystone: enable accumulator channels
Date: Fri, 4 Sep 2015 17:46:39 -0400
Message-ID: <1441403199-10936-2-git-send-email-m-karicheri2@ti.com>
References: <1441403199-10936-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441403199-10936-1-git-send-email-m-karicheri2-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add low priority accumulator channel that can monitor multiple QMSS
queues. User for example could use the accumular queue for Netcp
Rx completion. While at it, also add an extra line end of each top
level node in DTS to make it more readable.

Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
---
 v1  - No change from initial version
 arch/arm/boot/dts/k2e-netcp.dtsi  | 24 ++++++++++++++++++++++++
 arch/arm/boot/dts/k2hk-netcp.dtsi | 25 +++++++++++++++++++++++++
 arch/arm/boot/dts/k2l-netcp.dtsi  | 24 ++++++++++++++++++++++++
 3 files changed, 73 insertions(+)

diff --git a/arch/arm/boot/dts/k2e-netcp.dtsi b/arch/arm/boot/dts/k2e-netcp.dtsi
index b13b3c9..1818929 100644
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
@@ -83,6 +93,20 @@ qmss: qmss@2a40000 {
 			link-index = <0x4000>;
 		};
 	};
+
+	pdsps {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		pdsp0@0x2a10000 {
+			firmware = "ks2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin";
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
index 77a32c3..b9941b4 100644
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
@@ -99,6 +110,20 @@ qmss: qmss@2a40000 {
 			link-index = <0x4000>;
 		};
 	};
+
+	pdsps {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		pdsp0@0x2a10000 {
+			firmware = "ks2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin";
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
index 6b95284..8d7ddb3 100644
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
@@ -83,6 +92,21 @@ qmss: qmss@2a40000 {
 			link-index = <0x4000>;
 		};
 	};
+
+	pdsps {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		pdsp0@0x2a10000 {
+			firmware = "ks2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin";
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
