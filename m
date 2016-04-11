From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/6] bam dma fixes and one dt extension
Date: Mon, 11 Apr 2016 11:38:37 +0300
Message-ID: <1460363923-16296-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vinod Koul <vinod.koul@intel.com>, Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Sinan Kaya <okaya@codeaurora.org>, Pramod Gurav <gpramod@codeaurora.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

Here is version 3 with following changes:
 - fixed a typo in 2/6.
 - the patch which adds dt property is seperated in two, one
   which adding binding document and another one which modifing
   the driver - requested by Vinod.
 - fixed a typo in 5/6.
 - added collected Acked,Tested-by tags.

The v2 can be found at:
https://lkml.org/lkml/2016/4/5/922

regards,
Stan

Stanimir Varbanov (6):
  dmaengine: qcom: bam_dma: fix dma free memory on remove
  dmaengine: qcom: bam_dma: clear BAM interrupt only if it is raised
  dmaengine: qcom: bam_dma: document controlled-remotely dt property
  dmaengine: qcom: bam_dma: add controlled-remotely dt property
  dmaengine: qcom: bam_dma: use correct pipe FIFO size
  dmaengine: qcom: bam_dma: rename BAM_MAX_DATA_SIZE define

 .../devicetree/bindings/dma/qcom_bam_dma.txt       |    2 ++
 drivers/dma/qcom/bam_dma.c                         |   38 +++++++++++++-------
 2 files changed, 28 insertions(+), 12 deletions(-)

-- 
1.7.9.5
