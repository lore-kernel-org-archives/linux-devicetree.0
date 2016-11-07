From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/3] Venus remoteproc driver
Date: Mon,  7 Nov 2016 19:30:50 +0200
Message-ID: <1478539853-23218-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

here is v2 of the Venus remoteproc driver, the changes are:
	- removed page table size and page table init SCM calls.

regards,
Stan

Stanimir Varbanov (3):
  firmware: qcom: scm: add a video command for state setting
  dt-binding: remoteproc: venus rproc dt binding document
  remoteproc: qcom: add Venus video core firmware loader driver

 .../devicetree/bindings/remoteproc/qcom,venus.txt  |  33 ++++
 drivers/firmware/qcom_scm-32.c                     |  18 ++
 drivers/firmware/qcom_scm-64.c                     |  16 ++
 drivers/firmware/qcom_scm.c                        |  16 ++
 drivers/firmware/qcom_scm.h                        |   2 +
 drivers/remoteproc/Kconfig                         |  12 ++
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_venus_pil.c                | 213 +++++++++++++++++++++
 include/linux/qcom_scm.h                           |   2 +
 9 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
 create mode 100644 drivers/remoteproc/qcom_venus_pil.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
