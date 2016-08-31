From: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Subject: [PATCH v2 0/7] dts: sun8i: add extra uart/i2c to H3
Date: Wed, 31 Aug 2016 21:30:51 +0200
Message-ID: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>

This is v2 of my patch series. Just after sending I noticed the interrupts
of i2c1 were too liberally copy/paste'd. This is fixed in v2.

This series is a follow-up to Martin Ayotte's efforts to add additional UARTS
and I2C ports to the AllWinner H3 SoC DTS files. In this series I explicitly
leave out i2c2, since this is not broken out on my boards, so I cannot verify if
it actually works.

After the patch, one enables for example uart1 on a opi+ like this from u-boot:
 => fdt set /soc/serial@01c28400 status okay

Regards,
Jorik

Jorik Jonker (7):
  dts: sun8i-h3: add pinmux definitions for uart2/uart3
  dts: sun8i-h3: add pinmux definitions for i2c0/i2c1
  dts: sun8i-h3: add i2c0/i2c1 SoC peripherals
  dts: sun8i-h3: add UART1-3 to Orange Pi Plus
  dts: sun8i-h3: add UART1-3 to Orange Pi PC
  dts: sun8i-h3: add I2C0-1 to Orange Pi Plus
  dts: sun8i-h3: add I2C0-1 to Orange Pi PC

 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts   | 25 ++++++++++++++
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 25 ++++++++++++++
 arch/arm/boot/dts/sun8i-h3.dtsi              | 50 ++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
