From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v2 1/5] mtd: mtdpart: add debug prints to partition parser.
Date: 31 Jul 2015 11:19:24 -0000
Message-ID: <d787def4ffb9cf83923cdc817cb462500abd8640.1438340815.git.hramrach@gmail.com>
References: <cover.1438340815.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <cover.1438340815.git.hramrach@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Michal Suchanek <hramrach@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The probe of a mtd device can fail when a partition parser returns
error. The failure due to partition parsing can be quite mysterious when
multiple partitioning schemes are comiled in and any of them can fail
the probe.

Add debug prints which show what parsers were tried and what they
returned.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
v2:

 - reformat debug messages
---
 drivers/mtd/mtdpart.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index cafdb88..31888c2 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -759,12 +759,17 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		types = default_mtd_part_types;
 
 	for ( ; ret <= 0 && *types; types++) {
+		pr_debug("%s: parsing partitions %s\n", master->name, *types);
 		parser = get_partition_parser(*types);
 		if (!parser && !request_module("%s", *types))
 			parser = get_partition_parser(*types);
+		pr_debug("%s: got parser %s\n", master->name,
+			 parser ? parser->name : NULL);
 		if (!parser)
 			continue;
 		ret = (*parser->parse_fn)(master, pparts, data);
+		pr_debug("%s: parser %s: %i\n",
+			 master->name, parser->name, ret);
 		put_partition_parser(parser);
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
-- 
2.1.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
