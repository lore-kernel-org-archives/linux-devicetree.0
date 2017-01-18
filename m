From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: juno: Remove Motherboard USB node
Date: Wed, 18 Jan 2017 12:12:52 +0000
Message-ID: <39868e0d327456be61aa9ac318fc2d958523a696.1484741104.git.robin.murphy@arm.com>
References: <74595d6d866518db7cfabc39b4cf9b54d3be9bde.1484741104.git.robin.murphy@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74595d6d866518db7cfabc39b4cf9b54d3be9bde.1484741104.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sudeep.holla-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

The first batch of Juno boards included a discrete USB controller chip
as a contingency in case of issues with the USB 2.0 IP integrated into
the SoC. As it turned out, the latter was fine, and to the best of my
knowledge the motherboard USB was never even brought up and validated.

Since this also isn't present on later boards, and uses a compatible
string undocumented and unmatched by any driver in the kernel, let's
just tidy it away for ever to avoid any confusion.

Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
index 3ad4c3000611..098601657f82 100644
--- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
@@ -131,13 +131,6 @@
 				vddvario-supply = <&mb_fixed_3v3>;
 			};
 
-			usb@5,00000000 {
-				compatible = "nxp,usb-isp1763";
-				reg = <5 0x00000000 0x20000>;
-				bus-width = <16>;
-				interrupts = <4>;
-			};
-
 			iofpga@3,00000000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
-- 
2.11.0.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
