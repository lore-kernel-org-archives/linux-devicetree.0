From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/4] Add AXP209 GPIO driver
Date: Wed,  9 Mar 2016 11:50:10 +0100
Message-ID: <1457520614-32239-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBVMGQC3QKGQEMAZFXPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

The axp209 PMIC used in combination to some Allwinner SoCs has a bunch
of GPIOs accessible. Some boards use these to control their backlight
or a few LEDs.

There's supposed to be 4 of them, but the fourth one has a different
configuration register scheme, and I couldn't find any board that was
using this GPIO. It will be probably be supported eventually, but
until then, we support only the first 3 GPIOs.

Let me know what you think,
Maxime

Maxime Ripard (4):
  gpio: Add AXP209 GPIO driver
  mfd: axp20x: Add AXP209 GPIO driver to the mfd
  ARM: dt: axp209: Add AXP209 GPIO driver
  ARM: sun5i: chip: Add status LED

 .../devicetree/bindings/gpio/gpio-axp209.txt       |  30 ++++
 arch/arm/boot/dts/axp209.dtsi                      |   6 +
 arch/arm/boot/dts/sun5i-r8-chip.dts                |  10 ++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-axp209.c                         | 166 +++++++++++++++++++++
 drivers/mfd/axp20x.c                               |   3 +
 7 files changed, 222 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
 create mode 100644 drivers/gpio/gpio-axp209.c

-- 
2.7.2
