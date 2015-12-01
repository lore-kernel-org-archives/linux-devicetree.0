From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/4] bam dma fixes and one dt extension
Date: Tue,  1 Dec 2015 11:14:55 +0200
Message-ID: <1448961299-15161-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andy Gross <agross@codeaurora.org>, Archit Taneja <architt@codeaurora.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: devicetree@vger.kernel.org

Here are three bam dma fixes, which I made during testing qcrypto
driver. The first one is a real fix, the second one is related to
peripherals on which the BAM IP is initialized by remote execution
environment, and the third one is a sleeping bug IMO.

The last patch is a extension again for peripherals which BAM is
remotely controlled by other execution environment.

All patches has been tested on db410c board with apq8016.

Comments are welcome!

regards,
Stan

Stanimir Varbanov (4):
  dmaengine: qcom_bam_dma: fix dma free memory on remove
  dmaengine: qcom_bam_dma: clear BAM interrupt only if it is rised
  dmaengine: qcom_bam_dma: use correct pipe FIFO size
  dmaengine: qcom_bam_dma: add controlled remotely dt property

 .../devicetree/bindings/dma/qcom_bam_dma.txt       |    2 ++
 drivers/dma/qcom_bam_dma.c                         |   24 ++++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

-- 
1.7.9.5
