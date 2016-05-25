From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [RFC/PATCH 0/2] Adding support to expose mtd flash otp regions via nvmem
Date: Wed, 25 May 2016 14:26:45 -0700
Message-ID: <1464211607-8843-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

attached series allows exporting mtd flash otp regions via nvmem.
This is my first stab and still needs cleanup, but I wanted to get some
general feedback on whether this can conceptually work.

In an earlier conversation with Boris (in Cc) he suggested (I think),
something similar to what I tried to implement.

If someone has suggestions (especially on how to deduplicate some of the parsing
code w.r.t to partitions I'd be happy to rework the series)

Thanks for your feedback,

Moritz

Moritz Fischer (2):
  doc: bindings: Add bindings documentation for mtd otp nvmem
  mtd: otp: Expose mtd flash otp regions as nvmem providers

 .../devicetree/bindings/mtd/otp-nvmem.txt          |  62 ++++++++++
 drivers/mtd/Kconfig                                |   8 ++
 drivers/mtd/Makefile                               |   1 +
 drivers/mtd/mtdcore.c                              |  35 ++++++
 drivers/mtd/mtdcore.h                              |   1 +
 drivers/mtd/mtdnvmem.c                             | 127 +++++++++++++++++++++
 drivers/mtd/mtdnvmem.h                             |  25 ++++
 drivers/mtd/mtdpart.c                              | 112 ++++++++++++++++++
 drivers/mtd/ofpart.c                               | 102 +++++++++++++++++
 9 files changed, 473 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/otp-nvmem.txt
 create mode 100644 drivers/mtd/mtdnvmem.c
 create mode 100644 drivers/mtd/mtdnvmem.h

-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
