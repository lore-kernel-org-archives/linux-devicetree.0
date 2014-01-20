From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v7 3/7] misc: sram: implement mmio-sram-reserved option
Date: Mon, 20 Jan 2014 16:43:44 +0100
Message-ID: <2232854.mna0r8nSuv@phil>
References: <4970034.fqvMoHdOyd@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4970034.fqvMoHdOyd@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This implements support for the mmio-sram-reserved option to keep the
genpool from using these areas.

Suggested-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Tested-by: Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 drivers/misc/sram.c |  121 +++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 113 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index afe66571..8681961 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -36,13 +36,23 @@ struct sram_dev {
 	struct clk *clk;
 };
 
+struct sram_reserve {
+	u32 start;
+	u32 size;
+};
+
 static int sram_probe(struct platform_device *pdev)
 {
 	void __iomem *virt_base;
 	struct sram_dev *sram;
 	struct resource *res;
-	unsigned long size;
-	int ret;
+	struct device_node *np = pdev->dev.of_node;
+	unsigned long size, cur_start, cur_size;
+	int reserved_size = 0;
+	struct sram_reserve *rblocks;
+	unsigned int nblocks;
+	int ret = 0;
+	int i;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	virt_base = devm_ioremap_resource(&pdev->dev, res);
@@ -65,19 +75,114 @@ static int sram_probe(struct platform_device *pdev)
 	if (!sram->pool)
 		return -ENOMEM;
 
-	ret = gen_pool_add_virt(sram->pool, (unsigned long)virt_base,
-				res->start, size, -1);
-	if (ret < 0) {
-		if (sram->clk)
-			clk_disable_unprepare(sram->clk);
-		return ret;
+	if (np) {
+		reserved_size = of_property_count_u32_elems(np,
+							"mmio-sram-reserved");
+
+		/* mmio-sram-reserved is optional, so its absence is no error */
+		if (reserved_size < 0)
+			reserved_size = 0;
+
+		if (reserved_size % 2) {
+			dev_warn(&pdev->dev, "wrong number of arguments in mmio-sram-reserved\n");
+			reserved_size = 0;
+		}
+	}
+
+	/*
+	 * We need an additional block to mark the end of the memory region
+	 * after the reserved blocks from the dt are processed.
+	 */
+	nblocks = reserved_size / 2 + 1;
+	rblocks = kmalloc((nblocks) * sizeof(*rblocks), GFP_KERNEL);
+	if (!rblocks) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
+
+	cur_start = 0;
+	for (i = 0; i < nblocks - 1; i++) {
+		/* checked the property exists above so can skip return vals */
+		of_property_read_u32_index(np, "mmio-sram-reserved",
+					   2 * i, &rblocks[i].start);
+		of_property_read_u32_index(np, "mmio-sram-reserved",
+					   2 * i + 1, &rblocks[i].size);
+
+		if (rblocks[i].start < cur_start) {
+			dev_err(&pdev->dev,
+				"unsorted reserved list (0x%x before current 0x%lx)\n",
+				rblocks[i].start, cur_start);
+			ret = -EINVAL;
+			goto err_chunks;
+		}
+
+		if (rblocks[i].start >= size) {
+			dev_err(&pdev->dev,
+				"reserved block at 0x%x outside the sram size 0x%lx\n",
+				rblocks[i].start, size);
+			ret = -EINVAL;
+			goto err_chunks;
+		}
+
+		if (rblocks[i].start + rblocks[i].size > size) {
+			dev_warn(&pdev->dev,
+				 "reserved block at 0x%x to large, trimming\n",
+				 rblocks[i].start);
+			rblocks[i].size = size - rblocks[i].start;
+		}
+
+		cur_start = rblocks[i].start + rblocks[i].size;
+
+		dev_dbg(&pdev->dev, "found reserved block 0x%x-0x%x\n",
+			rblocks[i].start,
+			rblocks[i].start + rblocks[i].size);
+	}
+
+	/* the last chunk marks the end of the region */
+	rblocks[nblocks - 1].start = size;
+	rblocks[nblocks - 1].size = 0;
+
+	cur_start = 0;
+	for (i = 0; i < nblocks; i++) {
+		/* current start is in a reserved block, so continue after it */
+		if (rblocks[i].start == cur_start) {
+			cur_start = rblocks[i].start + rblocks[i].size;
+			continue;
+		}
+
+		/*
+		 * allocate the space between the current starting
+		 * address and the following reserved block, or the
+		 * end of the region.
+		 */
+		cur_size = rblocks[i].start - cur_start;
+
+		dev_dbg(&pdev->dev, "adding chunk 0x%lx-0x%lx\n",
+			cur_start, cur_start + cur_size);
+		ret = gen_pool_add_virt(sram->pool,
+				(unsigned long)virt_base + cur_start,
+				res->start + cur_start, cur_size, -1);
+		if (ret < 0)
+			goto err_chunks;
+
+		/* next allocation after this reserved block */
+		cur_start = rblocks[i].start + rblocks[i].size;
 	}
 
+	kfree(rblocks);
+
 	platform_set_drvdata(pdev, sram);
 
 	dev_dbg(&pdev->dev, "SRAM pool: %ld KiB @ 0x%p\n", size / 1024, virt_base);
 
 	return 0;
+
+err_chunks:
+	kfree(rblocks);
+err_alloc:
+	if (sram->clk)
+		clk_disable_unprepare(sram->clk);
+	return ret;
 }
 
 static int sram_remove(struct platform_device *pdev)
-- 
1.7.10.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
