From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: [PATCH 0/4] RFC: TDA1997x HDMI video receiver
Date: Fri, 22 Sep 2017 15:24:09 -0700
Message-ID: <1506119053-21828-1-git-send-email-tharvey@gateworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hans Verkuil <hansverk-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an RFC for a driver supporting the TDA1997x HDMI video receiver.

I've tested this on a Gateworks GW54xx with an IMX6Q which uses the TDA19971
with 16bits connected to the IMX6 CSI. For this configuration I've tested
both 16bit YUV422 and 8bit BT656 mode. While the driver should support the
TDA1993 I do not have one for testing.

Further potential development efforts include:
 - AUDIO codec support (working on this next)
 - EDID read/write support
 - CEC support
 - HDCP support
 - mbus format selection support for bus widths that support multiple formats
 - TDA19972 support (2 inputs)

Tim Harvey (4):
  MAINTAINERS: add entry for NXP TDA1997x driver
  media: dt-bindings: Add bindings for TDA1997X
  media: i2c: Add TDA1997x HDMI receiver driver
  ARM: DTS: imx: ventana: add TDA19971 HDMI Receiver to GW54xx

 .../devicetree/bindings/media/i2c/tda1997x.txt     |  159 +
 MAINTAINERS                                        |    8 +
 arch/arm/boot/dts/imx6q-gw54xx.dts                 |   85 +
 drivers/media/i2c/Kconfig                          |    9 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/tda1997x.c                       | 3065 ++++++++++++++++++++
 include/dt-bindings/media/tda1997x.h               |   78 +
 include/media/i2c/tda1997x.h                       |   53 +
 8 files changed, 3458 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/tda1997x.txt
 create mode 100644 drivers/media/i2c/tda1997x.c
 create mode 100644 include/dt-bindings/media/tda1997x.h
 create mode 100644 include/media/i2c/tda1997x.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
