From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 10/14] ARM: dts: rockchip: add watchdog dt node for rv1108
Date: Mon, 31 Jul 2017 18:18:30 +0800
Message-ID: <1501496310-21961-1-git-send-email-andy.yan@rock-chips.com>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501495449-21290-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add watchdog device tree node for rv1108

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm/boot/dts/rv1108.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 7fcc6de..1fc467e 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -266,6 +266,15 @@
 		reg = <0x10300000 0x1000>;
 	};
 
+	watchdog: wdt@10360000 {
+		compatible = "snps,dw-wdt";
+		reg = <0x10360000 0x100>;
+		clocks = <&cru PCLK_WDT>;
+		clock-names = "pclk_wdt";
+		interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+
 	i2c0: i2c@20000000 {
 		compatible = "rockchip,rv1108-i2c";
 		reg = <0x20000000 0x1000>;
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
