From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V7 5/6] mtd: partitions: add support for partition parsers
Date: Wed, 21 Jun 2017 08:26:46 +0200
Message-ID: <20170621062647.6072-6-zajec5@gmail.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170621062647.6072-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Some devices have partitions that are kind of containers with extra
subpartitions / volumes instead of e.g. a simple filesystem data. To
support such cases we need to first create normal flash device
partitions and then take care of these special ones.

It's very common case for home routers. Depending on the vendor there
are formats like TRX, Seama, TP-Link, WRGG & more. All of them are used
to embed few partitions into a single one / single firmware file.

Ideally all vendors would use some well documented / standardized format
like UBI (and some probably start doing so), but there are still
countless devices on the market using these poor vendor specific
formats.

This patch extends MTD subsystem by allowing to specify list of parsers
that should be tried for a given partition. Supporting such poor formats
is highly unlikely to be the top priority so these changes try to
minimize maintenance cost to the minimum. It reuses existing code for
these new parsers and just adds a one property and one new function.

This implementation requires setting partition parsers in a flash
parser. A proper change of bcm47xxpart will follow and in the future we
will hopefully also find a solution for doing it with ofpart
("fixed-partitions").

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V2: A totally rebased & refreshed version.
V3: Don't mention uImage in commit message, it was a mistake.
V4: Document mtd_parse_part parameters
V5: Make documentation more clear as pointed by Brian
    Let offset be handled in add_mtd_partitions / allocate_partition
    Switch "format" to "types"
---
 drivers/mtd/mtdpart.c          | 31 +++++++++++++++++++++++++++++++
 include/linux/mtd/partitions.h |  7 +++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c0d464d192ee..2ad9493703f9 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -369,6 +369,35 @@ static inline void free_partition(struct mtd_part *p)
 	kfree(p);
 }
 
+/**
+ * mtd_parse_part - parse MTD partition looking for subpartitions
+ *
+ * @slave: part that is supposed to be a container and should be parsed
+ * @types: NULL-terminated array with names of partition parsers to try
+ *
+ * Some partitions are kind of containers with extra subpartitions (volumes).
+ * There can be various formats of such containers. This function tries to use
+ * specified parsers to analyze given partition and registers found
+ * subpartitions on success.
+ */
+static int mtd_parse_part(struct mtd_part *slave, const char *const *types)
+{
+	struct mtd_partitions parsed;
+	int err;
+
+	err = parse_mtd_partitions(&slave->mtd, types, &parsed, NULL);
+	if (err)
+		return err;
+	else if (!parsed.nr_parts)
+		return -ENOENT;
+
+	err = add_mtd_partitions(&slave->mtd, parsed.parts, parsed.nr_parts);
+
+	mtd_part_parser_cleanup(&parsed);
+
+	return err;
+}
+
 static struct mtd_part *allocate_partition(struct mtd_info *parent,
 			const struct mtd_partition *part, int partno,
 			uint64_t cur_offset)
@@ -758,6 +787,8 @@ int add_mtd_partitions(struct mtd_info *master,
 
 		add_mtd_device(&slave->mtd);
 		mtd_add_partition_attrs(slave);
+		if (parts[i].types)
+			mtd_parse_part(slave, parts[i].types);
 
 		cur_offset = slave->offset + slave->mtd.size;
 	}
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 06df1e06b6e0..c4beb70dacbd 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -20,6 +20,12 @@
  *
  * For each partition, these fields are available:
  * name: string that will be used to label the partition's MTD device.
+ * types: some partitions can be containers using specific format to describe
+ *	embedded subpartitions / volumes. E.g. many home routers use "firmware"
+ *	partition that contains at least kernel and rootfs. In such case an
+ *	extra parser is needed that will detect these dynamic partitions and
+ *	report them to the MTD subsystem. If set this property stores an array
+ *	of parser names to use when looking for subpartitions.
  * size: the partition size; if defined as MTDPART_SIZ_FULL, the partition
  * 	will extend to the end of the master MTD device.
  * offset: absolute starting position within the master MTD device; if
@@ -38,6 +44,7 @@
 
 struct mtd_partition {
 	const char *name;		/* identifier string */
+	const char *const *types;	/* names of parsers to use if any */
 	uint64_t size;			/* partition size */
 	uint64_t offset;		/* offset within the master MTD space */
 	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
