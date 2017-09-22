From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v2 0/2] Improve generic DT binding documentation for media devices
Date: Fri, 22 Sep 2017 10:42:12 +0300
Message-ID: <1506066134-25997-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi folks,

This set improves the DT binding documentation for media devices where
device specific documentation is lacking and also documents that explicit
documentation of all properties supported by the device is required.

- Port and endpoint numbering
- lane numbering for the data-lanes property

Sakari Ailus (2):
  dt: bindings: media: Document practices for DT bindings, ports,
    endpoints
  dt: bindings: media: Document data lane numbering without lane
    reordering

 .../devicetree/bindings/media/video-interfaces.txt   | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
