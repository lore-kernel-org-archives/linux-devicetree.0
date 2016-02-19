From: "jianqun.xu" <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 0/6] Add core dtsi for rk3399 from Rockchip
Date: Fri, 19 Feb 2016 09:56:12 +0800
Message-ID: <1455846978-4272-1-git-send-email-jay.xu@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

There is the new SoCs from Rockchip which named rk3399, the
patches are added to support them.

Jianque Xu (4):
  soc: rockchip: add bindings for Rockchip grf
  spi: rockchip: add bindings for rk3399 spi
  ASoC: rockchip: add bindings for rk3399 i2s
  ARM64: dts: rockchip: add core dtsi file for rk3399

Xing Zheng (2):
  clk: rockchip: add dt-binding header for rk3399
  dt-bindings: add documentation of rk3399 clock controller

 .../bindings/clock/rockchip,rk3399-cru.txt         |  82 ++
 .../devicetree/bindings/soc/rockchip/grf.txt       |  35 +
 .../devicetree/bindings/sound/rockchip-i2s.txt     |   1 +
 .../devicetree/bindings/spi/spi-rockchip.txt       |   1 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 949 +++++++++++++++++++++
 drivers/spi/spi-rockchip.c                         |   1 +
 include/dt-bindings/clock/rk3399-cru.h             | 609 +++++++++++++
 7 files changed, 1678 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399.dtsi
 create mode 100644 include/dt-bindings/clock/rk3399-cru.h

-- 
changes in v4:
- restore rockchip-i2s.txt patch for rk3399-i2s (Rob)
- add grf.txt for rockchip grf (Rob, Heiko)
- reset my author name to keep same with signoff

changes in v3:
- add compatible for rk3399 spi (Mark, Heiko)

changes in v2:
- remove changeID (Heiko, Mark)
- drop pmu and psci temporary (Mark)
- drop applied patch (Heiko)
- drop GIC_CPU_MASK_SIMPLE from the interrupt specifiers (Marc, Heiko)
- drop clock-frequency of timer (Marc, Mark)
- remove double defination for SCLK_SPI5

1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
