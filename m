From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 0/4] ARM64: dts: rockchip: add support for RK3399
Date: Tue, 26 Apr 2016 10:36:42 +0800
Message-ID: <1461638206-20473-1-git-send-email-jay.xu@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lintao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add dtsi file for RK3399 SoCs, and evb dts file for RK3399 evb.

To make patch more easily to be reviewed, some nodes have been removed
temporarily, after this base file been applied, more patches will be
upstreamed independently.

Jianqun Xu (3):
  ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
  Documentation: devicetree: rockchip: Document rk3399-evb
  ARM64: dts: rockchip: add dts file for RK3399 evaluation board

Shawn Lin (1):
  Documentation: rockchip-dw-mshc: add description for rk3399

 Documentation/devicetree/bindings/arm/rockchip.txt |    6 +-
 .../devicetree/bindings/mmc/rockchip-dw-mshc.txt   |    1 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |  125 +++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 1022 ++++++++++++++++++++
 5 files changed, 1154 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399.dtsi

--
changes in v3:
- modify title for patch 3/4 (Brian)
- add more compatible for evb dts (Doug)

changes in v2:
- split into more patches. (Heiko)
- remove arm-pmu at first. (Marc, Heiko, Mark)
- remove rga, emmc, usb3, mipi, edp, pd, i2c, gpu, thermal, tsadc, saradc, which will upstream independently
- remove rk808 since without i2c, which will upstream independently
- remove es8316 since without i2c, which will upstream independently
- add rockchip-dw-mshc binding patch
- add rockchip,rk3399-evb binding patch
- fix codingstyle issues

1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
