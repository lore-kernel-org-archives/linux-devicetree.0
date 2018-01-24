From: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 0/2] media: ov7670: Implement mbus configuration
Date: Wed, 24 Jan 2018 10:30:48 +0100
Message-ID: <1516786250-3750-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: corbet-T1hC0tSOHrs@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,
   4th round for this series, now based on Hans' 'parm' branch from
git://linuxtv.org/hverkuil/media_tree.git

I addressed Sakari's comments on bindings documentation and driver error path,
and I hope to get both driver and bindings acked to have this included in next
merge window.

Thanks
   j

v3->v4:
- Change bindings documentation to drop default value as vsync and hsync
  polarities are now required properties
- Do not put fwnode handle in driver dt parse error path as dev_fwnode() does
  not increase ref counting

v2->v3:
- Drop 'pll-bypass' property
- Make 'plck-hb-disable' a boolean optional property
- List 'hsync' and 'vsync' polarities as required endpoint properties
- Restructured 'ov7670_parse_dt()' function to reflect the above changes

v1->v2:
- Split bindings description and implementation
- Addressed Sakari's comments on v1
- Check for return values of register writes in set_fmt()
- TODO: decide if "pll-bypass" should be an OF property.

Jacopo Mondi (2):
  media: dt-bindings: Add OF properties to ov7670
  v4l2: i2c: ov7670: Implement OF mbus configuration

 .../devicetree/bindings/media/i2c/ov7670.txt       | 16 +++-
 drivers/media/i2c/ov7670.c                         | 98 ++++++++++++++++++----
 2 files changed, 98 insertions(+), 16 deletions(-)

--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
