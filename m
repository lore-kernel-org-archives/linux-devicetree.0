From: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] media: rc: add support for Amlogic Meson IR receiver
Date: Sun, 12 Oct 2014 22:01:52 +0200
Message-ID: <1413144115-23188-1-git-send-email-b.galvani@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

this is a driver for the IR receiver available in Amlogic Meson6 and
Meson8 SoCs. The device can operate in two modes: in "NEC" mode the
hardware can decode frames using the NEC IR protocol, while in
"general" mode the receiver simply reports the duration of pulses and
spaces for software decoding.

In order to have the maximum compatibility with different protocols
the driver implements software decoding.

The third patch (dts files) depends on some other patchsets [1][2]
that are still under review, so at the moment is not meant to be
merged.

[1] https://lkml.org/lkml/2014/10/5/162
[2] https://lkml.org/lkml/2014/10/7/712

Beniamino Galvani (3):
  media: rc: add driver for Amlogic Meson IR remote receiver
  media: rc: meson: document device tree bindings
  ARM: dts: meson: add dts nodes for IR receiver

 .../devicetree/bindings/media/meson-ir.txt         |  14 ++
 arch/arm/boot/dts/meson.dtsi                       |   7 +
 arch/arm/boot/dts/meson8-vega-s89e.dts             |   6 +
 arch/arm/boot/dts/meson8.dtsi                      |   7 +
 drivers/media/rc/Kconfig                           |  11 ++
 drivers/media/rc/Makefile                          |   1 +
 drivers/media/rc/meson-ir.c                        | 214 +++++++++++++++++++++
 7 files changed, 260 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/meson-ir.txt
 create mode 100644 drivers/media/rc/meson-ir.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
