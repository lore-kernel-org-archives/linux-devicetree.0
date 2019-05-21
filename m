From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v12 12/13] MIPS: GCW0: Reduce system timer and clocksource to 750 kHz
Date: Tue, 21 May 2019 16:51:40 +0200
Message-ID: <20190521145141.9813-13-paul@crapouillou.net>
References: <20190521145141.9813-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521145141.9813-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>
Cc: Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

The default clock (12 MHz) is too fast for the system timer.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v8: New patch
    
    v9: Don't configure clock timer1, as the OS Timer is used as
    	clocksource on this SoC
    
    v10: Revert back to v8 bahaviour. Let the user choose what
    	 clocksource should be used.
    
    v11: No change
    
    v12: Move clocksource to channel 2, as channel 1 is used as PWM
    	 for the backlight.

 arch/mips/boot/dts/ingenic/gcw0.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
index 35f0291e8d38..f58d239c2058 100644
--- a/arch/mips/boot/dts/ingenic/gcw0.dts
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include "jz4770.dtsi"
+#include <dt-bindings/clock/ingenic,tcu.h>
 
 / {
 	compatible = "gcw,zero", "ingenic,jz4770";
@@ -60,3 +61,12 @@
 	/* The WiFi module is connected to the UHC. */
 	status = "okay";
 };
+
+&tcu {
+	/* 750 kHz for the system timer and clocksource */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
+	assigned-clock-rates = <750000>, <750000>;
+
+	/* PWM1 is in use, so reserve channel #2 for the clocksource */
+	ingenic,pwm-channels-mask = <0xfa>;
+};
-- 
2.21.0.593.g511ec345e18
