From: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Subject: [PATCH v2 0/5] dmaengine: qcom: bam_dma: fixes for remotely controlled bam
Date: Wed, 14 Feb 2018 14:44:54 +0000
Message-ID: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhe-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, ramkri-Rm6X0d1/PG5y9aJCnZT0Uw@public.gmane.org, sdharia-jfJNa2p1gH1BDgjK7y7TUQ@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hi Andy,

I did hit few issues while trying out SLIMBus BAM on DB820c, this BAM instance
is remotely controlled and powered up after ADSP is booted using QMI commands.

Firstly some of the master registers are written even when the BAM is remotely
controlled, and secondly reading registers when bam is not ready yet.

These 4 patches address these issues, there are few more issues like doing PM
in simillar usecase, these will be addressed soon.

Thanks,
Srini

Changes since v1:
	- Move dt bindings to separate patch
	- merge num-channels and num-ees driver changes
	- fixed few typos.
	- added runtime pm disable, as suggested by Sagar

Srinivas Kandagatla (5):
  dmaengine: qcom: bam_dma: make bam clk optional
  dt-bindings: dmaengine: bam_dma: add remote controlled bindings
  dmaengine: qcom: bam_dma: get num-channels and num-ees from dt
  dmaengine: qcom: bam_dma: do not write to global regs in remote mode
  dmaengine: qcom: bam_dma: disable runtime pm on remote controlled

 .../devicetree/bindings/dma/qcom_bam_dma.txt       |  4 ++
 drivers/dma/qcom/bam_dma.c                         | 66 +++++++++++++++-------
 2 files changed, 51 insertions(+), 19 deletions(-)

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
