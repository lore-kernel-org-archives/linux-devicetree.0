From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/2] media: ov7670: Implement mbus configuration
Date: Thu,  4 Jan 2018 10:52:31 +0100
Message-ID: <1515059553-10219-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: corbet-T1hC0tSOHrs@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,
   this series adds mbus configuration properties to ov7670 sensor driver.

I have sent v1 a few days ago and forgot to cc device tree people. Doing it
now with bindings description and implementation split in 2 separate patches.

I have fixed Sakari's comment on v1, and I'm sending v2 out with support for
"pll-bypass" custom property as it was in v1. If we decide it is not worth
to make an OF property out of it, I will drop it in v3. Technically it is not
even an mbus configuration option, so I'm fine dropping it eventually.

Thanks
  j

v1->v2:
- Split bindings description and implementation
- Addressed Sakari's comments on v1
- Check for return values of register writes in set_fmt()
- TODO: decide if "pll-bypass" should be an OF property.

Jacopo Mondi (2):
  v4l2: i2c: ov7670: Implement OF mbus configuration
  media: dt-bindings: Add OF properties to ov7670

 .../devicetree/bindings/media/i2c/ov7670.txt       |  14 +++
 drivers/media/i2c/ov7670.c                         | 124 ++++++++++++++++++---
 2 files changed, 124 insertions(+), 14 deletions(-)

--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
