From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 4/6] nvmem: core: add nvmem_cell_read_u16
Date: Thu, 28 Feb 2019 11:19:54 +0100
Message-ID: <1551349196-8956-5-git-send-email-fabrice.gasnier@st.com>
References: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, lionel.debieve@st.com, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add nvmem_cell_read_u16() helper to ease read of an u16 value on consumer
side. This is inspired by nvmem_cell_read_u32() function.
This helper is useful on stm32 that has 16 bits data cells stored in non
volatile memory.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/nvmem/core.c           | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/nvmem-consumer.h |  7 +++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index f7301bb..5bd48ed 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1331,6 +1331,43 @@ int nvmem_cell_write(struct nvmem_cell *cell, void *buf, size_t len)
 EXPORT_SYMBOL_GPL(nvmem_cell_write);
 
 /**
+ * nvmem_cell_read_u16() - Read a cell value as an u16
+ *
+ * @dev: Device that requests the nvmem cell.
+ * @cell_id: Name of nvmem cell to read.
+ * @val: pointer to output value.
+ *
+ * Return: 0 on success or negative errno.
+ */
+int nvmem_cell_read_u16(struct device *dev, const char *cell_id, u16 *val)
+{
+	struct nvmem_cell *cell;
+	void *buf;
+	size_t len;
+
+	cell = nvmem_cell_get(dev, cell_id);
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	buf = nvmem_cell_read(cell, &len);
+	if (IS_ERR(buf)) {
+		nvmem_cell_put(cell);
+		return PTR_ERR(buf);
+	}
+	if (len != sizeof(*val)) {
+		kfree(buf);
+		nvmem_cell_put(cell);
+		return -EINVAL;
+	}
+	memcpy(val, buf, sizeof(*val));
+	kfree(buf);
+	nvmem_cell_put(cell);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nvmem_cell_read_u16);
+
+/**
  * nvmem_cell_read_u32() - Read a cell value as an u32
  *
  * @dev: Device that requests the nvmem cell.
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 312bfa5..8f8be5b 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -61,6 +61,7 @@ void nvmem_cell_put(struct nvmem_cell *cell);
 void devm_nvmem_cell_put(struct device *dev, struct nvmem_cell *cell);
 void *nvmem_cell_read(struct nvmem_cell *cell, size_t *len);
 int nvmem_cell_write(struct nvmem_cell *cell, void *buf, size_t len);
+int nvmem_cell_read_u16(struct device *dev, const char *cell_id, u16 *val);
 int nvmem_cell_read_u32(struct device *dev, const char *cell_id, u32 *val);
 
 /* direct nvmem device read/write interface */
@@ -122,6 +123,12 @@ static inline int nvmem_cell_write(struct nvmem_cell *cell,
 	return -EOPNOTSUPP;
 }
 
+static inline int nvmem_cell_read_u16(struct device *dev,
+				      const char *cell_id, u16 *val)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int nvmem_cell_read_u32(struct device *dev,
 				      const char *cell_id, u32 *val)
 {
-- 
2.7.4
