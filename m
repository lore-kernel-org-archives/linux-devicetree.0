From: Wenyou Yang <wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v5 0/2] media: ov7740: Add a V4L2 sensor-level driver
Date: Tue, 28 Nov 2017 13:22:57 +0800
Message-ID: <20171128052259.4957-1-wenyou.yang@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wenyou Yang <wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a Video4Linux2 sensor-level driver for the OmniVision OV7740
VGA camera image sensor.

Changes in v5:
 - Squash the driver and MAINTAINERS entry patches to one.
 - Precede the driver patch with the bindings patch.

Changes in v4:
 - Assign 'val' a initial value to avoid warning: 'val' may be
   used uninitialized.
 - Rename REG_REG15 to avoid warning: "REG_REG15" redefined.

Changes in v3:
 - Explicitly document the "remote-endpoint" property.
 - Put the MAINTAINERS change to a separate patch.

Changes in v2:
 - Split off the bindings into a separate patch.
 - Add a new entry to the MAINTAINERS file.

Wenyou Yang (2):
  media: ov7740: Document device tree bindings
  media: i2c: Add the ov7740 image sensor driver

 .../devicetree/bindings/media/i2c/ov7740.txt       |   47 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |    8 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov7740.c                         | 1220 ++++++++++++++++++++
 5 files changed, 1284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov7740.txt
 create mode 100644 drivers/media/i2c/ov7740.c

-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
