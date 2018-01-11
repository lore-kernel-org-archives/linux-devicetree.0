From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH v2 2/3] ARM: dts: armada-xp: add label to sdram-controller node
Date: Thu, 11 Jan 2018 14:59:02 +1300
Message-ID: <20180111015903.11322-3-chris.packham@alliedtelesis.co.nz>
References: <20180111015903.11322-1-chris.packham@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111015903.11322-1-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org
Cc: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the label "sdramc" to the sdram-controller nodes for the Armada-XP
and 98dx3236 SoCs.

Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
---
Changes in v2:
- New

 arch/arm/boot/dts/armada-xp-98dx3236.dtsi | 2 +-
 arch/arm/boot/dts/armada-xp.dtsi          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
index bdd4c7a45fbf..fe54e9d7cc90 100644
--- a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
@@ -127,7 +127,7 @@
 		};
 
 		internal-regs {
-			sdramc@1400 {
+			sdramc: sdramc@1400 {
 				compatible = "marvell,armada-xp-sdram-controller";
 				reg = <0x1400 0x500>;
 			};
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-xp.dtsi
index fa1e881266ac..3bb6e5e59fcc 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -73,7 +73,7 @@
 		};
 
 		internal-regs {
-			sdramc@1400 {
+			sdramc: sdramc@1400 {
 				compatible = "marvell,armada-xp-sdram-controller";
 				reg = <0x1400 0x500>;
 			};
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
