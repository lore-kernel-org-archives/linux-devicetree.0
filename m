From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 0/4] ARM64: dts: rockchip: add support for RK3399
Date: Fri, 22 Apr 2016 13:21:31 +0800
Message-ID: <1461302491-13233-1-git-send-email-jay.xu@rock-chips.com>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461122150-9042-1-git-send-email-jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add dtsi file for RK3399 SoCs, and evb dts file for RK3399 evb.

To make patch more easily to be reviewed, some nodes have been removed
temporarily, after this base file been applied, more patches will be
upstreamed independently.

Jianqun Xu (3):
  ARM64: dts: rockchip: add core dtsi file for RK3399 SoCs
  ARM64: dts: rockchip: add RK3399 evaluation board
  ARM64: dts: rockchip: add dts file for RK3399 evaluation board

Shawn Lin (1):
  Documentation: rockchip-dw-mshc: add description for rk3399

 Documentation/devicetree/bindings/arm/rockchip.txt |    6 +-
 .../devicetree/bindings/mmc/rockchip-dw-mshc.txt   |    1 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |  122 +++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 1022 ++++++++++++++++++++
 5 files changed, 1151 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399.dtsi

--
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
