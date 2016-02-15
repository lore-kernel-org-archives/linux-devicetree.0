From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1 v2] MIPS: DTS: cavium-octeon: provide model attribute
Date: Mon, 15 Feb 2016 19:35:41 +0100
Message-ID: <1455561341-2071-1-git-send-email-xypron.glpk@gmx.de>
References: <56C214EE.5050200@cogentembedded.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C214EE.5050200-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Downstream packages like Debian flash-kernel rely on
/proc/device-tree/model
to determine how to install an updated kernel image.

Most dts files provide this property.

This patch adds a model attribute Octeon CPUs.

v2:
	Use vendor prefix defined in vendor-prefixes.txt.
	Separate model from vendor by comma.
	Avoid wildcards.

Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts | 1 +
 arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts b/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
index 9c48e05..f70cd58 100644
--- a/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
+++ b/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
@@ -8,6 +8,7 @@
  */
 / {
 	compatible = "cavium,octeon-3860";
+	model = "cavium,Octeon 3860";
 	#address-cells = <2>;
 	#size-cells = <2>;
 	interrupt-parent = <&ciu>;
diff --git a/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts b/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
index 79b46fc..0b40899 100644
--- a/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
+++ b/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
@@ -8,6 +8,7 @@
  */
 / {
 	compatible = "cavium,octeon-6880";
+	model = "cavium,Octeon 6880";
 	#address-cells = <2>;
 	#size-cells = <2>;
 	interrupt-parent = <&ciu2>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
