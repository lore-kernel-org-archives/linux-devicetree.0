From: Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH] ARM: dts: at91: sama5d2 Xplained: Correct the macb irq pinctrl node
Date: Thu, 18 Feb 2016 11:21:06 +0100
Message-ID: <1455790866-13301-1-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Linux GPIO List <linux-gpio@vger.kernel.org>, Romain Izard <romain.izard.pro@gmail.com>
List-Id: devicetree@vger.kernel.org

All pinctrl nodes for the Atmel pinctrl controller need to have their
bias configuration explicitly defined. Otherwise, the pinctrl mapping
is not valid.

It works for now as the pinctrl driver proceeds even with invalid
mappings, but this can become an issue, if the pinctrl driver starts
to require valid mappings. Additionally, the pin is not protected from
being remapped later by an other driver.

There is an external 1k=E2=84=A6 pull-up to 3.3V, so no bias is require=
d on
the Ethernet PHY's interrupt line.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
 arch/arm/boot/dts/at91-sama5d2_xplained.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boo=
t/dts/at91-sama5d2_xplained.dts
index e683856c507c..75341eec2dfd 100644
--- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
+++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
@@ -308,6 +308,7 @@
=20
 				pinctrl_macb0_phy_irq: macb0_phy_irq {
 					pinmux =3D <PIN_PC9__GPIO>;
+					bias-disable;
 				};
=20
 				pinctrl_pdmic_default: pdmic_default {
--=20
2.5.0
