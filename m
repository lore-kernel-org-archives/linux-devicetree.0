From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] ARM: keystone: dts: disable pcie dt bindings by default
Date: Wed, 15 Jul 2015 19:00:01 -0400
Message-ID: <1437001202-19582-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix the status of PCIe DT bindings in the SoC specific DTS to
"disabled" so that it can be enabled on a specific board by
setting the status to "Ok" in the board specific DTS.

Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/k2e.dtsi      | 1 +
 arch/arm/boot/dts/keystone.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/k2e.dtsi b/arch/arm/boot/dts/k2e.dtsi
index 50e555e..ecb9cd6 100644
--- a/arch/arm/boot/dts/k2e.dtsi
+++ b/arch/arm/boot/dts/k2e.dtsi
@@ -96,6 +96,7 @@
 			ranges = <0x81000000 0 0 0x23260000 0x4000 0x4000
 				0x82000000 0 0x60000000 0x60000000 0 0x10000000>;
 
+			status = "disabled";
 			device_type = "pci";
 			num-lanes = <2>;
 
diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index c06542b..0d6be74 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -296,6 +296,7 @@
 			ranges = <0x81000000 0 0 0x23250000 0 0x4000
 				0x82000000 0 0x50000000 0x50000000 0 0x10000000>;
 
+			status = "disabled";
 			device_type = "pci";
 			num-lanes = <2>;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
