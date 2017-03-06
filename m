From: Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>
Subject: [PATCH] dma: xilinx: Make Xilinx VDMA support ARC
Date: Mon,  6 Mar 2017 12:27:33 +0000
Message-ID: <ec057c7b16c414a1cf9a9eba87c33f8bcf9f01f9.1488803103.git.roliveir@synopsys.com>
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
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Vinod Koul <vinod.koul@intel.com>, Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>, Dan Williams <dan.j.williams@intel.com>, CARLOS.PALMINHA@synopsys.com
List-Id: devicetree@vger.kernel.org

Add option in Kconfig to use Xilinx VDMA in ARC processors.

Signed-off-by: Ramiro Oliveira <roliveir@synopsys.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 263495d0adbd..b6b6c0581ad7 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -546,7 +546,7 @@ config XGENE_DMA
 
 config XILINX_DMA
 	tristate "Xilinx AXI DMAS Engine"
-	depends on (ARCH_ZYNQ || MICROBLAZE || ARM64)
+	depends on (ARCH_ZYNQ || MICROBLAZE || ARM64|| ARC)
 	select DMA_ENGINE
 	help
 	  Enable support for Xilinx AXI VDMA Soft IP.
-- 
2.11.0
