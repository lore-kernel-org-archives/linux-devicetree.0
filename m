From: <honghui.zhang@mediatek.com>
Subject: [PATCH v5 6/9] PCI: mediatek: Enable msi after clock enabled
Date: Fri, 28 Sep 2018 18:04:37 +0800
Message-ID: <1538129080-8206-7-git-send-email-honghui.zhang@mediatek.com>
References: <1538129080-8206-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538129080-8206-1-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, ryder.lee@mediatek.com
Cc: ulf.hansson@linaro.org, marc.zyngier@arm.com, matthias.bgg@gmail.com, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, honghui.zhang@mediatek.com, youlin.pei@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com
List-Id: devicetree@vger.kernel.org

From: Honghui Zhang <honghui.zhang@mediatek.com>

The clocks was not enabled when enable MSI. This patch fix this
issue by calling mtk_pcie_enable_msi in mtk_pcie_startup_port_v2
since the clock was all enabled at that time.

Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index d150be1..be38b38 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -572,8 +572,6 @@ static int mtk_pcie_init_irq_domain(struct mtk_pcie_port *port,
 		ret = mtk_pcie_allocate_msi_domains(port);
 		if (ret)
 			return ret;
-
-		mtk_pcie_enable_msi(port);
 	}
 
 	return 0;
@@ -694,6 +692,9 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	val &= ~INTX_MASK;
 	writel(val, port->base + PCIE_INT_MASK);
 
+	if (IS_ENABLED(CONFIG_PCI_MSI))
+		mtk_pcie_enable_msi(port);
+
 	/* Set AHB to PCIe translation windows */
 	size = mem->end - mem->start;
 	val = lower_32_bits(mem->start) | AHB2PCIE_SIZE(fls(size));
-- 
2.6.4
