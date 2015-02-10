From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 0/4] media: ov2640: add device tree support
Date: Tue, 10 Feb 2015 17:31:32 +0800
Message-ID: <1423560696-12304-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series add device tree support for ov2640. And also add
the document for the devicetree properties.
v4->v5:
  1. based on soc-camera v4l2-clk changes.
  2. remove the master_clk related (one commit), we only have one clk.

v3->v4:
  1. refined the dt document.
  2. Add Laurent's acked-by.

v2->v3:
  1. fix the gpiod_xxx api usage as we use reset pin as ACTIVE_LOW.
  2. update the devicetree binding document.

v1 -> v2:
  1.  modified the dt bindings according to Laurent's suggestion.
  2. add a fix patch for soc_camera. Otherwise the .reset() function
won't work.

Josh Wu (4):
  media: soc-camera: use icd->control instead of icd->pdev for reset()
  media: ov2640: add async probe function
  media: ov2640: add primary dt support
  media: ov2640: dt: add the device tree binding document

 .../devicetree/bindings/media/i2c/ov2640.txt       |  46 ++++++++
 drivers/media/i2c/soc_camera/ov2640.c              | 117 ++++++++++++++++++---
 drivers/media/platform/soc_camera/soc_camera.c     |   8 +-
 3 files changed, 152 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2640.txt

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
