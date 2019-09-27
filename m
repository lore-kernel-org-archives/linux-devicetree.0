From: Rob Herring <robh@kernel.org>
Subject: [PATCH 10/11] of/address: Translate 'dma-ranges' for parent nodes missing 'dma-ranges'
Date: Thu, 26 Sep 2019 19:24:54 -0500
Message-ID: <20190927002455.13169-11-robh@kernel.org>
References: <20190927002455.13169-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

'dma-ranges' frequently exists without parent nodes having 'dma-ranges'.
While this is an error for 'ranges', this is fine because DMA capable
devices always have a translatable DMA address. Also, with no
'dma-ranges' at all, the assumption is that DMA addresses are 1:1 with
no restrictions unless perhaps the device itself has implicit
restrictions.

Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index e918001c7798..5b835d332709 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -519,9 +519,13 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	 *
 	 * As far as we know, this damage only exists on Apple machines, so
 	 * This code is only enabled on powerpc. --gcl
+	 *
+	 * This quirk also applies for 'dma-ranges' which frequently exist in
+	 * child nodes without 'dma-ranges' in the parent nodes. --RobH
 	 */
 	ranges = of_get_property(parent, rprop, &rlen);
-	if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
+	if (ranges == NULL && !of_empty_ranges_quirk(parent) &&
+	    strcmp(rprop, "dma-ranges")) {
 		pr_debug("no ranges; cannot translate\n");
 		return 1;
 	}
-- 
2.20.1
