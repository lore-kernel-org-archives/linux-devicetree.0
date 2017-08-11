From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 00/20] Add QCOM QPIC NAND support
Date: Fri, 11 Aug 2017 17:09:15 +0530
Message-ID: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* v4:

1. Added Acked-by from Rob for DT documentation patches
2. Removed ipq8074 compatible string from ipq4019 DT example.
2. Used the BIT macro for NAND_CMD_VLD bits and consistent names
   as suggested by Boris in v3.

* v3:

1. Removed the patches already applied to linux-next and
   rebased the remaining patches on [1]
2. Reordered the patches and put the BAM DMA changes [2]
   dependent patches and compatible string patches in last
3. Removed the register offsets array and used the dev_cmd offsets
4. Changed some macro names to small letters for better code readability
5. Changed the compatible string to SoC specific
6. Did minor code changes for adding comment, error handling, structure names
7. Combined raw write (patch#18) and passing flag parameter (patch#22) patch
   into one
8. Made separate patch for compatible string and NAND properties
9. Made separate patch for BAM command descriptor and data descriptors handling
10. Changed commit message for some of the patches
11. Addressed review comments given in v2
12. Added Reviewed-by of Archit for some of the patches from v2
13. All the MTD tests are working fine for IPQ8064 AP148, IPQ4019 DK04 and
    IPQ8074 HK01 boards for v3 patches

[1] http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/nand/next
[2] http://www.spinics.net/lists/dmaengine/msg13662.html

* v2:

1. Addressed the review comments given in v1
2. Removed the DMA coherent buffer for register read and used
   streaming DMA API’s
3. Reorganized the NAND read and write functions
4. Separated patch for driver and documentation changes
5. Changed the compatible string for EBI2

* v1:

http://www.spinics.net/lists/devicetree/msg183706.html

Abhishek Sahu (20):
  mtd: nand: qcom: fix read failure without complete bootchain
  mtd: nand: qcom: support for NAND controller properties
  mtd: nand: qcom: add bam property for QPIC NAND controller
  mtd: nand: qcom: add and initialize QPIC DMA resources
  mtd: nand: qcom: DMA mapping support for register read buffer
  mtd: nand: qcom: allocate BAM transaction
  mtd: nand: qcom: add BAM DMA descriptor handling
  mtd: nand: qcom: support for passing flags in transfer functions
  mtd: nand: qcom: support for read location registers
  mtd: nand: qcom: erased codeword detection configuration
  mtd: nand: qcom: enable BAM or ADM mode
  mtd: nand: qcom: QPIC data descriptors handling
  mtd: nand: qcom: support for different DEV_CMD register offsets
  mtd: nand: qcom: add command elements in BAM transaction
  mtd: nand: qcom: support for command descriptor formation
  dt-bindings: qcom_nandc: fix the ipq806x device tree example
  dt-bindings: qcom_nandc: IPQ4019 QPIC NAND documentation
  dt-bindings: qcom_nandc: IPQ8074 QPIC NAND documentation
  mtd: nand: qcom: support for IPQ4019 QPIC NAND controller
  mtd: nand: qcom: support for IPQ8074 QPIC NAND controller

 .../devicetree/bindings/mtd/qcom_nandc.txt         |  63 +-
 drivers/mtd/nand/qcom_nandc.c                      | 866 ++++++++++++++++++---
 2 files changed, 814 insertions(+), 115 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
