From: Frans Klaver <frans.klaver-MHHw4NDrbWwAvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 0/2] explicitly instantiate battery from device tree
Date: Wed, 24 Sep 2014 15:11:16 +0200
Message-ID: <1411564278-17207-1-git-send-email-frans.klaver@xsens.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Frans Klaver <frans.klaver-MHHw4NDrbWwAvxtiuMwx3w@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi there,

Here's some patches that make it possible to instantiate an sbs battery without
it being present yet.

i2c devices are more or less presumed to be persistent. This is a fair
assumption, except for the case of batteries. It is perfectly sensible for a
device to boot up using wall power, but no battery attached. While later
attaching a battery and dropping the wall power. Detecting the device from
userspace is tedious requires you to scan for device presence yourself, or you
can ask the kernel to probe again, cluttering your logs with failed probes.

I'd like to hear what you think about this.

Thanks,
Frans

Frans Klaver (2):
  sbs-battery: add forced instantiation from device tree
  sbs-battery: dts: document always-present property

 .../devicetree/bindings/power_supply/sbs_sbs-battery.txt      |  2 ++
 drivers/power/sbs-battery.c                                   | 11 +++++++++--
 include/linux/power/sbs-battery.h                             |  3 +++
 4 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
