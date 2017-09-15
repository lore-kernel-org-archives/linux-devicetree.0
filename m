From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 8/9] ARM: dts: rockchip: add qos nodes found on rk3066 and rk3188
Date: Fri, 15 Sep 2017 10:33:56 +0200
Message-ID: <20170915083357.11296-9-heiko@sntech.de>
References: <20170915083357.11296-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915083357.11296-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

QoS nodes keep information about priorites etc on the interconnect
and loose state when the power-domain gets disabled. Therefore the
power-domain driver stores the settings of available qos nodes and
restores them when the power-domain gets enabled again.

So add the qos nodes found on the Cortex-A9 socs from Rockchip, so
that they can then be connected to the power-domains.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3xxx.dtsi | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 7458047f5fd5..4a2c9a87fcfe 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -184,6 +184,46 @@
 		status = "disabled";
 	};
 
+	qos_gpu: qos@1012d000 {
+		compatible = "syscon";
+		reg = <0x1012d000 0x20>;
+	};
+
+	qos_vpu: qos@1012e000 {
+		compatible = "syscon";
+		reg = <0x1012e000 0x20>;
+	};
+
+	qos_lcdc0: qos@1012f000 {
+		compatible = "syscon";
+		reg = <0x1012f000 0x20>;
+	};
+
+	qos_cif0: qos@1012f080 {
+		compatible = "syscon";
+		reg = <0x1012f080 0x20>;
+	};
+
+	qos_ipp: qos@1012f100 {
+		compatible = "syscon";
+		reg = <0x1012f100 0x20>;
+	};
+
+	qos_lcdc1: qos@1012f180 {
+		compatible = "syscon";
+		reg = <0x1012f180 0x20>;
+	};
+
+	qos_cif1: qos@1012f200 {
+		compatible = "syscon";
+		reg = <0x1012f200 0x20>;
+	};
+
+	qos_rga: qos@1012f280 {
+		compatible = "syscon";
+		reg = <0x1012f280 0x20>;
+	};
+
 	usb_otg: usb@10180000 {
 		compatible = "rockchip,rk3066-usb", "snps,dwc2";
 		reg = <0x10180000 0x40000>;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
