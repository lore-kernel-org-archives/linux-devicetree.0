From: <yinbo.zhu@nxp.com>
Subject: [PATCH] mmc: sdhci-of-esdhc: fix eMMC couldn't work after kexec
Date: Mon, 30 Oct 2017 15:58:52 +0800
Message-ID: <20171030075852.7695-1-yinbo.zhu@nxp.com>
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
To: linux-devel@gforge.freescale.net
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "yinbo.zhu" <yinbo.zhu@nxp.com>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

From: "yinbo.zhu" <yinbo.zhu@nxp.com>

The bit TB_EN in tuning block control register
(TBCTL) is not reset by software reset for all.
So must clear it before initialize eSDHC again.

Signed-off-by: yinbo.zhu <yinbo.zhu@nxp.com>
---
 drivers/mmc/host/sdhci-esdhc.h    | 1 +
 drivers/mmc/host/sdhci-of-esdhc.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc.h b/drivers/mmc/host/sdhci-esdhc.h
index 98898a309a36..800ffb3794ef 100644
--- a/drivers/mmc/host/sdhci-esdhc.h
+++ b/drivers/mmc/host/sdhci-esdhc.h
@@ -59,6 +59,7 @@
 /* Tuning Block Control Register */
 #define ESDHC_TBCTL			0x120
 #define ESDHC_TB_EN			0x00000004
+#define ESDHC_TB_DIS			(0x1 << 2)
 
 /* Control Register for DMA transfer */
 #define ESDHC_DMA_SYSCTL		0x40c
diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-of-esdhc.c
index 4b0f375bdfd8..77ac9dee32a2 100644
--- a/drivers/mmc/host/sdhci-of-esdhc.c
+++ b/drivers/mmc/host/sdhci-of-esdhc.c
@@ -784,6 +784,9 @@ static void esdhc_init(struct platform_device *pdev, struct sdhci_host *host)
 	pltfm_host = sdhci_priv(host);
 	esdhc = sdhci_pltfm_priv(pltfm_host);
 
+	val = sdhci_readl(host, ESDHC_TBCTL);
+	val &= ~ESDHC_TB_DIS;
+	sdhci_writel(host, val, ESDHC_TBCTL);
 	host_ver = sdhci_readw(host, SDHCI_HOST_VERSION);
 	esdhc->vendor_ver = (host_ver & SDHCI_VENDOR_VER_MASK) >>
 			     SDHCI_VENDOR_VER_SHIFT;
-- 
2.14.1
