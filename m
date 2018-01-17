From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/6] arm64: zynqmp: Fix alignment in dts files
Date: Wed, 17 Jan 2018 16:29:46 +0100
Message-ID: <b80ef4af56de3bd47bb6d45ba91b4150965506cd.1516202975.git.michal.simek@xilinx.com>
References: <cover.1516202975.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1516202975.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <cover.1516202975.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
References: <cover.1516202975.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TaqPxH82wqD4g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Naga Sureshkumar Relli <naga.sureshkumar.relli-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, P L Sai Krishna <lakshmi.sai.krishna.potthuri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anurag Kumar Vulisha <anurag.kumar.vulisha-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alistair Francis <alistair.francis-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Stefan Krsmanovic <stefan.krsmanovic-XdEHnvbJQ9jQT0dZR+AlfA@public.gmane.org>, "Edgar E. Iglesias" <edgar.iglesias-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Trivial changes.

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---

 arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts | 2 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi      | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
index bf552674a834..fe7c48b6fa78 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-ep108.dts
@@ -47,7 +47,7 @@
 	status = "okay";
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
-	phy0: phy@0{
+	phy0: phy@0 {
 		reg = <0>;
 		max-speed = <100>;
 	};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 0da98007753b..9ca4d1f83b51 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -439,10 +439,10 @@
 			device_type = "pci";
 			interrupt-parent = <&gic>;
 			interrupts = <0 118 4>,
-				    <0 117 4>,
-				    <0 116 4>,
-				    <0 115 4>,	/* MSI_1 [63...32] */
-				    <0 114 4>;	/* MSI_0 [31...0] */
+				     <0 117 4>,
+				     <0 116 4>,
+				     <0 115 4>,	/* MSI_1 [63...32] */
+				     <0 114 4>;	/* MSI_0 [31...0] */
 			interrupt-names = "misc", "dummy", "intx",
 					  "msi1", "msi0";
 			msi-parent = <&pcie>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
