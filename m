From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH v2 13/12] ARM: dts: dove: add DT GPU support
Date: Fri, 04 Dec 2015 19:48:50 +0000
Message-ID: <E1a4wLa-0004Vi-2t@rmk-PC.arm.linux.org.uk>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449237604-19064-1-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DT support for the Vivante GC600 GPU on Marvell Dove platforms.
These nodes default to being disabled unless a platform decides they
should be enabled.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
This replaces the previous patch I sent out in error; this version
adds all the DT nodes required.  Also included along with this is a
patch which enables the GPU for Cubox platforms.

This additional patch is in conjunction with my PMU (already merged)
and clock driver patch sets.

 arch/arm/boot/dts/dove.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index ea36a262d056..f36e3b9c6730 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -33,6 +33,12 @@
 		marvell,tauros2-cache-features = <0>;
 	};
 
+	gpu-subsystem {
+		compatible = "marvell,dove-gpu-subsystem";
+		cores = <&gpu>;
+		status = "disabled";
+	};
+
 	i2c-mux {
 		compatible = "i2c-mux-pinctrl";
 		#address-cells = <1>;
@@ -773,6 +779,16 @@
 				interrupts = <47>;
 				status = "disabled";
 			};
+
+			gpu: gpu@840000 {
+				clocks = <&divider_clk 1>;
+				clock-names = "core";
+				compatible = "vivante,gc";
+				interrupts = <48>;
+				power-domains = <&gpu_domain>;
+				reg = <0x840000 0x4000>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
