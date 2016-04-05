From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/5] bam dma fixes and one dt extension
Date: Wed,  6 Apr 2016 01:56:17 +0300
Message-ID: <1459896982-30171-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vinod.koul@intel.com>, Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Sinan Kaya <okaya@codeaurora.org>, Pramod Gurav <gpramod@codeaurora.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: devicetree@vger.kernel.org

resend and bump to v2 with fowolling changes:
 - fixed spelling mistaikes in 3/5
 - created a one more patch which renames a define from
   BAM_MAX_DATA_SIZE to BAM_FIFO_SIZE

regards,
Stan

v1 can be found at:

https://lkml.org/lkml/2015/12/1/113 

Stanimir Varbanov (5):
  dmaengine: qcom: bam_dma: fix dma free memory on remove
  dmaengine: qcom: bam_dma: clear BAM interrupt only if it is rised
  dmaengine: qcom: bam_dma: add controlled remotely dt property
  dmaengine: qcom: bam_dma: use correct pipe FIFO size
  dmaengine: qcom: bam_dma: rename BAM_MAX_DATA_SIZE define

 .../devicetree/bindings/dma/qcom_bam_dma.txt       |  2 ++
 drivers/dma/qcom/bam_dma.c                         | 38 +++++++++++++++-------
 2 files changed, 28 insertions(+), 12 deletions(-)

-- 
1.9.1
