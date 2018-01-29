From: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] arm64: dts: Add DPAA QBMan portal 9
Date: Mon, 29 Jan 2018 16:07:21 -0500
Message-ID: <1517260041-19300-1-git-send-email-roy.pledge@nxp.com>
Reply-To: roy.pledge-3arQi8VN3Tc@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, madalin.bucur-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ARM DPAA1 (LS1043 and LS1046) have 10 QBMan portals (indexed 0-9)
Enable the one that is missing in the device trees.

Signed-off-by: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm64/boot/dts/freescale/qoriq-bman-portals.dtsi | 6 ++++++
 arch/arm64/boot/dts/freescale/qoriq-qman-portals.dtsi | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/qoriq-bman-portals.dtsi b/arch/arm64/boot/dts/freescale/qoriq-bman-portals.dtsi
index c3c2be4..ae15307 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-bman-portals.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-bman-portals.dtsi
@@ -68,4 +68,10 @@
 		reg = <0x80000 0x4000>, <0x4080000 0x4000>;
 		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	bman-portal@90000 {
+		compatible = "fsl,bman-portal";
+		reg = <0x90000 0x4000>, <0x4090000 0x4000>;
+		interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/qoriq-qman-portals.dtsi b/arch/arm64/boot/dts/freescale/qoriq-qman-portals.dtsi
index 2a9aa06..6a93a4a 100644
--- a/arch/arm64/boot/dts/freescale/qoriq-qman-portals.dtsi
+++ b/arch/arm64/boot/dts/freescale/qoriq-qman-portals.dtsi
@@ -77,4 +77,11 @@
 		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
 		cell-index = <8>;
 	};
+
+	qportal9: qman-portal@90000 {
+		compatible = "fsl,qman-portal";
+		reg = <0x90000 0x4000>, <0x4090000 0x4000>;
+		interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <9>;
+	};
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
