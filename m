From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 10/10] ARM: STi: stih416: Supply EMI clock reference to FSM SPI NOR
Date: Wed, 21 Jan 2015 15:24:28 +0000
Message-ID: <1421853868-8262-11-git-send-email-lee.jones@linaro.org>
References: <1421853868-8262-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421853868-8262-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

While we're at it we're also adding a new human readable define for the
aforementioned clock.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih416.dtsi           | 2 +-
 include/dt-bindings/clock/stih416-clks.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index 2e35bab7..39b856b 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -219,7 +219,7 @@
 			compatible	   = "st,stih416-spi-fsm";
 			reg		   = <0xfe902000 0x1000>;
 			pinctrl-0	   = <&pinctrl_fsm>;
-
+			clocks		   = <&clk_s_a0_ls CLK_EMISS>;
 			st,syscfg	   = <&syscfg_rear>;
 
 			status = "disabled";
diff --git a/include/dt-bindings/clock/stih416-clks.h b/include/dt-bindings/clock/stih416-clks.h
index f9bdbd1..4a46a47e 100644
--- a/include/dt-bindings/clock/stih416-clks.h
+++ b/include/dt-bindings/clock/stih416-clks.h
@@ -7,6 +7,7 @@
 
 /* CLOCKGEN A0 */
 #define CLK_ICN_REG		0
+#define CLK_EMISS		3
 #define CLK_ETH1_PHY		4
 
 /* CLOCKGEN A1 */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
