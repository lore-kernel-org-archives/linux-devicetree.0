From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] lis3lv02d: update DT binding for use with Nokia N900
Date: Fri, 13 Dec 2013 21:54:50 +0100
Message-ID: <1386968094-24554-1-git-send-email-sre@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Eric Piel <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

The lis302 has already a DT binding described in [0],
which descibes misc. hardware properties. The current
binding does not support all values needed to convert
the Nokia N900's platform data to DT.

This patchset introduces support for describing inverted
axis, configuration of second wakeup unit and wakeup
threshold support.

[0] Documentation/devicetree/bindings/misc/lis302.txt

-- Sebastian

Sebastian Reichel (4):
  of: introduce of_property_read_s32
  lis3lv02d: DT: use s32 to support negative values
  lis3lv02d: DT: add wakeup unit 2 and wakeup threshold
  Documentation: DT: lis302: update wakeup binding

 Documentation/devicetree/bindings/misc/lis302.txt |  9 +++-
 drivers/misc/lis3lv02d/lis3lv02d.c                | 56 +++++++++++++++--------
 include/linux/of.h                                |  7 +++
 3 files changed, 52 insertions(+), 20 deletions(-)

-- 
1.8.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
