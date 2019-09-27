From: Rob Herring <robh@kernel.org>
Subject: [PATCH 06/11] of/address: Introduce of_get_next_dma_parent() helper
Date: Thu, 26 Sep 2019 19:24:50 -0500
Message-ID: <20190927002455.13169-7-robh@kernel.org>
References: <20190927002455.13169-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Robin Murphy <robin.murphy@arm.com>

Add of_get_next_dma_parent() helper which is similar to
__of_get_dma_parent(), but can be used in iterators and decrements the
ref count on the prior parent.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 53d2656c2269..e9188c82fdae 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -695,6 +695,16 @@ static struct device_node *__of_get_dma_parent(const struct device_node *np)
 	return of_node_get(args.np);
 }
 
+static struct device_node *of_get_next_dma_parent(struct device_node *np)
+{
+	struct device_node *parent;
+
+	parent = __of_get_dma_parent(np);
+	of_node_put(np);
+
+	return parent;
+}
+
 u64 of_translate_dma_address(struct device_node *dev, const __be32 *in_addr)
 {
 	struct device_node *host;
-- 
2.20.1
