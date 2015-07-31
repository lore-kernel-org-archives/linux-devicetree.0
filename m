From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v2 2/5] mtd: mtdpart: Do not fail mtd probe when parsing
 partitions fails.
Date: 31 Jul 2015 11:19:24 -0000
Message-ID: <5deae3946cc9422b451b95bc5886bcef30176c67.1438340815.git.hramrach@gmail.com>
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

Due to wrong assumption in ofpart ofpart fails on Exynos on SPI chips
with no partitions because the subnode containing controller data
confuses the ofpart parser.

Thus compiling in ofpart support automatically fails probing any SPI NOR
flash without partitions on Exynos.

Compiling in a partitioning scheme should not cause probe of otherwise
valid device to fail.

Remove that failure possibility when MTD_PARTITIONED_MASTER is set.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>

---
v2:

 - only allow partition parsing failure when MTD_PARTITIONED_MASTER is
   set
---
 drivers/mtd/mtdpart.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 31888c2..6eafbe9 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -774,10 +774,15 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		if (ret > 0) {
 			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
 			       ret, parser->name, master->name);
-			break;
+			return ret;
+		}
+		if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) && (ret < 0)) {
+			pr_err("Error parsing %s partitions on %s\n",
+			       parser->name, master->name);
+			return ret;
 		}
 	}
-	return ret;
+	return 0;
 }
 
 int mtd_is_partition(const struct mtd_info *mtd)
-- 
2.1.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
