From: Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 0/2] OV5645 camera sensor driver
Date: Thu,  9 Jun 2016 14:59:16 +0300
Message-ID: <1465473558-3492-1-git-send-email-todor.tomov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, matrandg-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is the fourth version of the OV5645 camera sensor driver patchset.

Only one change since version 3:
- build failure on kernel v4.7-rc1 fixed:
  s/media_entity_init/media_entity_pads_init/

Changes from version 2 include:
- external camera clock configuration is moved from DT to driver;
- pwdn-gpios renamed to enable-gpios;
- switched polarity of reset-gpios to the more intuitive active low;
- added Kconfig dependency to OF;
- return values checks;
- regulators and gpios are now required (not optional);
- regulators names renamed;
- power counter variable changed to a bool power state;
- ov5645_registered() is removed and sensor id reading moved to probe().

Changes from version 1 include:
- patch split to dt binding doc patch and driver patch;
- changes in power on/off logic - s_power is now not called on
  open/close;
- using assigned-clock-rates in dt for setting camera external
  clock rate;
- correct api for gpio handling;
- return values checks;
- style fixes.

Todor Tomov (2):
  media: i2c/ov5645: add the device tree binding document
  media: Add a driver for the ov5645 camera sensor.

 .../devicetree/bindings/media/i2c/ov5645.txt       |   50 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov5645.c                         | 1369 ++++++++++++++++++++
 4 files changed, 1432 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5645.txt
 create mode 100644 drivers/media/i2c/ov5645.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
