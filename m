From: Srikanth Thokala <sthokal@xilinx.com>
Subject: [PATCH v3 0/3] Add Xilinx AXI Video DMA Engine driver
Date: Sat, 15 Feb 2014 17:30:16 +0530
Message-ID: <1392465619-27614-1-git-send-email-sthokal@xilinx.com>
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
To: dan.j.williams@intel.com, vinod.koul@intel.com, michal.simek@xilinx.com, grant.likely@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, levex@linux.com, lars@metafoo.de, linux-kernel@vger.kernel.org, Srikanth Thokala <sthokal@xilinx.com>, dmaengine@vger.kernel.org, andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

This is the driver for Xilinx AXI Video Direct Memory Access Engine.
It is a soft IP core, which provides high-bandwidth direct memory
access between memory and AXI4-Stream video type target peripherals
including peripherals which support AXI4-Stream Video Protocol. The
core provides efficient two dimensional DMA operations with independent
asynchronous read and write channel operation.

For more information on the IP, please refer to
http://www.xilinx.com/support/documentation/ip_documentation/axi_vdma/v6_1/pg020_axi_vdma.pdf

This patch also provides a test client, which assumes read and write channels
of the core are configured in a back-to-back connection.  It transfers
data on the write channel, read and verify the data on the read channel.

Use cases:
++++++++++
1. Xilinx Video Targeted Reference design
   http://www.wiki.xilinx.com/Zynq+Base+TRD+14.5
2. Common Display Framework
   http://events.linuxfoundation.org/sites/events/files/slides/20131024-elce.pdf

Regards,
Srikanth

Changes in v3:
- Created a separate patch for the DT binding documentation as suggested by
  Vinod, Thanks.
- Added support for interleaved frames with non-contiguous memory as suggested
  by Lars, Thanks.
- Rebased on v3.14.0-rc2 

Srikanth Thokala (3):
  dma: Support multiple interleaved frames with non-contiguous memory
  dma: Add Xilinx Video DMA DT Binding Documentation
  dma: Add Xilinx AXI Video Direct Memory Access Engine driver support

 .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt |   75 ++
 Documentation/dmaengine.txt                        |    2 +-
 drivers/dma/Kconfig                                |   14 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/imx-dma.c                              |    3 +-
 drivers/dma/sirf-dma.c                             |    3 +-
 drivers/dma/xilinx/Makefile                        |    1 +
 drivers/dma/xilinx/xilinx_vdma.c                   | 1388 ++++++++++++++++++++
 drivers/media/platform/m2m-deinterlace.c           |    2 +-
 include/linux/amba/xilinx_dma.h                    |   46 +
 include/linux/dmaengine.h                          |    6 +-
 11 files changed, 1534 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
 create mode 100644 drivers/dma/xilinx/Makefile
 create mode 100644 drivers/dma/xilinx/xilinx_vdma.c
 create mode 100644 include/linux/amba/xilinx_dma.h

-- 
1.7.9.5
