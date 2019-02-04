From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 01/12] ARM: dts: da850: fix interrupt numbers for clocksource
Date: Mon,  4 Feb 2019 18:17:46 +0100
Message-ID: <20190204171757.32073-2-brgl@bgdev.pl>
References: <20190204171757.32073-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204171757.32073-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The timer interrupts specified in commit 3652e2741f42 ("ARM: dts:
da850: Add clocks") are wrong but since the current timer code
hard-codes them, the bug was never spotted.

This patch must go into stable since, once we introduce a proper
clocksource driver, devices with buggy device tree will stop booting.

Fixes: 3652e2741f42 ("ARM: dts: da850: Add clocks")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/boot/dts/da850.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 47aa53ba6b92..559659b399d0 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -476,7 +476,7 @@
 		clocksource: timer@20000 {
 			compatible = "ti,da830-timer";
 			reg = <0x20000 0x1000>;
-			interrupts = <12>, <13>;
+			interrupts = <21>, <22>;
 			interrupt-names = "tint12", "tint34";
 			clocks = <&pll0_auxclk>;
 		};
-- 
2.20.1
