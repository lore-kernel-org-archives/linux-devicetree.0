From: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: the dts support for rk3288 firefly reload
Date: Thu,  7 Jul 2016 02:22:57 +0800
Message-ID: <1467829380-16242-1-git-send-email-ayaka@soulik.info>
References: <3015470.z4L7UQJKa9@phil>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3015470.z4L7UQJKa9@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The rk3288 firefly reload  is a Rockchip RK3288 based board be found by
core board and main board. The regulators are connected in a different
way to the previous version of firefly boards, it is necessary to
move some common code to uncommon place.

I only tested the ethernet and confirmed that works.
The usb in this board won't caused by the bugs in the driver.

This version follow the suggests from Heiko Stuebner,
except the duplicated supply name problem, I don't think
it could be fixed in that way.

Randy Li (3):
  ARM: dts: add label leds for rk3288-firefly.dtsi
  ARM: dts: move regulator settings from common to specifics
  ARM: dts: add rk3288-firefly-reload

 arch/arm/boot/dts/Makefile                  |   1 +
 arch/arm/boot/dts/rk3288-firefly-beta.dts   |  30 ++++++++
 arch/arm/boot/dts/rk3288-firefly-reload.dts | 109 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/rk3288-firefly.dts        |  30 ++++++++
 arch/arm/boot/dts/rk3288-firefly.dtsi       |  16 ++--
 5 files changed, 178 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/boot/dts/rk3288-firefly-reload.dts

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
