From: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>
Subject: [RFC PATCH 3/3] dt: EMIF and lpddr2 device tree data for OMAP4 boards
Date: Sat, 17 Dec 2011 18:50:52 +0530
Message-ID: <1324128052-11220-4-git-send-email-aneesh@ti.com>
References: <1324128052-11220-1-git-send-email-aneesh@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324128052-11220-1-git-send-email-aneesh-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-patch-review-uAqBSO/uNfhBDgjK7y7TUQ@public.gmane.org
Cc: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>, santosh.shilimkar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Device tree data for the EMIF sdram controllers in OMAP4
and DDR memories attached to OMAP4 boards.

Cc: Rajendra Nayak <rnayak-l0cyMroinI0@public.gmane.org>
Cc: Benoit Cousson <b-cousson-l0cyMroinI0@public.gmane.org>
Signed-off-by: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/omap-common-devices.dtsi |   64 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/omap4-panda.dts          |   13 ++++++
 arch/arm/boot/dts/omap4-sdp.dts            |   13 ++++++
 arch/arm/boot/dts/omap4.dtsi               |   18 ++++++++
 4 files changed, 108 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap-common-devices.dtsi

diff --git a/arch/arm/boot/dts/omap-common-devices.dtsi b/arch/arm/boot/dts/omap-common-devices.dtsi
new file mode 100644
index 0000000..6cf3dfa
--- /dev/null
+++ b/arch/arm/boot/dts/omap-common-devices.dtsi
@@ -0,0 +1,64 @@
+/*
+ * Common devices used in different OMAP boards
+ */
+
+/ {
+	elpida_2GS4: ddr {
+		compatible 	= "jedec,lpddr2-s4";
+		density		= "2Gb";
+		io-width	= "x32";
+		manufacturer	= "Elpida";
+
+		tRPab-min-tck	= <3>;
+		tRCD-min-tck	= <3>;
+		tWR-min-tck	= <3>;
+		tRASmin-min-tck	= <3>;
+		tRRD-min-tck	= <2>;
+		tWTR-min-tck	= <2>;
+		tXP-min-tck	= <2>;
+		tRTP-min-tck	= <2>;
+		tCKE-min-tck	= <3>;
+		tCKESR-min-tck	= <3>;
+		tFAW-min-tck	= <8>;
+
+		timings_elpida_2GS4_400mhz: ddr-timings@1 {
+			min-freq	= <10000000>;
+			max-freq	= <400000000>;
+			tRPab-ps		= <21000>;
+			tRCD-ps		= <18000>;
+			tWR-ps		= <15000>;
+			tRAS-min-ps	= <42000>;
+			tRRD-ps		= <10000>;
+			tWTR-ps		= <7500>;
+			tXP-ps		= <7500>;
+			tRTP-ps		= <7500>;
+			tCKESR-ps	= <15000>;
+			tDQSCK-max-ps 	= <5500>;
+			tFAW-ps		= <50000>;
+			tZQCS-ps	= <90000>;
+			tZQCL-ps	= <360000>;
+			tZQinit-ps	= <1000000>;
+			tRAS-max-ns	= <70000>;
+		};
+
+		timings_elpida_2GS4_200mhz: ddr-timings@ {
+			min-freq	= <10000000>;
+			max-freq	= <200000000>;
+			tRPab-ps		= <21000>;
+			tRCD-ps		= <18000>;
+			tWR-ps		= <15000>;
+			tRAS-min-ps	= <42000>;
+			tRRD-ps		= <10000>;
+			tWTR-ps		= <10000>;
+			tXP-ps		= <7500>;
+			tRTP-ps		= <7500>;
+			tCKESR-ps	= <15000>;
+			tDQSCK-max-ps 	= <5500>;
+			tFAW-ps		= <50000>;
+			tZQCS-ps	= <90000>;
+			tZQCL-ps	= <360000>;
+			tZQinit-ps	= <1000000>;
+			tRAS-max-ns	= <70000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/omap4-panda.dts b/arch/arm/boot/dts/omap4-panda.dts
index c702657..69ff0de 100644
--- a/arch/arm/boot/dts/omap4-panda.dts
+++ b/arch/arm/boot/dts/omap4-panda.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 /include/ "omap4.dtsi"
+/include/ "omap-common-devices.dtsi"
 
 / {
 	model = "TI OMAP4 PandaBoard";
@@ -26,4 +27,16 @@
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>; /* 1 GB */
 	};
+
+	ocp {
+		emif1: emif@0x4c000000 {
+			cs1-used;
+			ddr-handle = <&elpida_2GS4>;
+		};
+
+		emif2: emif@0x4d000000 {
+			cs1-used;
+			ddr-handle = <&elpida_2GS4>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
index 066e28c..1481e98 100644
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 /include/ "omap4.dtsi"
+/include/ "omap-common-devices.dtsi"
 
 / {
 	model = "TI OMAP4 SDP board";
@@ -26,4 +27,16 @@
 		device_type = "memory";
 		reg = <0x80000000 0x40000000>; /* 1 GB */
 	};
+
+	ocp {
+		emif1: emif@0x4c000000 {
+			cs1-used;
+			ddr-handle = <&elpida_2GS4>;
+		};
+
+		emif2: emif@0x4d000000 {
+			cs1-used;
+			ddr-handle = <&elpida_2GS4>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 4c61c82..4e88ea5 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -99,5 +99,23 @@
 			reg = <0x48241000 0x1000>,
 			      <0x48240100 0x0100>;
 		};
+
+		emif1: emif@0x4c000000 {
+			compatible = "ti,emif-lpddr2";
+			ti,hwmods = "emif1";
+			hw-caps-read-idle-ctrl;
+			hw-caps-ll-interface;
+			hw-caps-temp-alert;
+		};
+
+		emif2: emif@0x4d000000 {
+			compatible	= "ti,emif-lpddr2";
+			ti,hwmods	= "emif2";
+			phy-type	= "phy-type-omap4";
+			hw-caps-read-idle-ctrl;
+			hw-caps-ll-interface;
+			hw-caps-temp-alert;
+		};
+
 	};
 };
-- 
1.7.1
