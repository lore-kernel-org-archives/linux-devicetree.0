From: Pramod Gurav <gpramod-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/2] Bypass BAM init if Remotely controlled
Date: Tue, 22 Mar 2016 15:19:09 +0530
Message-ID: <1458640151-15150-1-git-send-email-gpramod@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Pramod Gurav <gpramod-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On some QOCM platforms(eg 8996) BAM control registers are managed remotely
hence can not be accessed by application processor for writes. So skip the bam_init
for any such platform if DT property is set.

Tested on 8996 (BAM Global control is through remote) and DB410C boards.
Tested with i2c DMA on these targets which uses BAM as DMA controller.

Pramod Gurav (2):
  dmaengine: qcom_bam_dma: Clear IRQ only if its set
  dmaengine: qcom_bam_dma: Bypass BAM init if not managed locally

 .../devicetree/bindings/dma/qcom_bam_dma.txt        |  3 +++
 drivers/dma/qcom/bam_dma.c                          | 21 +++++++++++++--------
 2 files changed, 16 insertions(+), 8 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
