From: Sanchayan Maity <maitysanchayan@gmail.com>
Subject: [PATCH v2 3/5] ARM: dts: vfxxx: Add OCROM and phandle entries for Vybrid SoC bus driver
Date: Mon,  2 May 2016 12:35:02 +0530
Message-ID: <dc3203a3aa6f081410c8e627de6dc85afbba9e79.1462171990.git.maitysanchayan@gmail.com>
References: <cover.1462171989.git.maitysanchayan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1462171989.git.maitysanchayan@gmail.com>
In-Reply-To: <cover.1462171989.git.maitysanchayan@gmail.com>
References: <cover.1462171989.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, shawnguo@kernel.org
Cc: stefan@agner.ch, robh+dt@kernel.org, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sanchayan Maity <maitysanchayan@gmail.com>
List-Id: devicetree@vger.kernel.org

Add OCROM node and introduce phandles to OCROM, MSCM and NVMEM
OCOTP for use by the Vybrid SoC bus driver.

Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
---
 arch/arm/boot/dts/vfxxx.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 0e34d44..e58f4c6 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -87,9 +87,19 @@
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "simple-bus";
+		compatible = "fsl,vf610-soc-bus", "simple-bus";
 		interrupt-parent = <&mscm_ir>;
 		ranges;
+		fsl,rom-revision = <&ocrom 0x80>;
+		fsl,cpu-count = <&mscm_cpucfg 0x2C>;
+		fsl,l2-size = <&mscm_cpucfg 0x14>;
+		nvmem-cells = <&ocotp_cfg0>, <&ocotp_cfg1>;
+		nvmem-cell-names = "cfg0", "cfg1";
+
+		ocrom: ocrom@00000000 {
+			compatible = "fsl,vf610-ocrom", "syscon";
+			reg = <0x00000000 0x18000>;
+		};
 
 		aips0: aips-bus@40000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-- 
2.8.2
