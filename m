From: Andy Gross <agross@codeaurora.org>
Subject: [PATCH 0/2] add MSM BAM dmaengine driver
Date: Fri, 25 Oct 2013 15:24:01 -0500
Message-ID: <1382732643-8184-1-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Huntsman <bryanh@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>, David Brown <davidb@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch set introduces the dmaengine driver for the MSM 8x74 Bus Access
Manager (BAM) DMA controller.  A number of the on-chip devices have their own
BAM DMA controller and use it to move data between system memory and peripherals
or between two peripherals.

The initial version of this driver will only support slave DMA operations
between system memory and peripherals.


Andy Gross (2):
  dmaengine: add msm bam dma driver
  dmaengine: msm_bam_dma: Add device tree binding

 .../devicetree/bindings/dma/msm_bam_dma.txt        |   49 ++
 drivers/dma/Kconfig                                |    9 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/msm_bam_dma.c                          |  840 ++++++++++++++++++++
 drivers/dma/msm_bam_dma_priv.h                     |  286 +++++++
 include/linux/msm_bam_dma.h                        |   27 +
 6 files changed, 1212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/msm_bam_dma.txt
 create mode 100644 drivers/dma/msm_bam_dma.c
 create mode 100644 drivers/dma/msm_bam_dma_priv.h
 create mode 100644 include/linux/msm_bam_dma.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
