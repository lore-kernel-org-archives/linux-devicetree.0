From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v7 3/3] ARM: dts: rockchip: enable sfc for rv1108 evb
Date: Tue, 25 Jul 2017 18:09:26 +0800
Message-ID: <1500977366-15155-1-git-send-email-andy.yan@rock-chips.com>
References: <1500977251-15001-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500977251-15001-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable the sfc support for rv1108 evaluation board.

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/rv1108-evb.dts | 10 ++++++++++
 arch/arm/boot/dts/rv1108.dtsi    | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
index e0d192d..44feea7 100644
--- a/arch/arm/boot/dts/rv1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -61,6 +61,16 @@
 	status = "okay";
 };
 
+&sfc {
+	status = "okay";
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <100000000>;
+		m25p,fast-read;
+		reg = <0>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 675f774..452e397 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -210,6 +210,19 @@
 		status = "disabled";
 	};
 
+	sfc: sfc@301c0000 {
+		compatible = "rockchip,rv1108-sfc", "rockchip,sfc";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
+		clock-names = "sfc", "hsfc";
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+		reg = <0x301c0000 0x1000>;
+		/* If you want to use PIO mode, activate this */
+		/*rockchip,sfc-no-dma;*/
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@32010000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
