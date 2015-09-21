From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [PATCH v2] misc: sram: extend usage of reserved partitions
Date: Mon, 21 Sep 2015 23:52:46 +0300
Message-ID: <1442868766-3612-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This change adds functionality to operate on reserved SRAM partitions
described in device tree file. Two partition properties are added,
"pool" and "export", the first one allows to share a specific partition
for usage by a kernel consumer in the same manner as it is done for
the whole SRAM device, and "export" property provides access to some
SRAM area from userspace over sysfs interface. Practically it is
possible to specify both properties for an SRAM partition, however
simultaneous access from a kernel consumer and from userspace is not
serialized, but still the combination may be useful for debugging
purpose.

The change opens the following scenarios of SRAM usage:
* updates in a particular SRAM area specified by offset and size are
  done by bootloader, then this information is utilized by the kernel,
* a particular SRAM area is rw accessed from userspace, the stored
  data is persistent on soft reboots,
* a device driver secures SRAM area for its purposes,
* etc.

Note, strictly speaking the added optional properties describe policy
of SRAM usage, rather than hardware, but here the policy mostly
resembles flash partitions in devicetree, which is undoubtedly
a very popular option but it does not describe hardware.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
Changes from v1 to v2:
- added a short description of functional change to SRAM device tree
  bindings documentation,
- sending a copy to dt mailing list for review

 Documentation/devicetree/bindings/misc/sram.txt |  16 ++
 drivers/misc/sram.c                             | 196 +++++++++++++++++++++++-
 2 files changed, 204 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/sram.txt b/Documentation/devicetree/bindings/misc/sram.txt
index 36cbe5a..42ee943 100644
--- a/Documentation/devicetree/bindings/misc/sram.txt
+++ b/Documentation/devicetree/bindings/misc/sram.txt
@@ -33,6 +33,12 @@ Optional properties in the area nodes:
 
 - compatible : standard definition, should contain a vendor specific string
                in the form <vendor>,[<device>-]<usage>
+- pool : indicates that the particular reserved SRAM area is addressable
+         and in use by another device or devices
+- export : indicates that the reserved SRAM area may be accessed outside
+           of the kernel, e.g. by bootloader or userspace
+- label : the name for the reserved partition, if omitted, the label
+          is taken from the node name excluding the unit address.
 
 Example:
 
@@ -48,4 +54,14 @@ sram: sram@5c000000 {
 		compatible = "socvendor,smp-sram";
 		reg = <0x100 0x50>;
 	};
+
+	device-sram@1000 {
+		reg = <0x1000 0x1000>;
+		pool;
+	};
+
+	exported@20000 {
+		reg = <0x20000 0x20000>;
+		export;
+	};
 };
diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index 431e1dd..b0b5e94 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -28,20 +28,144 @@
 
 #define SRAM_GRANULARITY	32
 
+struct sram_partition {
+	void *base;
+
+	struct gen_pool *pool;
+	struct bin_attribute battr;
+	struct mutex lock;
+};
+
 struct sram_dev {
 	struct device *dev;
 	void __iomem *virt_base;
 
 	struct gen_pool *pool;
 	struct clk *clk;
+
+	struct sram_partition *partition;
+	u32 partitions;
 };
 
 struct sram_reserve {
 	struct list_head list;
 	u32 start;
 	u32 size;
+	bool export;
+	bool pool;
+	const char *label;
 };
 
