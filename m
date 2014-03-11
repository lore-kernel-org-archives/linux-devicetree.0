From: RongJun Ying <rjying-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] mfd: Add SiRF audio MFD driver
Date: Tue, 11 Mar 2014 10:36:25 +0800
Message-ID: <1394505387-13665-1-git-send-email-rongjun.ying@csr.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, workgroup.linux-kQvG35nSl+M@public.gmane.org, Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>

This patchset adds SiRF audio MFD driver including:
1. The SiRF audio MFD driver
2. The document of device tree binding

Rongjun Ying (2):
  mfd: Support SiRF audio modules
  Documentation: Describe the SiRF audio Device Tree bindings

 .../devicetree/bindings/mfd/sirf-audio.txt         |   51 ++++++++
 drivers/mfd/Kconfig                                |   10 ++
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/sirf-audio.c                           |  128 ++++++++++++++++++++
 include/linux/mfd/sirf/audio.h                     |   22 ++++
 5 files changed, 212 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/sirf-audio.txt
 create mode 100644 drivers/mfd/sirf-audio.c
 create mode 100644 include/linux/mfd/sirf/audio.h

-- 
1.7.5.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
