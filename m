From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH] arm64: dts: ls208x: remove Freescale Erratum A008585 from LS2088A.
Date: Tue,  6 Mar 2018 12:50:29 +0530
Message-ID: <1520320829-14050-1-git-send-email-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, leoyang.li@nxp.com, V.Sethi@nxp.com, Pankaj Bansal <pankaj.bansal@nxp.com>, "# 4 . 14" <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Freescale Erratum A008585 affects A57 core cluster used in LS2085rev1.
However this problem has been fixed in A72 core cluster used in LS2088.
Therefore remove the erratum from LS2088A. Keeping it only in LS2085.

Cc: <stable@vger.kernel.org> # 4.14
Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
Reviewed-by: Sandeep Malik <sandeep.malik@nxp.com>
Acked-by: Priyanka Jain <priyanka.jain@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 4 ++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 8d73930..f55cb3e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -150,6 +150,10 @@
 	};
 };
 
+&timer {
+	fsl,erratum-a008585;
+};
+
 &pcie1 {
 	reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 	       0x10 0x00000000 0x0 0x00002000>; /* configuration space */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index f3a40af..4f06676 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -111,13 +111,12 @@
 		mask = <0x2>;
 	};
 
-	timer {
+	timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <1 13 4>, /* Physical Secure PPI, active-low */
 			     <1 14 4>, /* Physical Non-Secure PPI, active-low */
 			     <1 11 4>, /* Virtual PPI, active-low */
 			     <1 10 4>; /* Hypervisor PPI, active-low */
-		fsl,erratum-a008585;
 	};
 
 	pmu {
-- 
2.7.4
