From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 0/2] add dts for PopMetal board
Date: Sun,  1 Mar 2015 17:25:14 +0800
Message-ID: <1425201914-4695-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


PopMetal is a rockchip rk3288 based board made by ChipSpark,
which has many interface such as VGA,HDMI,usb,ir,sdcad and lots of
sensors such as gyroscope(L3G4200D),accelerometer(mma8452),compass(AK8963C).

http://wiki.chipspark.com/en/index.php?title=PopMetal

This patch add basic support for it, which can boot the board
into a shell with linux boot logo on hdmi, sdcard and many
sensors enabled. More feather will be enabled later.

Changes in v2:
- change "PopMetal PopMetal-RK3288 board" to "ChipSPARK PopMetal-RK3288 board"
- use GPL + X11 dual license, adviced by Heiko
- indent pwrbtn
- move node "ak8963" before "buttons"

Andy Yan (2):
  dt-bindings: add root compatible property for PopMetal board
  ARM: dts: add rk3288 PopMetal board

 Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
 arch/arm/boot/dts/rk3288-popmetal.dts              | 447 +++++++++++++++++++++
 2 files changed, 451 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3288-popmetal.dts

-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
