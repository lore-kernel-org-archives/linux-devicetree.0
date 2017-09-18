From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH 0/2] Improve generic DT binding documentation for media devices
Date: Mon, 18 Sep 2017 11:25:03 +0300
Message-ID: <1505723105-16238-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi folks,

This set improves the DT binding documentation for media devices where
device specific documentation is lacking:

- Port and endpoint numbering
- lane numbering for the data-lanes property

Sakari Ailus (2):
  dt: bindings: media: Document port and endpoint numbering
  dt: bindings: media: Document data lane numbering without lane
    reordering

 .../devicetree/bindings/media/video-interfaces.txt      | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
