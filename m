From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 6/8] arm: dts: lpc32xx: add external memory controller device node
Date: Sun, 18 Oct 2015 00:35:55 +0300
Message-ID: <1445117757-8073-7-git-send-email-vz@mleia.com>
References: <1445117757-8073-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445117757-8073-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The change adds a description of ARM PrimeCell PL175 memory
controller, which is found on NXP LPC32xx SoCs.

The controller supports up to 4 static memory devices mapped to
0xE000 0000 - 0xE3FF FFFF physical memory area.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
Changes from v1 to v2:
- none, new change

 arch/arm/boot/dts/lpc32xx.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index be82992..a595a4b 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -32,7 +32,8 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
-		ranges = <0x20000000 0x20000000 0x30000000>;
+		ranges = <0x20000000 0x20000000 0x30000000>,
+			 <0xe0000000 0xe0000000 0x04000000>;
 
 		/*
 		 * Enable either SLC or MLC
@@ -86,6 +87,19 @@
 			interrupts = <0x1d 0>;
 		};
 
+		emc: memory-controller@31080000 {
+			compatible = "arm,pl175", "arm,primecell";
+			reg = <0x31080000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0xe0000000 0x01000000>,
+				 <1 0xe1000000 0x01000000>,
+				 <2 0xe2000000 0x01000000>,
+				 <3 0xe3000000 0x01000000>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
