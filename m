From: Viresh Kumar <viresh.kumar@st.com>
Subject: [PATCH V4 1/5] of: Implement managed of_iomap()
Date: Mon, 16 Apr 2012 09:43:57 +0530
Message-ID: <6a0872f9d8959bc9d66d179e4911d6f09a219b42.1334548272.git.viresh.kumar@st.com>
References: <cover.1334548272.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1334548272.git.viresh.kumar@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org
Cc: devicetree-discuss@ozlabs.org, arnd@arndb.de, swarren@wwwdotorg.org, spear-devel@list.st.com, Grant Likely <grant.likely@secretlab.ca>, viresh.linux@gmail.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This simplifies cleanup paths of user code by providing managed version of
of_iomap().

Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
---
 Documentation/driver-model/devres.txt |    1 +
 drivers/of/address.c                  |   22 ++++++++++++++++++++++
 include/linux/of_address.h            |    5 +++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index 2a596a4..74f0f92 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -266,6 +266,7 @@ IOMAP
   devm_ioremap()
   devm_ioremap_nocache()
   devm_iounmap()
+  devm_of_iomap()
   devm_request_and_ioremap() : checks resource, requests region, ioremaps
   pcim_iomap()
   pcim_iounmap()
diff --git a/drivers/of/address.c b/drivers/of/address.c
index 66d96f1..f58eb4c 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -619,3 +619,25 @@ void __iomem *of_iomap(struct device_node *np, int index)
 	return ioremap(res.start, resource_size(&res));
 }
 EXPORT_SYMBOL(of_iomap);
+
+/**
+ * devm_of_iomap - Maps the managed memory mapped IO for a given device
+ * @dev:	the device whose io range will be mapped
+ * @index:	index of the io range
+ *
+ * Returns a pointer to the mapped memory
+ */
+void __iomem *devm_of_iomap(struct device *dev, int index)
+{
+	struct device_node *np = dev->of_node;
+	struct resource res;
+
+	if (!np)
+		return NULL;
+
+	if (of_address_to_resource(np, index, &res))
+		return NULL;
+
+	return devm_ioremap(dev, res.start, resource_size(&res));
+}
+EXPORT_SYMBOL(devm_of_iomap);
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 01b925a..5ba9ea8 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -13,6 +13,7 @@ extern struct device_node *of_find_matching_node_by_address(
 					const struct of_device_id *matches,
 					u64 base_address);
 extern void __iomem *of_iomap(struct device_node *device, int index);
+extern void __iomem *devm_of_iomap(struct device *dev, int index);
 
 /* Extract an address from a device, returns the region size and
  * the address space flags too. The PCI version uses a BAR number
@@ -43,6 +44,10 @@ static inline void __iomem *of_iomap(struct device_node *device, int index)
 {
 	return NULL;
 }
+static inline void __iomem *devm_of_iomap(struct device *dev, int index)
+{
+	return NULL;
+}
 static inline const u32 *of_get_address(struct device_node *dev, int index,
 					u64 *size, unsigned int *flags)
 {
-- 
1.7.9
