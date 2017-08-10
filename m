From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: keystone-k2g-evm: Add and enable DSP CMA memory pool
Date: Thu, 10 Aug 2017 18:52:44 -0500
Message-ID: <20170810235245.30316-3-s-anna@ti.com>
References: <20170810235245.30316-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170810235245.30316-1-s-anna-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Sam Nelson <sam.nelson-l0cyMroinI0@public.gmane.org>, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>

A CMA memory pool reserved memory node is added, and is attached
to the DSP node through the 'memory-region' property on the K2G
EVM board. This area will be used for allocating virtio rings and
buffers. This node allows the DSP Memory Protection and Address
Extension (MPAX) module to be configured properly for the DSP
processor, and matches the values used on the other Keystone 2
boards for software compatibility.

The reserved memory node and the user DSP node are also marked
okay to enable the DSP on the 66AK2G EVM board.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2g-evm.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g-evm.dts b/arch/arm/boot/dts/keystone-k2g-evm.dts
index f47f95d8bf1c..f462f1043531 100644
--- a/arch/arm/boot/dts/keystone-k2g-evm.dts
+++ b/arch/arm/boot/dts/keystone-k2g-evm.dts
@@ -25,6 +25,19 @@
 		reg = <0x00000008 0x00000000 0x00000000 0x80000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		dsp_common_memory: dsp-common-memory@81f800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00000008 0x1f800000 0x00000000 0x800000>;
+			reusable;
+			status = "okay";
+		};
+	};
+
 	vcc3v3_dcin_reg: fixedregulator-vcc3v3-dcin {
 		compatible = "regulator-fixed";
 		regulator-name = "mmc0_fixed";
@@ -94,3 +107,8 @@
 	vmmc-supply = <&vcc3v3_dcin_reg>; /* VCC3V3_EMMC is connected to VCC3V3_DCIN */
 	status = "okay";
 };
+
+&dsp0 {
+	memory-region = <&dsp_common_memory>;
+	status = "okay";
+};
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