+static ssize_t sram_read(struct file *filp, struct kobject *kobj,
+			 struct bin_attribute *attr,
+			 char *buf, loff_t pos, size_t count)
+{
+	struct sram_partition *part;
+
+	part = container_of(attr, struct sram_partition, battr);
+
+	mutex_lock(&part->lock);
+	memcpy(buf, part->base + pos, count);
+	mutex_unlock(&part->lock);
+
+	return count;
+}
+
+static ssize_t sram_write(struct file *filp, struct kobject *kobj,
+			  struct bin_attribute *attr,
+			  char *buf, loff_t pos, size_t count)
+{
+	struct sram_partition *part;
+
+	part = container_of(attr, struct sram_partition, battr);
+
+	mutex_lock(&part->lock);
+	memcpy(part->base + pos, buf, count);
+	mutex_unlock(&part->lock);
+
+	return count;
+}
+
+static int sram_add_pool(struct sram_dev *sram, struct sram_reserve *block,
+			 phys_addr_t start, struct sram_partition *part)
+{
+	int ret;
+
+	part->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
+					  NUMA_NO_NODE, block->label);
+	if (IS_ERR(part->pool))
+		return PTR_ERR(part->pool);
+
+	ret = gen_pool_add_virt(part->pool, (unsigned long)part->base, start,
+				block->size, NUMA_NO_NODE);
+	if (ret < 0) {
+		dev_err(sram->dev, "failed to register subpool: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sram_add_export(struct sram_dev *sram, struct sram_reserve *block,
+			   phys_addr_t start, struct sram_partition *part)
+{
+	sysfs_bin_attr_init(&part->battr);
+	part->battr.attr.name = devm_kasprintf(sram->dev, GFP_KERNEL,
+					       "%llx.sram",
+					       (unsigned long long)start);
+	if (!part->battr.attr.name)
+		return -ENOMEM;
+
+	part->battr.attr.mode = S_IRUSR | S_IWUSR;
+	part->battr.read = sram_read;
+	part->battr.write = sram_write;
+	part->battr.size = block->size;
+
+	return device_create_bin_file(sram->dev, &part->battr);
+}
+
+static int sram_add_partition(struct sram_dev *sram, struct sram_reserve *block,
+			      phys_addr_t start)
+{
+	int ret;
+	struct sram_partition *part = &sram->partition[sram->partitions];
+
+	mutex_init(&part->lock);
+	part->base = sram->virt_base + block->start;
+
+	if (block->pool) {
+		ret = sram_add_pool(sram, block, start, part);
+		if (ret)
+			return ret;
+	}
+	if (block->export) {
+		ret = sram_add_export(sram, block, start, part);
+		if (ret)
+			return ret;
+	}
+	sram->partitions++;
+
+	return 0;
+}
+
+static void sram_free_partitions(struct sram_dev *sram)
+{
+	struct sram_partition *part;
+
+	if (!sram->partitions)
+		return;
+
+	part = &sram->partition[sram->partitions - 1];
+	for (; sram->partitions; sram->partitions--, part--) {
+		if (part->battr.size)
+			device_remove_bin_file(sram->dev, &part->battr);
+
+		if (part->pool &&
+		    gen_pool_avail(part->pool) < gen_pool_size(part->pool))
+			dev_err(sram->dev, "removed pool while SRAM allocated\n");
+	}
+}
+
 static int sram_reserve_cmp(void *priv, struct list_head *a,
 					struct list_head *b)
 {
@@ -57,7 +181,8 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 	unsigned long size, cur_start, cur_size;
 	struct sram_reserve *rblocks, *block;
 	struct list_head reserve_list;
-	unsigned int nblocks;
+	unsigned int nblocks, exports = 0;
+	const char *label;
 	int ret = 0;
 
 	INIT_LIST_HEAD(&reserve_list);
@@ -69,7 +194,7 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 	 * after the reserved blocks from the dt are processed.
 	 */
 	nblocks = (np) ? of_get_available_child_count(np) + 1 : 1;
-	rblocks = kmalloc((nblocks) * sizeof(*rblocks), GFP_KERNEL);
+	rblocks = kzalloc((nblocks) * sizeof(*rblocks), GFP_KERNEL);
 	if (!rblocks)
 		return -ENOMEM;
 
@@ -82,7 +207,6 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 			dev_err(sram->dev,
 				"could not get address for node %s\n",
 				child->full_name);
-			of_node_put(child);
 			goto err_chunks;
 		}
 
@@ -91,7 +215,6 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 				"reserved block %s outside the sram area\n",
 				child->full_name);
 			ret = -EINVAL;
