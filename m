From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v2 11/11] ARM: dts: sun8i: r40: Change the RTC compatible
Date: Tue, 28 May 2019 22:30:41 +0200
Message-ID: <f123c02a0458a4a90234f636b85a2ef048075794.1559075389.git-series.maxime.ripard@bootlin.com>
References: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <434446bc5541d7dfe5823874355c7db8c7e213fa.1559075389.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Unlike what's being reported in the device tree so far, the RTC in the R40
is quite different from the H3. Indeed it doesn't have the internal
oscillator output, and it has only a single interrupt. Let's add a
compatible for it.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index bb856e53b806..6007d0cc252d 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -318,8 +318,7 @@
 		};
 
 		rtc: rtc@1c20400 {
-			compatible = "allwinner,sun8i-r40-rtc",
-				     "allwinner,sun8i-h3-rtc";
+			compatible = "allwinner,sun8i-r40-rtc";
 			reg = <0x01c20400 0x400>;
 			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 			clock-output-names = "osc32k", "osc32k-out";
-- 
git-series 0.9.1
