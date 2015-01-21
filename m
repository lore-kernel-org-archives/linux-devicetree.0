From: Rameshwar Prasad Sahu <rsahu@apm.com>
Subject: [PATCH v4 0/3] dmaengine: APM X-Gene SoC DMA engine driver support
Date: Wed, 21 Jan 2015 16:31:08 +0530
Message-ID: <1421838071-7347-1-git-send-email-rsahu@apm.com>
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
To: vinod.koul@intel.com, dan.j.williams@intel.com
Cc: devicetree@vger.kernel.org, arnd@arndb.de, jcm@redhat.com, Rameshwar Prasad Sahu <rsahu@apm.com>, patches@apm.com, linux-kernel@vger.kernel.org, ddutile@redhat.com, Loc Ho <lho@apm.com>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch set implements the APM X-Gene SoC DMA driver
support to offload the DMA operations such as memory copy(memcpy),
scatter gathering.

v4 changes:
	1. Fixed dma-ranges property on DTS.

Signed-off-by: Rameshwar Prasad Sahu <rsahu@apm.com>
Signed-off-by: Loc Ho <lho@apm.com>
---

Rameshwar Prasad Sahu (3):
  dmaengine: Add support for APM X-Gene SoC DMA engine driver
  arm64: dts: Add APM X-Gene DMA device and DMA clock DTS nodes
  Documentation: dma: Add APM X-Gene SoC DMA engine driver documentation

 .../devicetree/bindings/dma/apm-xgene-dma.txt      |   49 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   26 +
 drivers/dma/Kconfig                                |    8 +
 drivers/dma/Makefile                               |    1 +
 drivers/dma/xgene-dma.c                            | 1566 ++++++++++++++++++++
 5 files changed, 1650 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/apm-xgene-dma.txt
 create mode 100644 drivers/dma/xgene-dma.c

--
1.8.2.1
