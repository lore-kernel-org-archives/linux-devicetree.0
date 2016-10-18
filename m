From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH] ARM: dts: vf610: fix IRQ flag of global timer
Date: Mon, 17 Oct 2016 18:51:27 -0700
Message-ID: <20161018015127.16981-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The global timer IRQ (PPI[0], PPI 11 in device tree terms) is a
rising edge interrupt. The ARM Cortex-A5 MPCore TRM in Chapter
10.1.2. Interrupt types and sources says:
"Interrupt is rising-edge sensitive."

The bits seem to be read-only, hence this missconfiguration had
no negative effect. However, with commit 992345a58e0c
("irqchip/gic: WARN if setting the interrupt type for a PPI fails")
warnings such as this get printed:
GIC: PPI11 is secure or misconfigured

With this change the new configuration matches the default
configuration and no warning is printed anymore.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/boot/dts/vf500.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vf500.dtsi b/arch/arm/boot/dts/vf500.dtsi
index a3824e6..d7fdb2a 100644
--- a/arch/arm/boot/dts/vf500.dtsi
+++ b/arch/arm/boot/dts/vf500.dtsi
@@ -70,7 +70,7 @@
 			global_timer: timer@40002200 {
 				compatible = "arm,cortex-a9-global-timer";
 				reg = <0x40002200 0x20>;
-				interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <GIC_PPI 11 IRQ_TYPE_EDGE_RISING>;
 				interrupt-parent = <&intc>;
 				clocks = <&clks VF610_CLK_PLATFORM_BUS>;
 			};
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
