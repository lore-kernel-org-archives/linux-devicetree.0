From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [PATCH] ARM: dts: the dts support for rk3288 firefly reload
Date: Sun, 17 Jul 2016 23:38:56 +0800
Message-ID: <1468769937-23387-1-git-send-email-ayaka@soulik.info>
References: <5614243.tqTyZoc945@phil>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5614243.tqTyZoc945@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This version is split into a reload core dtsi for the SoC module
part and a baseboard dts for the reload baseboard. Thanks to
the Heiko's advise.

Randy Li (1):
  ARM: dts: add rk3288-firefly-reload

 Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi  | 304 ++++++++++++++++++++
 arch/arm/boot/dts/rk3288-firefly-reload.dts        | 320 +++++++++++++++++++++
 4 files changed, 629 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
 create mode 100644 arch/arm/boot/dts/rk3288-firefly-reload.dts

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
