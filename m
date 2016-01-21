From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] MIPS: dts: qca: ar9132: drop unused extosc mentions
Date: Thu, 21 Jan 2016 12:59:04 +0300
Message-ID: <1453370345-16688-3-git-send-email-antonynpavlov@gmail.com>
References: <1453370345-16688-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453370345-16688-1-git-send-email-antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

At the moment ar913x_clocks_init() does not use extosc node at all,
the reference clock rate is hardcoded inside arch/mips/ath79/clock.c

    #define AR913X_BASE_FREQ        5000000

    ...

    static void __init ar913x_clocks_init(void)
    {
            ref_rate = AR913X_BASE_FREQ;

    ...

            ath79_add_sys_clkdev("ref", ref_rate);

Also please see the commits 'MIPS: ath79: Fix the ar913x reference clock rate'
and 'MIPS: ath79: Fix the ar724x clock calculation' in Alban Bedel's
github ath79 branch https://github.com/AlbanBedel/linux/tree/ath79

Signed-off-by: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/mips/boot/dts/qca/ar9132.dtsi               |  3 ---
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 10 ----------
 2 files changed, 13 deletions(-)

diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index 13d0439..84787e30 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -87,9 +87,6 @@
 						"qca,ar9130-pll";
 				reg = <0x18050000 0x20>;
 
-				clock-names = "ref";
-				/* The board must provides the ref clock */
-
 				#clock-cells = <1>;
 				clock-output-names = "cpu", "ddr", "ahb";
 			};
diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
index a6108f8..10905f6 100644
--- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
+++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
@@ -14,21 +14,11 @@
 		reg = <0x0 0x2000000>;
 	};
 
-	extosc: oscillator {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <40000000>;
-	};
-
 	ahb {
 		apb {
 			uart@18020000 {
 				status = "okay";
 			};
-
-			pll-controller@18050000 {
-				clocks = <&extosc>;
-			};
 		};
 
 		spi@1f000000 {
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
