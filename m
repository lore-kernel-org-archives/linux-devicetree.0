From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 0/8] pinctrl-rockchip: Change wrong initial assumptions
Date: Mon, 05 May 2014 13:57:31 +0200
Message-ID: <11862890.WUjscWaP3U@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Initially due to lack of documentation and (personal) understanding
I assumed that the area holding the iomux settings would be separate
from everything else, while in fact the grf registers contain not only
pinctrl stuff but also dma, usb-phy and general soc-status settings.
Also things like drive-strength we do not support currently are intermixed.

The same is true for the pmu, which does not only contain power domains
but also the system reset as well as well as general registers surviving
system-resets. Additionally the rk3188 moved parts of the pull-setting
registers into the pmu space.

While this wasn't a problem until now, the upcoming rk3288 introduces
additional changes to both the grf and pmu areas. On it even part of
the pinmux registers move into the pmu space.

The code in it's current form supports both the old as well as the
changed bindings.

As stated in the v1 thread, this is also a first step to deprecate the
wrongly included gpio-controllers which now duplicate the recently added
gpio-dwapb, that should be used instead.


changes since v1:
- add select MFD_SYSCON as suggested by Max

Heiko Stuebner (8):
  pinctrl: rockchip: do not require 2nd register area
  pinctrl: rockchip: use regmaps instead of raw mappings
  pinctrl: rockchip: rockchip_pinctrl in rockchip_get_bank_data
  pinctrl: rockchip: let pmu registers be supplied by a syscon
  pinctrl: rockchip: only map bank0-pull-region when pmu regmap missing
  pinctrl: rockchip: base regmap supplied by a syscon
  dt-bindings: adapt rockchip-pinctrl doc to changed bindings
  ARM: dts: rockchip: convert pinctrl nodes to new bindings

 .../bindings/pinctrl/rockchip,pinctrl.txt          |  28 +++-
 arch/arm/boot/dts/rk3066a.dtsi                     |   2 +-
 arch/arm/boot/dts/rk3188.dtsi                      |   9 +-
 arch/arm/boot/dts/rk3xxx.dtsi                      |   9 +-
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/pinctrl-rockchip.c                 | 178 +++++++++++++++------
 6 files changed, 165 insertions(+), 62 deletions(-)

-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
