From: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Subject: [PATCH v4 0/8] dts: sun8i-h3: complete UART I2C definitions for H3
Date: Wed,  7 Sep 2016 09:58:53 +0200
Message-ID: <1473235141-12768-1-git-send-email-jorik@kippendief.biz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>

Of course, minutes after sending you notice a huge copy/paste error in
the submitted patch. Mae culpa, and here is a new version.

This is my fourth attempt to complete the UART/I2C definitions on H3.
Changes since v3:
 * I was sloppy when I copy/pasted the i2c2 peripheral, so it had to
   share clocks/resets and interrupts with i2c1. This is fixed now.

Changes since v2:
 * I have moved the pinmux/peripheral associations to the H3 DTSI file,
   including already existing associations for UART0 and UART1.
 * I have left out _a and @0 prefixes where there is only one option
 * I have added i2c2, since it is there (although not exposed on my test
   board)

Best,

Jorik


Jorik Jonker (8):
  dts: sun8i-h3: drop _a and address suffix from uart0 pinmux
  dts: sun8i-h3: clarify uart1 pinmux definition name
  dts: sun8i-h3: move uart0 pinmux/peripheral assocation to DSTI
  dts: sun8i-h3: move uart1 pinmux/peripheral assocation to DSTI
  dts: sun8i-h3: add pinmux definitions for UART2-3
  dts: sun8i-h3: associate pinmux/peripherals for UART2-3
  dts: sun8i-h3: add pinmux definitions for I2C0-2
  dts: sun8i-h3: add I2C0-2 peripherals to H3 SOC

 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts |  4 --
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts       |  2 -
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts     |  2 -
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts      |  2 -
 arch/arm/boot/dts/sun8i-h3.dtsi                 | 86 ++++++++++++++++++++++++-
 5 files changed, 84 insertions(+), 12 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
