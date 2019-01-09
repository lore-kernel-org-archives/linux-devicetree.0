From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 1/5] ARM: dts: sun8i: r40: Add pinmux settings
 for UART3 on PG pingroup
Date: Wed,  9 Jan 2019 23:02:53 +0800
Message-ID: <20190109150257.12602-2-wens@csie.org>
References: <20190109150257.12602-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBKM23DQQKGQEB7M7RMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190109150257.12602-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

UART3 on the PG pingroup on the R40 SoC is commonly used to connect the
bluetooth controller in a WiFi+Bluetooth combo chip, with the WiFi bits
also on the PG pingroup.

This patch adds two device nodes for UART3 on PG pingroup, one for the
RX/TX pins, and one for the RTS/CTS pins. Consumers can reference either
just the RX/TX pinmux setting or both, depending on the application.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 89762dbefe42..f1fcfa0bdce0 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -389,6 +389,16 @@
 				pins = "PB22", "PB23";
 				function = "uart0";
 			};
+
+			uart3_pg_pins: uart3-pg-pins {
+				pins = "PG6", "PG7";
+				function = "uart3";
+			};
+
+			uart3_rts_cts_pg_pins: uart3-rts-cts-pg-pins {
+				pins = "PG8", "PG9";
+				function = "uart3";
+			};
 		};
 
 		wdt: watchdog@1c20c90 {
-- 
2.20.1
