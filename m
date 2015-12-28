From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: [PATCH v2 0/4] Qualcomm WCNSS Peripheral Image Loader
Date: Sun, 27 Dec 2015 17:15:42 -0800
Message-ID: <1451265346-14969-1-git-send-email-bjorn.andersson@sonymobile.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fengwei.yin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series provides the minimum changes needed to use remotproc on the
Qualcomm platform and then introduces the Peripheral Image Loader for
the WCNSS core.

Bjorn Andersson (4):
  remoteproc: core: Make the loaded resource table optional
  remoteproc: Add additional crash reasons
  dt-binding: remoteproc: Introduce Qualcomm WCNSS loader binding
  remoteproc: qcom: Introduce WCNSS peripheral image loader

 .../bindings/remoteproc/qcom,wcnss-pil.txt         |  92 ++++
 drivers/remoteproc/Kconfig                         |  11 +
 drivers/remoteproc/Makefile                        |   2 +
 drivers/remoteproc/qcom_mdt_loader.c               | 213 ++++++++
 drivers/remoteproc/qcom_mdt_loader.h               |   8 +
 drivers/remoteproc/qcom_wcnss.c                    | 550 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_core.c               |  10 +-
 include/linux/remoteproc.h                         |   4 +
 8 files changed, 884 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
 create mode 100644 drivers/remoteproc/qcom_mdt_loader.c
 create mode 100644 drivers/remoteproc/qcom_mdt_loader.h
 create mode 100644 drivers/remoteproc/qcom_wcnss.c

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
