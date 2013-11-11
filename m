From: "Khoronzhuk, Ivan" <ivan.khoronzhuk@ti.com>
Subject: [PATCH 11/12] mtd: nand: davinci: don't request AEMIF address range
Date: Mon, 11 Nov 2013 17:12:24 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D64@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,
 <1384187188-5776-12-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1384187188-5776-12-git-send-email-ivan.khoronzhuk@ti.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Strashko,
 Grygorii" <grygorii.strashko@ti.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

The AEMIF driver registers are used to setup timings for each chip
select. The same registers range is used to setup NAND settings.
The AEMIF and NAND drivers not use the same registers in this range.

In case with AEMIF driver, the memory address range is requested
already by AEMIF, so we cannot request it twice, just ioremap.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 879e915..bb6b7e5 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -639,9 +639,11 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
        if (IS_ERR(vaddr))
                return PTR_ERR(vaddr);

-       base = devm_ioremap_resource(&pdev->dev, res2);
-       if (IS_ERR(base))
-               return PTR_ERR(base);
+       base = devm_ioremap(&pdev->dev, res2->start, resource_size(res2));
+       if (!base) {
+               dev_err(&pdev->dev, "ioremap failed for resource %pR\n", res2);
+               return -EADDRNOTAVAIL;
+       }

        info->dev               = &pdev->dev;
        info->base              = base;
--
1.7.9.5
