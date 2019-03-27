From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH 0/7] Add bluetooth, gps and accelerometer to TBS A711
Date: Wed, 27 Mar 2019 01:18:36 +0100
Message-ID: <20190327001843.2420-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBB4EC5PSAKGQEYTDACBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

This series enables some peripherals on TBS A711 tablet that already
have mainline drivers:

- GPS u-blox neo-6m (via gnss u-blox driver)
- Bluetooth (via recently added OF support in the Broadcom
  bluetooth driver)
- Accelermomter BMA-250 (hooked to the I2C bus)

It also modifies A83T DTSI and adds missing UART interfaces.

I've added additional compatible to the gnss/u-blox driver for NEO-6M,
because this board uses this module, and I don't think I can use
the existing compatible for u-blox,neo-m8, even as a fallback.

Please take a look, and apply the patches if you have no objections.

Many of the patches will go through the sunxi tree, but I'm not
sure who will want to take the GPS patches.

regards,
  Ondrej Jirman

Ondrej Jirman (7):
  ARM: dts: sun8i: tbs-a711: Enable bluetooth
  ARM: dts: sun8i: tbs-a711: Add node for BMA250 accelerometer
  ARM: dts: sun8i: a83t: Add nodes for UART2-UART4
  ARM: dts: sun8i: a83t: Add UART2 PB pins
  gnss: Add u-blox,neo-6m compatible
  dt-bindings: gnss: Add u-blox,neo-6m compatible
  ARM: dts: sun8i: tbs-a711: Enable UART2 (for NEO-6M GPS module)

 .../devicetree/bindings/gnss/u-blox.txt       |  1 +
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts     | 49 +++++++++++++++++++
 arch/arm/boot/dts/sun8i-a83t.dtsi             | 38 ++++++++++++++
 drivers/gnss/ubx.c                            |  1 +
 4 files changed, 89 insertions(+)

-- 
2.21.0