-			of_node_put(child);
 			goto err_chunks;
 		}
 
@@ -99,11 +222,42 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 		block->size = resource_size(&child_res);
 		list_add_tail(&block->list, &reserve_list);
 
-		dev_dbg(sram->dev, "found reserved block 0x%x-0x%x\n",
-			block->start, block->start + block->size);
+		if (of_find_property(child, "export", NULL))
+			block->export = true;
+
+		if (of_find_property(child, "pool", NULL))
+			block->pool = true;
+
+		if ((block->export || block->pool) && block->size) {
+			exports++;
+
+			label = NULL;
+			ret = of_property_read_string(child, "label", &label);
+			if (ret && ret != -EINVAL) {
+				dev_err(sram->dev,
+					"%s has invalid label name\n",
+					child->full_name);
+				goto err_chunks;
+			}
+			if (!label)
+				label = child->name;
+
+			block->label = devm_kstrdup(sram->dev,
+						    label, GFP_KERNEL);
+			if (!block->label)
+				goto err_chunks;
+
+			dev_dbg(sram->dev, "found %sblock '%s' 0x%x-0x%x\n",
+				block->export ? "exported " : "", block->label,
+				block->start, block->start + block->size);
+		} else {
+			dev_dbg(sram->dev, "found reserved block 0x%x-0x%x\n",
+				block->start, block->start + block->size);
+		}
 
 		block++;
 	}
+	child = NULL;
 
 	/* the last chunk marks the end of the region */
 	rblocks[nblocks - 1].start = size;
@@ -112,8 +266,17 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 
 	list_sort(NULL, &reserve_list, sram_reserve_cmp);
 
-	cur_start = 0;
+	if (exports) {
+		sram->partition = devm_kzalloc(sram->dev,
+				       exports * sizeof(*sram->partition),
+				       GFP_KERNEL);
+		if (!sram->partition) {
+			ret = -ENOMEM;
+			goto err_chunks;
+		}
+	}
 
+	cur_start = 0;
 	list_for_each_entry(block, &reserve_list, list) {
 		/* can only happen if sections overlap */
 		if (block->start < cur_start) {
@@ -121,9 +284,19 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 				"block at 0x%x starts after current offset 0x%lx\n",
 				block->start, cur_start);
 			ret = -EINVAL;
+			sram_free_partitions(sram);
 			goto err_chunks;
 		}
 
+		if ((block->export || block->pool) && block->size) {
+			ret = sram_add_partition(sram, block,
+						 res->start + block->start);
+			if (ret) {
+				sram_free_partitions(sram);
+				goto err_chunks;
+			}
+		}
+
 		/* current start is in a reserved block, so continue after it */
 		if (block->start == cur_start) {
 			cur_start = block->start + block->size;
@@ -143,14 +316,19 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
 		ret = gen_pool_add_virt(sram->pool,
 				(unsigned long)sram->virt_base + cur_start,
 				res->start + cur_start, cur_size, -1);
-		if (ret < 0)
+		if (ret < 0) {
+			sram_free_partitions(sram);
 			goto err_chunks;
+		}
 
 		/* next allocation after this reserved block */
 		cur_start = block->start + block->size;
 	}
 
  err_chunks:
+	if (child)
+		of_node_put(child);
+
 	kfree(rblocks);
 
 	return ret;
@@ -213,6 +391,8 @@ static int sram_remove(struct platform_device *pdev)
 {
 	struct sram_dev *sram = platform_get_drvdata(pdev);
 
+	sram_free_partitions(sram);
+
 	if (gen_pool_avail(sram->pool) < gen_pool_size(sram->pool))
 		dev_err(sram->dev, "removed while SRAM allocated\n");
 
-- 
2.5.0
