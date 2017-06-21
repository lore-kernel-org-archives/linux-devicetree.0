From: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH linux 0/4] drivers/fsi: Add SBEFIFO and OCC drivers
Date: Wed, 21 Jun 2017 14:37:57 -0500
Message-ID: <1498073881-3207-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>

This series adds two FSI-based device drivers. The OCC driver is dependent on
the SBEFIFO driver, as a user of it's in-kernel API. The in-kernel API provided
by the OCC driver will be used by a hwmon driver (to be sent to the lkml soon).

I previously sent up the first patch in the series independently, but decided
to split into the base driver and the addition of the in-kernel API, as it's
a little easier to digest. So, no v2, but I did include some fixes suggested by
Greg.

Edward A. James (4):
  drivers/fsi: Add SBEFIFO FSI client device driver
  drivers/fsi/sbefifo: Add in-kernel API
  drivers/fsi: Add On-Chip Controller (OCC) driver
  drivers/fsi/occ: Add in-kernel API

 .../devicetree/bindings/fsi/ibm,p9-occ.txt         |  23 +
 drivers/fsi/Kconfig                                |  17 +
 drivers/fsi/Makefile                               |   2 +
 drivers/fsi/fsi-sbefifo.c                          | 921 +++++++++++++++++++++
 drivers/fsi/occ.c                                  | 790 ++++++++++++++++++
 include/linux/fsi-sbefifo.h                        |  30 +
 include/linux/occ.h                                |  27 +
 7 files changed, 1810 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 drivers/fsi/fsi-sbefifo.c
 create mode 100644 drivers/fsi/occ.c
 create mode 100644 include/linux/fsi-sbefifo.h
 create mode 100644 include/linux/occ.h

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
