From: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 0/6] Add support for Hexagon q6v5-wcss integrated core
Date: Thu,  9 Nov 2017 20:16:09 +0530
Message-ID: <1510238775-14883-1-git-send-email-sricharan@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

IPQ8074 has an integrated Hexagon dsp core Q6v5 and a wireless lan
(Lithium) IP. This series adds the remoteproc driver to reset, load
and boot Q6 firmware.

The first patch is to make the mdt_loader authenticate
the firmware only if required, so that the code can be reused for
self-authenticating firmware like the Q6v5 core in IPQ8074. The second
patch exports the elf header's get_boot_addr helper to reuse it.
The next couple of patches arranges the code in the original q6v5-mpss
rproc to add q6v5-wcss later. The last couple of patches add the relevant
bits for the q6v5-wcss core.

This is done on top of Avaneesh's msm8996 rproc support [1]

[1] https://lkml.org/lkml/2017/10/24/771

V4:
    Fixed Bjorn's comment in PATCH#1 and added his acked-by
    Rebased on top of Avinash's latest rproc for msm8996 q6 support.

V3:
    Rebased on top of latest remoteproc next

V2:
    Last time introduced this a new rproc driver, but there is lot
    of code that can be shared if it is added to the q6v5-mpss pil
    driver.

Sricharan R (6):
  remoteproc: qcom: mdt_loader: Make the firmware authentication
    optional
  remoteproc: Export rproc_elf_get_boot_addr
  remoteproc: qcom: Push reset ops, fw ops, rproc ops in to of_match
    data
  remoteproc: qcom: Split the head and tail of the q6v5-pil rproc start
    function
  remoteproc: qcom: Add support for q6v5-wcss pil
  remoteproc: qcom: Add q6v5-wcss rproc ops

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   7 +-
 drivers/remoteproc/Kconfig                         |   1 +
 drivers/remoteproc/qcom_q6v5_pil.c                 | 469 +++++++++++++++++----
 drivers/remoteproc/remoteproc_elf_loader.c         |   2 +-
 drivers/remoteproc/remoteproc_internal.h           |   3 +
 drivers/soc/qcom/mdt_loader.c                      |  82 +++-
 include/linux/soc/qcom/mdt_loader.h                |   3 +
 7 files changed, 453 insertions(+), 114 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
