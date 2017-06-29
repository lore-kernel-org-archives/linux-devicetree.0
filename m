From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 00/14] Add QCOM QPIC NAND support
Date: Thu, 29 Jun 2017 12:45:52 +0530
Message-ID: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current QCOM NAND driver only support EBI2 NAND which uses
ADM DMA. The latest QCOM controller supports QPIC NAND which uses
BAM DMA. NAND registers and programming sequence are same for EBI2
and QPIC NAND so the same driver can support QPIC NAND also by
adding the BAM DMA support. This patch series adds the support for
QPIC NAND controller version 1.4.0 available in IPQ4019 and QPIC
NAND controller version 1.5.0 available in IPQ8074.

The kernel MTD tests have been run to validate all these patches
in IPQ8064 AP148, IPQ4019 DK04 and IPQ8074 HK01 boards and all
the MTD tests are passing on these boards.

The QPIC NAND requires the command channel support for BAM DMA
engine and currently BAM engine does not support the command
descriptors so the following patches have been posted for the
same in dmaengine mailing list. The above patches are dependent
upon these BAM DMA patches.

https://www.spinics.net/lists/kernel/msg2542483.html

Abhishek Sahu (14):
  qcom: mtd: nand: Add driver data for QPIC DMA
  qcom: mtd: nand: add and initialize QPIC DMA resources
  qcom: mtd: nand: Fixed config error for BCH
  qcom: mtd: nand: reorganize nand devices probing
  qcom: mtd: nand: allocate bam transaction
  qcom: mtd: nand: add bam dma descriptor handling
  qcom: mtd: nand: support for passing flags in transfer functions
  qcom: mtd: nand: Add support for additional CSRs
  qcom: mtd: nand: BAM support for read page
  qcom: mtd: nand: support for QPIC Page read/write
  qcom: mtd: nand: BAM raw read and write support
  qcom: mtd: nand: change register offset defines with enums
  qcom: mtd: nand: support for QPIC version 1.5.0
  qcom: mtd: nand: programmed NAND_DEV_CMD_VLD register

 .../devicetree/bindings/mtd/qcom_nandc.txt         |  110 +-
 drivers/mtd/nand/qcom_nandc.c                      | 1114 +++++++++++++++++---
 2 files changed, 1050 insertions(+), 174 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
