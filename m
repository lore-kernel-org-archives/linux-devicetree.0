From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: [Patch v3 0/6] soc: ti: Keystone Navigator drivers
Date: Fri, 8 Aug 2014 14:19:39 -0400
Message-ID: <1407521985-22574-1-git-send-email-santosh.shilimkar@ti.com>
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
To: linux-kernel@vger.kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, sandeep_n@ti.com, olof@lixom.net, Santosh Shilimkar <santosh.shilimkar@ti.com>, galak@codeaurora.org, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Here is an updated version3 of the Keystone Navigator drivers after
addressing Rob's device tree bindings comments from earlier version [1].
I couldn't get the series ready just in time for v3.17 merge window
but surely like to get it in v3.18 merge window. 

The QMSS found on Keystone SOCs is one of the main hardware sub
system which forms the backbone of the Keystone Multi-core Navigator.
QMSS consist of queue managers, packed-data structure processors(PDSP),
linking RAM, descriptor pools and infrastructure DMA.

After the discussion and alignment [2] on Navigator DMA, now we pair
this driver along with QMSS. Initially this driver was proposed as DMA
engine driver but since the hardware is not typical DMA engine and doesn't
comply with typical DMA engine driver needs, that approach was naked.

These two drivers works as infrastructure drivers for subsystems like
Ethernet subsystem, SRIO subsystem, Crypto Engines etc on Keystone
SOC families. Testing is done with NetCP(ethernet) subsystem drivers.

Sandeep Nair (3):
  firmware: add Keystone QMSS PDSP accumulator firmware blob
  Documentation: dt: soc: add Keystone Navigator QMSS bindings
  soc: ti: add Keystone Navigator QMSS driver

Santosh Shilimkar (3):
  Documentation: dt: soc: add Keystone Navigator DMA bindings
  soc: ti: add Keystone Navigator DMA support
  MAINTAINERS: Add Keystone Multicore Navigator drivers entry

 .../bindings/soc/ti/keystone-navigator-dma.txt     |  111 ++
 .../bindings/soc/ti/keystone-navigator-qmss.txt    |  232 +++
 MAINTAINERS                                        |    9 +
 drivers/Kconfig                                    |    2 +
 drivers/soc/Kconfig                                |    1 +
 drivers/soc/Makefile                               |    1 +
 drivers/soc/ti/Kconfig                             |   31 +
 drivers/soc/ti/Makefile                            |    5 +
 drivers/soc/ti/knav_dma.c                          |  813 +++++++++
 drivers/soc/ti/knav_qmss.h                         |  386 +++++
 drivers/soc/ti/knav_qmss_acc.c                     |  591 +++++++
 drivers/soc/ti/knav_qmss_queue.c                   | 1814 ++++++++++++++++++++
 firmware/Makefile                                  |    1 +
 .../keystone/qmss_pdsp_acc48_k2_le_1_0_0_8.fw.ihex |  110 ++
 include/linux/soc/ti/knav_dma.h                    |  175 ++
 include/linux/soc/ti/knav_qmss.h                   |   90 +
 16 files changed, 4372 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti/keystone-navigator-dma.txt
 create mode 100644 Documentation/devicetree/bindings/soc/ti/keystone-navigator-qmss.txt
 create mode 100644 drivers/soc/ti/Kconfig
 create mode 100644 drivers/soc/ti/Makefile
 create mode 100644 drivers/soc/ti/knav_dma.c
 create mode 100644 drivers/soc/ti/knav_qmss.h
 create mode 100644 drivers/soc/ti/knav_qmss_acc.c
 create mode 100644 drivers/soc/ti/knav_qmss_queue.c
 create mode 100644 firmware/keystone/qmss_pdsp_acc48_k2_le_1_0_0_8.fw.ihex
 create mode 100644 include/linux/soc/ti/knav_dma.h
 create mode 100644 include/linux/soc/ti/knav_qmss.h


regards,
Santosh
[1] https://lkml.org/lkml/2014/4/23/730
[2] https://lkml.org/lkml/2014/3/18/340
-- 
1.7.9.5
