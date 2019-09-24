From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.3 74/87] ARM: dts: dir685: Drop spi-cpol from the display
Date: Tue, 24 Sep 2019 12:41:30 -0400
Message-ID: <20190924164144.25591-74-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit 2a7326caab479ca257c4b9bd67db42d1d49079bf ]

The D-Link DIR-685 had its clock polarity set as active
low using the special SPI "spi-cpol" property.

This is not correct: the datasheet clearly states:
"Fix SCL to GND level when not in use" which is
indicative that this line is active high.

After a recent fix making the GPIO-based SPI driver
force the clock line de-asserted at the beginning of
each SPI transaction this reared its ugly head: now
de-asserted was taken to mean the line should be
driven high, but it should be driven low.

Fix this up in the DTS file and the display works again.

Link: https://lore.kernel.org/r/20190915135444.11066-1-linus.walleij@linaro.org
Cc: Mark Brown <broonie@kernel.org>
Fixes: 2922d1cc1696 ("spi: gpio: Add SPI_MASTER_GPIO_SS flag")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/gemini-dlink-dir-685.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/gemini-dlink-dir-685.dts b/arch/arm/boot/dts/gemini-dlink-dir-685.dts
index bfaa2de63a100..e2030ba16512f 100644
--- a/arch/arm/boot/dts/gemini-dlink-dir-685.dts
+++ b/arch/arm/boot/dts/gemini-dlink-dir-685.dts
@@ -72,7 +72,6 @@
 			reg = <0>;
 			/* 50 ns min period = 20 MHz */
 			spi-max-frequency = <20000000>;
-			spi-cpol; /* Clock active low */
 			vcc-supply = <&vdisp>;
 			iovcc-supply = <&vdisp>;
 			vci-supply = <&vdisp>;
-- 
2.20.1
