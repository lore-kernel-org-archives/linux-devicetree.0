From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 03/11] mtd: add debug prints to mtdpart partition parser.
Date: 3 Jun 2015 21:26:40 -0000
Message-ID: <81397d21d4919bed3593938ad3864d8023aff982.1433364398.git.hramrach@gmail.com>
References: <cover.1433364398.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1433364398.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>, Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>, Alison Chaiken <alison_chaiken@mentor.com>, Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>, Knut Wohlrab <knut.wohlrab@de.bosch.com>
List-Id: devicetree@vger.kernel.org

The probe of a mtd device can fail when a partition parser returns
error. The failure due to partition parsing can be quite mysterious when
multiple partitioning schemes are comiled in and any of them can fail
the probe.

Add debug prints which show what parsers were tried and what they
returned.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/mtdpart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index cafdb88..a79c4f7 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -759,12 +759,16 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		types = default_mtd_part_types;
 
 	for ( ; ret <= 0 && *types; types++) {
+		pr_debug("Parsing partitions %s on %s", *types, master->name);
 		parser = get_partition_parser(*types);
 		if (!parser && !request_module("%s", *types))
 			parser = get_partition_parser(*types);
+		pr_debug("%s got parser %s", master->name,
+			 parser ? parser->name : NULL);
 		if (!parser)
 			continue;
 		ret = (*parser->parse_fn)(master, pparts, data);
+		pr_debug("%s parser %s: %i", master->name, parser->name, ret);
 		put_partition_parser(parser);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
-- 
2.1.4
