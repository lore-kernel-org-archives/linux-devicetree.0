From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 4/8] ARM: dts: keystone: Add missing unit name to interrupt controller
Date: Fri, 15 Dec 2017 07:20:58 -0600
Message-ID: <20171215132102.435-5-nm@ti.com>
References: <20171215132102.435-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215132102.435-1-nm-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add base address for GIC as unit address. This also squashes the
following warnings when built with W=1:
arch/arm/boot/dts/keystone-k2hk-evm.dtb: Warning (unit_address_vs_reg): Node /interrupt-controller has a reg or ranges property, but no unit name
arch/arm/boot/dts/keystone-k2l-evm.dtb: Warning (unit_address_vs_reg): Node /interrupt-controller has a reg or ranges property, but no unit name
arch/arm/boot/dts/keystone-k2e-evm.dtb: Warning (unit_address_vs_reg): Node /interrupt-controller has a reg or ranges property, but no unit name

Reported-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 01496910587a..93ea5c69ea77 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -27,7 +27,7 @@
 		reg = <0x00000000 0x80000000 0x00000000 0x40000000>;
 	};
 
-	gic: interrupt-controller {
+	gic: interrupt-controller@2561000 {
 		compatible = "arm,gic-400", "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
