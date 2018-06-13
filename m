From: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [PATCH 0/2] Enable VDMA S2MM vertical flip support
Date: Wed, 13 Jun 2018 13:04:46 +0530
Message-ID: <1528875288-9140-1-git-send-email-radhey.shyam.pandey@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, dan.j.williams@intel.com, appana.durga.rao@xilinx.com, lars@metafoo.de
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
List-Id: devicetree@vger.kernel.org

The AXI VDMA core supports Vertical Flip with S2MM as the path when
Enable Vertical Flip (Advanced tab) is selected. This patch series add
DT property for vertical flip and program its state in VDMA start_transfer.

Radhey Shyam Pandey (2):
  dt-bindings: dmaengine: xilinx_dma: Add VDMA vertical flip property
  dmaengine: xilinx_dma: Enable VDMA S2MM vertical flip support

 .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |    2 +
 drivers/dma/xilinx/xilinx_dma.c                    |   22 ++++++++++++++++++++
 include/linux/dma/xilinx_dma.h                     |    2 +
 3 files changed, 26 insertions(+), 0 deletions(-)
