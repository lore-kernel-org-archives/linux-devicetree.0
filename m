From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] mtd: m25p80: fix some module and documentation issues
Date: Mon, 16 Nov 2015 14:34:49 -0800
Message-ID: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

There were a few mistakes and improvements pointed out at various points in
this thread, subject:

    spi: OF module autoloading is still broken
    (was: Re: m25p80: Commit "allow arbitrary OF matching for "jedec,spi-nor""
    breaks module autoloading)

    http://lists.infradead.org/pipermail/linux-mtd/2015-October/062369.html
    https://lkml.org/lkml/2015/11/12/574

That thread covers some other interesting issues that are still not solved, but
let's fix the ones we can here in MTD right now.

Regards,
Brian


Brian Norris (3):
  mtd: m25p80: fix module autoloading for "jedec,spi-nor" and "spi-nor"
  mtd: m25p80: replace leftover "nor-jedec" with "spi-nor" in comments
  doc: dt: mtd: stop referring to driver code for spi-nor IDs

 .../devicetree/bindings/mtd/jedec,spi-nor.txt      | 56 ++++++++++++++++++++--
 drivers/mtd/devices/m25p80.c                       | 17 +++++--
 2 files changed, 64 insertions(+), 9 deletions(-)

-- 
2.6.0.rc2.230.g3dd15c0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
