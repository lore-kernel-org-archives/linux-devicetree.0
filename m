From: "J. German Rivera" <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3] arm64: dts: Added syscon-reboot node for FSL's LS2085A SoC
Date: Fri, 30 Oct 2015 12:08:12 -0500
Message-ID: <1446224892-29407-1-git-send-email-German.Rivera@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, "J. German Rivera" <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Added sys-reboot node to the FSL's LS2085A SoC DT to leverage
the ARM-generic reboot mechanism for this SoC. This mechanism
is enabled through CONFIG_POWER_RESET_SYSCON.

Signed-off-by: J. German Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
CHANGE HISTORY:

Changes in v2:
- Addressed comment form Stuart Yoder:
  * Removed "@<address>" from reboot node

Changes in v3:
- Addressed comment form Stuart Yoder:
  * Expose only the reset register

 arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
index e281ceb..5e3d894 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
@@ -131,6 +131,18 @@
 		interrupts = <1 9 0x4>;
 	};

+	rstcr: rstcr@1E60000 {
+		compatible = "syscon";
+		reg = <0x0 0x1E60000 0x0 0x4>;
+	};
+
+	reboot {
+		compatible ="syscon-reboot";
+		regmap = <&rstcr>;
+		offset = <0x0>;
+		mask = <0x2>;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <1 13 0x8>, /* Physical Secure PPI, active-low */
--
2.3.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
