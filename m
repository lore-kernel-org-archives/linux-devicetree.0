From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: dts: mvebu: add sdram controller node to Armada-38x
Date: Thu, 11 Jan 2018 14:59:03 +1300
Message-ID: <20180111015903.11322-4-chris.packham@alliedtelesis.co.nz>
References: <20180111015903.11322-1-chris.packham@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111015903.11322-1-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org
Cc: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Armada-38x uses an SDRAM controller that is compatible with the
Armada-XP. The key difference is the width of the bus (XP is 64/32, 38x
is 32/16). The SDRAM controller registers are the same between the two
SoCs.

Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
---
Changes in v2:
- Add label to sdram-controller node

 arch/arm/boot/dts/armada-38x.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 00ff549d4e39..f9008c4ddd7d 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -138,6 +138,11 @@
 			#size-cells = <1>;
 			ranges = <0 MBUS_ID(0xf0, 0x01) 0 0x100000>;
 
+			sdramc: sdramc@1400 {
+				compatible = "marvell,armada-xp-sdram-controller";
+				reg = <0x1400 0x500>;
+			};
+
 			L2: cache-controller@8000 {
 				compatible = "arm,pl310-cache";
 				reg = <0x8000 0x1000>;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
