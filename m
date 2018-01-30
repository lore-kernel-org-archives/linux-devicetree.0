From: Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: fsl-quadspi: spi-rx/tx-bus-width usage example
Date: Tue, 30 Jan 2018 23:01:08 +0530
Message-ID: <1517333468-17153-3-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1517333468-17153-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517333468-17153-1-git-send-email-yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, han.xu-3arQi8VN3Tc@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org, suresh.gupta-3arQi8VN3Tc@public.gmane.org, Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Added usage example by adding support for spi-rx-bus-width
and spi-tx-bus-width binding.

Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
---
 .../devicetree/bindings/mtd/fsl-quadspi.txt        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 63d4d626..811da0e 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -39,3 +39,33 @@ qspi0: quadspi@40044000 {
 		....
 	};
 };
+
+qspi1: quadspi@20c0000 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x0 0x20c0000 0x0 0x10000>,
+		<0x0 0x20000000 0x0 0x10000000>;
+	reg-names = "QuadSPI", "QuadSPI-memory";
+	interrupts = <0 25 0x4>; /* Level high type */
+	clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+	clock-names = "qspi_en", "qspi";
+	status = "okay";
+
+	qflash0: s25fs512s@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+
+	qflash1: s25fs512s@1 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <20000000>;
+		reg = <1>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
