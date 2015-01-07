From: Mayuresh Chitale <mchitale@apm.com>
Subject: [PATCH 1/4] MAINTAINERS: Add entry for X-Gene PCIE DMA driver
Date: Wed,  7 Jan 2015 10:58:54 +0530
Message-ID: <1420608537-12296-2-git-send-email-mchitale@apm.com>
References: <1420608537-12296-1-git-send-email-mchitale@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420608537-12296-1-git-send-email-mchitale@apm.com>
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

Signed-off-by: Mayuresh Chitale <mchitale@apm.com>
Signed-off-by: Tanmay Inamdar <tinamdar@apm.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ddb9ac8..9d24a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7228,6 +7228,14 @@ L:	linux-arm-kernel@lists.infradead.org
 S:	Maintained
 F:	drivers/pci/host/*layerscape*
 
+PCI DMA DRIVER FOR APPLIEDMICRO XGENE
+M:	Mayuresh Chitale <mchitale@apm.com>
+L:	dmaengine@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/xgene-pcie-dma.txt
+F:	drivers/dma/xgene-pcie-dma.c
+
+
 PCI DRIVER FOR IMX6
 M:	Richard Zhu <r65037@freescale.com>
 M:	Lucas Stach <l.stach@pengutronix.de>
-- 
2.2.1.212.gc5b9256
