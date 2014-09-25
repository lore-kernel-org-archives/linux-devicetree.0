From: Johannes Pointner <johannes.pointner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] mfd: tps65217: adds support for compatible string of subdevices
Date: Thu, 25 Sep 2014 08:31:37 +0200
Message-ID: <3630485.2UAvhovk8D@lenovobook>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds the of_compatible string for the subdevices of the tps65217.

The TPS65217 is missing of_compatible string in the mfd_cell for its
subdevices. This compatible string is necessary to use functions like
of_find_backlight_by_node in backlight.c.

Change since v1:
1. Clarified new compatible string is for sub-node
2. Split the patch 

Johannes Pointner (2):
  mfd: tps65217: add compatible string for subdevices
  dt: bindings: tps65217: add compatible property for subnodes

 Documentation/devicetree/bindings/regulator/tps65217.txt         | 7 ++++++-
 .../devicetree/bindings/video/backlight/tps65217-backlight.txt   | 9 ++++++---
 drivers/mfd/tps65217.c                                           | 2 ++
 3 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.1.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
