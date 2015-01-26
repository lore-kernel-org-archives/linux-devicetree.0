From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 4/4] arm64: dts: add interrupt-affinity property to pmu node for juno
Date: Mon, 26 Jan 2015 17:54:18 +0000
Message-ID: <1422294858-28100-4-git-send-email-will.deacon@arm.com>
References: <1422294858-28100-1-git-send-email-will.deacon@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422294858-28100-1-git-send-email-will.deacon-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Make the Juno .dts robust against potential reordering of the CPU nodes
by adding an explicit interrupt-affinity property to the PMU node.

Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
index 4ed9287aaef1..3542500137f0 100644
--- a/arch/arm64/boot/dts/arm/juno.dts
+++ b/arch/arm64/boot/dts/arm/juno.dts
@@ -112,6 +112,12 @@
 			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&A53_0>,
+				     <&A57_0>,
+				     <&A57_1>,
+				     <&A53_1>,
+				     <&A53_2>,
+				     <&A53_3>;
 	};
 
 	/include/ "juno-clocks.dtsi"
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
