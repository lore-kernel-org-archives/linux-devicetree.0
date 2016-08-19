From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] Venus remoteproc driver
Date: Fri, 19 Aug 2016 18:53:16 +0300
Message-ID: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

The first patch adds a call to qcom SCM driver which helps to change
the Venus core state, in practice it is used for supend and resume
the video core. Second patch add two SCM calls needed by Venus
remoteproc driver in order to load and authenticate the firmware.

Next two patches add dt binding document and the Venus remoteproc
driver itself.

Comments are welcome.

regards,
Stan

Stanimir Varbanov (4):
  firmware: qcom: scm: add a video command for state setting
  firmware: qcom: scm: add iommu scm calls for pg table
  dt-binding: remoteproc: venus rproc dt binding document
  remoteproc: qcom: add Venus video core firmware loader driver

 .../devicetree/bindings/remoteproc/qcom,venus.txt  |  33 +++
 drivers/firmware/qcom_scm-32.c                     |  18 ++
 drivers/firmware/qcom_scm-64.c                     |  58 ++++++
 drivers/firmware/qcom_scm.c                        |  28 +++
 drivers/firmware/qcom_scm.h                        |  13 ++
 drivers/remoteproc/Kconfig                         |  10 +
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/qcom_venus_pil.c                | 226 +++++++++++++++++++++
 include/linux/qcom_scm.h                           |   5 +
 9 files changed, 392 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
 create mode 100644 drivers/remoteproc/qcom_venus_pil.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
