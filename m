From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v6 1/2] DW DMAC: enable memory-to-memory transfers support
Date: Fri, 25 Nov 2016 17:59:06 +0300
Message-ID: <1480085947-31273-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1480085947-31273-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1480085947-31273-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, linux-snps-arc@lists.infradead.org, christian.ruppert@alitech.com, arnd@arndb.de, vinod.koul@intel.com, vireshk@kernel.org, linux-kernel@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, robh+dt@kernel.org, dmaengine@vger.kernel.org, andriy.shevchenko@linux.intel.com, shiraz.linux.kernel@gmail.com
List-Id: devicetree@vger.kernel.org

All known devices, which use DT for configuration, support
memory-to-memory transfers. So enable it by default, if we read
configuration from DT.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/dma/dw/platform.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 5bda0eb..aa7a5c1 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -129,6 +129,12 @@ dw_dma_parse_dt(struct platform_device *pdev)
 	if (of_property_read_bool(np, "is_private"))
 		pdata->is_private = true;
 
+	/*
+	 * All known devices, which use DT for configuration, support
+	 * memory-to-memory transfers. So enable it by default.
+	 */
+	pdata->is_memcpy = true;
+
 	if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
 		pdata->chan_allocation_order = (unsigned char)tmp;
 
-- 
2.5.5
