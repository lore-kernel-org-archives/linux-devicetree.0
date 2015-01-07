From: Mayuresh Chitale <mchitale@apm.com>
Subject: [PATCH 0/4] APM X-Gene PCIe DMA driver
Date: Wed,  7 Jan 2015 10:58:53 +0530
Message-ID: <1420608537-12296-1-git-send-email-mchitale@apm.com>
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
To: dan.j.williams@intel.com, vinod.koul@intel.com, dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org, arnd@arndb.de, jcm@redhat.com, patches@apm.com, Mayuresh Chitale <mchitale@apm.com>, ddutile@redhat.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the APM X-Gene SOC PCIe DMA driver.
It can be used to transfer data between PCIe RC and PCIe 
endpoints. It supports only dma slave transfers.

Mayuresh Chitale (4):
  MAINTAINERS: Add entry for X-Gene PCIE DMA driver
  Documentation: dt-bindings: Add the binding info for APM X-Gene PCIe
    DMA driver
  arm64: dts: Add APM X-Gene PCIe DMA device tree nodes
  dma: X-Gene PCIE DMA Driver

 .../devicetree/bindings/dma/xgene-pciedma.txt      |  16 +
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |  40 ++
 drivers/dma/Kconfig                                |  11 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/xgene-pcie-dma.c                       | 709 +++++++++++++++++++++
 6 files changed, 785 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/xgene-pciedma.txt
 create mode 100644 drivers/dma/xgene-pcie-dma.c

-- 
2.2.1.212.gc5b9256
