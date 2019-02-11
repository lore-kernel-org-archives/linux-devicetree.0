From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 4/7] of: address: Add support for the parent DMA bus
Date: Mon, 11 Feb 2019 16:02:52 +0100
Message-ID: <fc76568f10be15b0dfc7515d6affecb20de3e479.1549897336.git-series.maxime.ripard@bootlin.com>
References: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Robin Murphy <robin.murphy@arm.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some SoCs have devices that are using a separate bus from the main bus to
perform DMA.

These buses might have some restrictions and/or different mapping than from
the CPU side, so we'd need to express those using the usual dma-ranges, but
using a different DT node than the node's parent.

Now that the generic interconnect bindings are available, we can model an
interconnect with the reserved name "dma" for those use-cases.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/of/address.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 4c5dc21c71ca..0e9d87a664f5 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -583,8 +583,8 @@ static u64 __of_translate_address(struct device_node *dev,
 	/* Increase refcount at current level */
 	of_node_get(dev);
 
+	*host = NULL;
 	if (!parent) {
-		*host = NULL;
 		/* Get parent & match bus type */
 		parent = of_get_parent(dev);
 		if (parent == NULL)
@@ -678,12 +678,34 @@ u64 of_translate_address(struct device_node *dev, const __be32 *in_addr)
 }
 EXPORT_SYMBOL(of_translate_address);
 
+static struct device_node *__of_get_dma_parent(struct device_node *np)
+{
+	struct of_phandle_args args;
+	unsigned int index;
+	int ret;
+
+	ret = of_property_match_string(np, "interconnect-names", "dma");
+	if (ret < 0)
+		return of_get_parent(np);
+
+	ret = of_parse_phandle_with_args(np, "interconnects",
+					 "#interconnect-cells",
+					 index, &args);
+	if (ret < 0)
+		return of_get_parent(np);
+
+	return of_node_get(args.np);
+}
+
 u64 of_translate_dma_address(struct device_node *dev, const __be32 *in_addr)
 {
+	struct device_node *parent;
 	struct device_node *host;
 	u64 ret;
 
-	ret = __of_translate_address(dev, NULL, in_addr, "dma-ranges", &host);
+	parent = __of_get_dma_parent(dev);
+	ret = __of_translate_address(dev, parent, in_addr, "dma-ranges", &host);
+	of_node_put(parent);
 
 	if (host) {
 		of_node_put(host);
@@ -911,9 +933,15 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 		return -EINVAL;
 
 	while (1) {
+		struct device_node *parent;
+
 		naddr = of_n_addr_cells(node);
 		nsize = of_n_size_cells(node);
-		node = of_get_next_parent(node);
+
+		parent = __of_get_dma_parent(node);
+		of_node_put(node);
+
+		node = parent;
 		if (!node)
 			break;
 
-- 
git-series 0.9.1
