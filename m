From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/6] arm64: zynqmp: Use zynqmp specific compatible string for macb
Date: Wed, 17 Jan 2018 16:29:45 +0100
Message-ID: <cbeb93b54ae16677901f1cb5f3063b65aeea5793.1516202975.git.michal.simek@xilinx.com>
References: <cover.1516202975.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1516202975.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <cover.1516202975.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
References: <cover.1516202975.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TaqPxH82wqD4g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, "Edgar E. Iglesias" <edgar.iglesias-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Krsmanovic <stefan.krsmanovic-XdEHnvbJQ9jQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch
"devicetree: Add compatible string for Zynq Ultrascale+ MPSoC"
(commit <988d6f07fc0a29e392035ba56e3bcfaf7b397d95>)
introduced specific compatible string for ZynqMP which should be used
first.

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 7665fbddff28..0da98007753b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -355,7 +355,7 @@
 		};
 
 		gem0: ethernet@ff0b0000 {
-			compatible = "cdns,gem";
+			compatible = "cdns,zynqmp-gem", "cdns,gem";
 			status = "disabled";
 			interrupt-parent = <&gic>;
 			interrupts = <0 57 4>, <0 57 4>;
@@ -366,7 +366,7 @@
 		};
 
 		gem1: ethernet@ff0c0000 {
-			compatible = "cdns,gem";
+			compatible = "cdns,zynqmp-gem", "cdns,gem";
 			status = "disabled";
 			interrupt-parent = <&gic>;
 			interrupts = <0 59 4>, <0 59 4>;
@@ -377,7 +377,7 @@
 		};
 
 		gem2: ethernet@ff0d0000 {
-			compatible = "cdns,gem";
+			compatible = "cdns,zynqmp-gem", "cdns,gem";
 			status = "disabled";
 			interrupt-parent = <&gic>;
 			interrupts = <0 61 4>, <0 61 4>;
@@ -388,7 +388,7 @@
 		};
 
 		gem3: ethernet@ff0e0000 {
-			compatible = "cdns,gem";
+			compatible = "cdns,zynqmp-gem", "cdns,gem";
 			status = "disabled";
 			interrupt-parent = <&gic>;
 			interrupts = <0 63 4>, <0 63 4>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
