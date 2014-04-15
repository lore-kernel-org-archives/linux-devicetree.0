From: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH V8 7/9] SPEAr13XX: dts: Add PCIe node information
Date: Tue, 15 Apr 2014 17:19:49 +0530
Message-ID: <fa5d8aabf3c6a6770462c33426787531cb69bd21.1397555158.git.mohit.kumar__39515.3577825569$1397562802$gmane$org@st.com>
References: <cover.1397555158.git.mohit.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1397555158.git.mohit.kumar-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>

SPEAr1310 and SPEAr1340 supports 3 and 1 PCIe controller respectively.
These controllers are based on synopsys designware controller.

Signed-off-by: Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
 arch/arm/boot/dts/spear1310.dtsi |   48 ++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/spear1340.dtsi |   16 ++++++++++++
 2 files changed, 64 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/spear1310.dtsi b/arch/arm/boot/dts/spear1310.dtsi
index 64e7dd5..53f73a2 100644
--- a/arch/arm/boot/dts/spear1310.dtsi
+++ b/arch/arm/boot/dts/spear1310.dtsi
@@ -83,6 +83,54 @@
 			status = "disabled";
 		};
 
+		pcie0: pcie@b1000000 {
+			compatible = "st,spear1340-pcie", "snps,dw-pcie";
+			reg = <0xb1000000 0x4000>;
+			interrupts = <0 68 0x4>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0x0 0 &gic 0 68 0x4>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges = <0x00000800 0 0x80000000 0x80000000 0 0x00020000   /* configuration space */
+				0x81000000 0 0	 0x80020000 0 0x00010000   /* downstream I/O */
+				0x82000000 0 0x80030000 0xc0030000 0 0x0ffd0000>; /* non-prefetchable memory */
+			status = "disabled";
+		};
+
+		pcie1: pcie@b1800000 {
+			compatible = "st,spear1340-pcie", "snps,dw-pcie";
+			reg = <0xb1800000 0x4000>;
+			interrupts = <0 69 0x4>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0x0 0 &gic 0 69 0x4>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges = <0x00000800 0 0x90000000 0x90000000 0 0x00020000   /* configuration space */
+				0x81000000 0 0  0x90020000 0 0x00010000   /* downstream I/O */
+				0x82000000 0 0x90030000 0x90030000 0 0x0ffd0000>; /* non-prefetchable memory */
+			status = "disabled";
+		};
+
+		pcie2: pcie@b4000000 {
+			compatible = "st,spear1340-pcie", "snps,dw-pcie";
+			reg = <0xb4000000 0x4000>;
+			interrupts = <0 70 0x4>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0x0 0 &gic 0 70 0x4>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges = <0x00000800 0 0xc0000000 0xc0000000 0 0x00020000   /* configuration space */
+				0x81000000 0 0	 0xc0020000 0 0x00010000   /* downstream I/O */
+				0x82000000 0 0xc0030000 0xc0030000 0 0x0ffd0000>; /* non-prefetchable memory */
+			status = "disabled";
+		};
+
 		gmac1: eth@5c400000 {
 			compatible = "st,spear600-gmac";
 			reg = <0x5c400000 0x8000>;
diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
index b8b32c7..bc492f5 100644
--- a/arch/arm/boot/dts/spear1340.dtsi
+++ b/arch/arm/boot/dts/spear1340.dtsi
@@ -48,6 +48,22 @@
 			status = "disabled";
 		};
 
+		pcie0: pcie@b1000000 {
+			compatible = "st,spear1340-pcie", "snps,dw-pcie";
+			reg = <0xb1000000 0x4000>;
+			interrupts = <0 68 0x4>;
+			interrupt-map-mask = <0 0 0 0>;
+			interrupt-map = <0x0 0 &gic 0 68 0x4>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges = <0x00000800 0 0x80000000 0x80000000 0 0x00020000   /* configuration space */
+				0x81000000 0 0	 0x80020000 0 0x00010000   /* downstream I/O */
+				0x82000000 0 0x80030000 0xc0030000 0 0x0ffd0000>; /* non-prefetchable memory */
+			status = "disabled";
+		};
+
 		i2s-play@b2400000 {
 			compatible = "snps,designware-i2s";
 			reg = <0xb2400000 0x10000>;
-- 
1.7.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
