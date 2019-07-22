From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 07/11] ARM: dts: sun6i: Add missing timers interrupts
Date: Mon, 22 Jul 2019 10:12:25 +0200
Message-ID: <20190722081229.22422-7-maxime.ripard@bootlin.com>
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722081229.22422-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The timer unit in the A31 has 6 interrupts available. List all of them.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index dcddc3392460..4c1ac7e58ae3 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -736,7 +736,8 @@
 				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&osc24M>;
 		};
 
-- 
2.21.0
