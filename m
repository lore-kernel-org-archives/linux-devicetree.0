From: <yinbo.zhu@nxp.com>
Subject: [PATCH 1/2] mmc: sdhci-of-esdhc: Workaround for reducing the maximum
 speed on ls1021atwr
Date: Mon, 30 Oct 2017 15:42:19 +0800
Message-ID: <20171030074219.20214-1-yinbo.zhu@nxp.com>
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

In SDHC high speed AC timing, the tshivkh parameter
is defined as input setup times:SDHC_CMD, SDHC_DATx,
to SDHC_CLK. The value of the tshivkh should be 2.5 ns
considering the round trip delay, board/data skew.
However, because of this erratum, it needs
at least 4.1 ns.

eSDHC cannot run at the maximum clock speed for the
high speed mode, or there is a limit on the length
of the trace on the board for data, command, and
clock lines of the SDHC.

Signed-off-by: yinbo.zhu <yinbo.zhu@nxp.com>
---
 drivers/mmc/host/sdhci-of-esdhc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-of-esdhc.c
index d96a057a7db8..aa360ff1fc35 100644
--- a/drivers/mmc/host/sdhci-of-esdhc.c
+++ b/drivers/mmc/host/sdhci-of-esdhc.c
@@ -498,6 +498,12 @@ static void esdhc_of_set_clock(struct sdhci_host *host, unsigned int clock)
 			clock -= 5000000;
 	}
 
+	/* Workaround to reduce the clock frequency for ls1021a esdhc */
+	if (of_find_compatible_node(NULL, NULL, "fsl,ls1021a")) {
+		if (clock == 50000000)
+			clock = 46500000;
+	}
+
 	temp = sdhci_readl(host, ESDHC_SYSTEM_CONTROL);
 	temp &= ~(ESDHC_CLOCK_SDCLKEN | ESDHC_CLOCK_IPGEN | ESDHC_CLOCK_HCKEN |
 		  ESDHC_CLOCK_PEREN | ESDHC_CLOCK_MASK);
-- 
2.14.1
