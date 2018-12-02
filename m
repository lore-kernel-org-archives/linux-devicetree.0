From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/5] ARM: dts: imx6ul-pico-hobbit: Make the child led nodes standard
Date: Sun,  2 Dec 2018 19:18:07 -0200
Message-ID: <20181202211809.11621-4-otavio@ossystems.com.br>
References: <20181202211809.11621-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181202211809.11621-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <festevam@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

Use the same child led node and label name as used in the
imx7d-pico-hobbit board.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/imx6ul-pico-hobbit.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
index 3cc04dd6f341..8656ccbb5a06 100644
--- a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
@@ -15,8 +15,8 @@
 	leds {
 		compatible = "gpio-leds";
 
-		hobbitled {
-			label = "hobbitled";
+		led {
+			label = "gpio-led";
 			gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 		};
 	};
-- 
2.19.2
