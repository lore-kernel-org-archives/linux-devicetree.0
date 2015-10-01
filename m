From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/16] LPC18xx DTS changes for 4.4
Date: Thu,  1 Oct 2015 22:54:37 +0200
Message-ID: <1443732893-17145-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set includes the DTS changes for lpc18xx for v4.4. Mostly
additions of new nodes to lpc18xx.dtsi for drivers that when upstream
during the last cycle and board updates to the Hitex and Embedded
Artists boards.


Ariel D'Alessandro (3):
  ARM: dts: lpc18xx: add watchdog node
  ARM: dts: lpc18xx: add sct pwm node
  ARM: dts: lpc4350-hitex-eval: add i2c0 and devices

Joachim Eastwood (13):
  ARM: dts: lpc18xx: add rgu node
  ARM: dts: lpc18xx: add spifi node
  ARM: dts: lpc18xx: add dmac node
  ARM: dts: lpc18xx: add dmamux node
  ARM: dts: lpc18xx: add dma to ssp0/1
  ARM: dts: lpc18xx: add dma to uart0/1/2/3
  ARM: dts: lpc18xx: add i2c nodes
  ARM: dts: lpc18xx: add resets entry to device nodes
  ARM: dts: lpc4357-ea4357: add spifi and flash device
  ARM: dts: lpc4357-ea4357: add ssp0
  ARM: dts: lpc4357-ea4357: add i2c0 and devices
  ARM: dts: lpc4350-hitex-eval: add spifi and flash device
  ARM: dts: lpc4350-hitex-eval: add joystick, buttons and leds

 arch/arm/boot/dts/lpc18xx.dtsi              | 134 +++++++++++++++++++++
 arch/arm/boot/dts/lpc4350-hitex-eval.dts    | 175 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/lpc4357-ea4357-devkit.dts |  95 +++++++++++++++
 3 files changed, 404 insertions(+)

-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
