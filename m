From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/9] ARM: sun9i: a80: Enable GMAC
Date: Wed,  6 Feb 2019 11:32:30 +0800
Message-ID: <20190206033239.3619-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBX5K5HRAKGQENB26VHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

On the Allwinner A80, the PIO pin controller includes configuration
registers to set the I/O voltage. These must match the actual voltage
provided externally. A mismatch results in signals not being passed
through.

With the new PIO pin-bank regulator supply support in place, we can
tack on support for setting up these registers.

This in turn allows us to enable the GMAC, which runs at a reduced
2.5V for RGMII, instead of the standard 3.0V or 3.3V.

Please have a look.


Regards
ChenYu


Chen-Yu Tsai (9):
  pinctrl: sunxi: Support I/O bias voltage setting on A80
  ARM: dts: sun9i: a80-optimus: Add node for AXP809's unused dc1sw
    regulator
  ARM: dts: sun9i: a80-optimus: Add GPIO pin-bank regulator supplies
  ARM: dts: sun9i: cubieboard4: Add GPIO pin-bank regulator supplies
  ARM: dts: sun9i: Add GMAC clock node
  ARM: dts: sun9i: Add A80 GMAC gigabit ethernet controller node
  ARM: dts: sun9i: Add A80 GMAC RGMII pinmux setting
  ARM: dts: sun9i: a80-optimus: Enable GMAC
  ARM: dts: sun9i: cubieboard4: Enable GMAC

 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 44 +++++++++++++-
 arch/arm/boot/dts/sun9i-a80-optimus.dts     | 44 +++++++++++++-
 arch/arm/boot/dts/sun9i-a80.dtsi            | 65 +++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80.c   |  1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 41 +++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 12 ++++
 7 files changed, 202 insertions(+), 6 deletions(-)

-- 
2.20.1
