From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] isp1760: Allow device-tree-based probing on non-powerpc architectures
Date: Wed, 14 Sep 2011 14:57:11 +0100
Message-ID: <1316008633-31009-1-git-send-email-dave.martin@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Arvid Brodin <arvid.brodin-AM1FMPraTHU@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are a couple of minor issues which currently prevent the
isp1760 driver probing via the device tree on architectures other
than powerpc.

This series should allow device-tree probing for this driver to
work more widely.

Dave Martin (2):
  isp1760: Make probing via device tree non-powerpc-specific
  isp1760: Fix endianness-sensitivity in of_isp1760_probe()

 drivers/usb/host/isp1760-if.c |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

-- 
1.7.4.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
