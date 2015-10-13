From: Zhiqiang Hou <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/2] powerpc/fsl: Add PCI node in device tree of bsc9132qds
Date: Tue, 13 Oct 2015 19:29:20 +0800
Message-ID: <1444735761-1510-1-git-send-email-B48286@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Signed-off-by: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Change-Id: I4355add4a92d1fcf514843aea5ecadd2e2517969
Reviewed-on: http://git.am.freescale.net:8181/2454
Reviewed-by: Zang Tiefei-R61911 <tie-fei.zang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Kushwaha Prabhakar-B32579 <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Fleming Andrew-AFLEMING <AFLEMING-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Tested-by: Fleming Andrew-AFLEMING <AFLEMING-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/bsc9132qds.dts          | 15 ++++++++++++++
 arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi | 29 +++++++++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi  |  1 +
 3 files changed, 45 insertions(+)

diff --git a/arch/powerpc/boot/dts/bsc9132qds.dts b/arch/powerpc/boot/dts/bsc9132qds.dts
index 6cab106..940d719 100644
--- a/arch/powerpc/boot/dts/bsc9132qds.dts
+++ b/arch/powerpc/boot/dts/bsc9132qds.dts
@@ -29,6 +29,21 @@
 	soc: soc@ff700000 {
 		ranges = <0x0 0x0 0xff700000 0x100000>;
 	};
+
+	pci0: pcie@ff70a000 {
+		reg = <0 0xff70a000 0 0x1000>;
+		ranges = <0x2000000 0x0 0x90000000 0 0x90000000 0x0 0x20000000
+			  0x1000000 0x0 0x00000000 0 0xc0010000 0x0 0x10000>;
+		pcie@0 {
+			ranges = <0x2000000 0x0 0x90000000
+				  0x2000000 0x0 0x90000000
+				  0x0 0x20000000
+
+				  0x1000000 0x0 0x0
+				  0x1000000 0x0 0x0
+				  0x0 0x100000>;
+		};
+	};
 };
 
 /include/ "bsc9132qds.dtsi"
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
index c723071..78c8f1c 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
@@ -40,6 +40,35 @@
 	interrupts = <16 2 0 0 20 2 0 0>;
 };
 
+/* controller at 0xa000 */
+&pci0 {
+	compatible = "fsl,bsc9132-pcie", "fsl,qoriq-pcie-v2.2";
+	device_type = "pci";
+	#size-cells = <2>;
+	#address-cells = <3>;
+	bus-range = <0 255>;
+	clock-frequency = <33333333>;
+	interrupts = <16 2 0 0>;
+
+	pcie@0 {
+		reg = <0 0 0 0 0>;
+		#interrupt-cells = <1>;
+		#size-cells = <2>;
+		#address-cells = <3>;
+		device_type = "pci";
+		interrupts = <16 2 0 0>;
+		interrupt-map-mask = <0xf800 0 0 7>;
+
+		interrupt-map = <
+			/* IDSEL 0x0 */
+			0000 0x0 0x0 0x1 &mpic 0x0 0x2 0x0 0x0
+			0000 0x0 0x0 0x2 &mpic 0x1 0x2 0x0 0x0
+			0000 0x0 0x0 0x3 &mpic 0x2 0x2 0x0 0x0
+			0000 0x0 0x0 0x4 &mpic 0x3 0x2 0x0 0x0
+			>;
+	};
+};
+
 &soc {
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi b/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
index 301a9db..90f7949 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/bsc9132si-pre.dtsi
@@ -45,6 +45,7 @@
 		serial0 = &serial0;
 		ethernet0 = &enet0;
 		ethernet1 = &enet1;
+		pci0 = &pci0;
 	};
 
 	cpus {
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
