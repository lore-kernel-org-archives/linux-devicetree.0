From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/7] ARM: sun9i: R_PIO, IR receiver and RSB support
Date: Tue,  1 Dec 2015 13:47:18 +0800
Message-ID: <1448948845-28347-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB7HI6SZAKGQE7WFU43I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series adds support for various peripherals in the "special/RTC"
block of the Allwinner A80 SoC that use the PRCM clocks and reset
controls. The majority of this series are DTS patches, enabling
peripherals using existing drivers. The only driver patch is for the
R_PIO pin controller.

This series is based on my earlier sun9i PRCM series. The pinctrl 
patch has no dependencies though. All patches target sun9i-a80:

Patch 1 adds a driver for the R_PIO "special CPU" block pin controller.
This was done by Maxime over a year ago, when the A80 was first available.

Patch 2 adds the R_PIO pinctrl device node.

Patch 3 enables LED3 on the A80 Optimus board. This is driven by a GPIO
from R_PIO.

Patch 4 adds a consumer IR receiver device node, which is compatible with
earlier Allwinner SoCs, and its associated pinmux.

Patch 5 enables the consumer IR receiver on the A80 Optimus.

Patch 6 adds a device node for the RSB controller. This controller is
compatible with the one found on the A23/A33.

Patch 7 enables the RSB controller on the A80 Optimus.

Still to come are A80-related PMIC drivers and DTS patches.


Regards
ChenYu

Chen-Yu Tsai (6):
  ARM: dts: sun9i: Add A80 R_PIO pin controller device node
  ARM: dts: sun9i: optimus: Enable LED3
  ARM: dts: sun9i: Add consumer IR receiver device node and pinmux
    settings
  ARM: dts: sun9i: optimus: Enable consumer IR receiver
  ARM: dts: sun9i: Add Reduced Serial Bus controller device node to A80
    dtsi
  ARM: dts: sun9i: optimus: Enable Reduced Serial Bus controller

Maxime Ripard (1):
  pinctrl: sunxi: Add A80 special pin controller

 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |   2 +
 arch/arm/boot/dts/sun9i-a80-optimus.dts            |  24 ++-
 arch/arm/boot/dts/sun9i-a80.dtsi                   |  54 ++++++
 drivers/pinctrl/sunxi/Kconfig                      |   5 +
 drivers/pinctrl/sunxi/Makefile                     |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c        | 181 +++++++++++++++++++++
 6 files changed, 265 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun9i-a80-r.c

-- 
2.6.2
