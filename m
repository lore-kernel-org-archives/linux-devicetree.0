From: srinivas.kandagatla@linaro.org
Subject: [PATCH 0/4] dmaengine: qcom: bam_dma: fixes for remotely controlled bam
Date: Tue, 16 Jan 2018 19:02:32 +0000
Message-ID: <20180116190236.14558-1-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Andy Gross <andy.gross@linaro.org>, dmaengine@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi Andy,

I did hit few issues while trying out SLIMBus BAM on DB820c, this BAM instance
is remotely controlled and powered up after ADSP is booted using QMI commands.

Firstly some of the master registers are written even when the BAM is remotely
controlled, and secondly reading registers when bam is not ready yet.

These 4 patches address these issues, there are few more issues like doing PM
in simillar usecase, these will be addressed soon.

Thanks,
Srini

Srinivas Kandagatla (4):
  dmaengine: qcom: bam_dma: make bam clk optional
  dmaengine: qcom: bam_dma: add num-channels binding for remotely
    controlled
  dmaengine: qcom: bam_dma: do not write to global regs in remote mode
  dmaengine: qcom: bam_dma: Add num-ees dt binding for remotely
    controlled

 .../devicetree/bindings/dma/qcom_bam_dma.txt       |  4 ++
 drivers/dma/qcom/bam_dma.c                         | 56 +++++++++++++++-------
 2 files changed, 43 insertions(+), 17 deletions(-)

-- 
2.15.1
