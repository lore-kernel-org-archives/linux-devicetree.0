From: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 0/3] Rockchip: rk3399: Add core dtsi for rk3399
Date: Tue,  1 Mar 2016 14:39:58 +0800
Message-ID: <1456814401-10711-1-git-send-email-jay.xu@rock-chips.com>
References: <1456456341-14282-1-git-send-email-jay.xu@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456456341-14282-1-git-send-email-jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There is the new SoCs from Rockchip which named rk3399, the
patches are added to support them.

Jianqun Xu (1):
  ARM64: dts: rockchip: add core dtsi file for rk3399

Xing Zheng (2):
  dt-bindings: add bindings for rk3399 clock controller
  clk: rockchip: add dt-binding header for rk3399

 .../bindings/clock/rockchip,rk3399-cru.txt         |  82 ++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 951 +++++++++++++++++++++
 include/dt-bindings/clock/rk3399-cru.h             | 716 ++++++++++++++++
 3 files changed, 1749 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399.dtsi
 create mode 100644 include/dt-bindings/clock/rk3399-cru.h

-- 
changes in v3:
- fix pmucru definations
- update dtsi depends on cru changes 

1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
