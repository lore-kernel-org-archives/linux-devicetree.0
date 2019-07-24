From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v15 11/13] MIPS: CI20: Reduce system timer and clocksource to 3 MHz
Date: Wed, 24 Jul 2019 13:16:13 -0400
Message-ID: <20190724171615.20774-12-paul@crapouillou.net>
References: <20190724171615.20774-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724171615.20774-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me, Mathieu Malaterre <malat@debian.org>, Paul Cercueil <paul@crapouillou.net>, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

The default clock (48 MHz) is too fast for the system timer.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v5: New patch
    
    v6: Set also the rate for the clocksource channel's clock
    
    v7: No change
    
    v8: No change
    
    v9: Don't configure clock timer1, as the OS Timer is used as
    	clocksource on this SoC
    
    v10: Revert back to v8 bahaviour. Let the user choose what
    	 clocksource should be used.
    
    v11-v15: No change

 arch/mips/boot/dts/ingenic/ci20.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 4f7b1fa31cf5..2e9952311ecd 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include "jz4780.dtsi"
+#include <dt-bindings/clock/ingenic,tcu.h>
 #include <dt-bindings/gpio/gpio.h>
 
 / {
@@ -238,3 +239,9 @@
 		bias-disable;
 	};
 };
+
+&tcu {
+	/* 3 MHz for the system timer and clocksource */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
+	assigned-clock-rates = <3000000>, <3000000>;
+};
-- 
2.21.0.593.g511ec345e18
