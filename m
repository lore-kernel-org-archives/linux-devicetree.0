From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] remoteproc: add CSRatlas7 remoteproc driver
Date: Tue, 15 Sep 2015 05:37:06 +0000
Message-ID: <1442295429-19137-1-git-send-email-21cnbao@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: workgroup.linux-kQvG35nSl+M@public.gmane.org, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>

The first two patches make remoteproc support non-slave remote processors.
the last one adds CSRatlas7 support.

Wei Chen (3):
  drivers:remoteproc:support predefined vq notifyid
  drivers:remoteproc:support always on remote processor
  remoteproc: add CSRatlas7 remoteproc driver

 .../bindings/remoteproc/sirf,remoteproc.txt        |  33 ++
 drivers/remoteproc/Kconfig                         |  13 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/remoteproc_core.c               |  21 +-
 drivers/remoteproc/remoteproc_virtio.c             |   8 +
 drivers/remoteproc/sirf_remoteproc.c               | 467 +++++++++++++++++++++
 include/linux/remoteproc.h                         |   4 +-
 7 files changed, 541 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/sirf,remoteproc.txt
 create mode 100644 drivers/remoteproc/sirf_remoteproc.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
