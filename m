From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 1/7] EDAC, altera: Check parent status for Arria10 EDAC block
Date: Mon, 25 Apr 2016 12:52:42 -0500
Message-ID: <1461606768-14404-2-git-send-email-tthayer@opensource.altera.com>
References: <1461606768-14404-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461606768-14404-1-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

In preparation for the Arria10 ECC modules, check the status
of the parent in the device tree to ensure the block is enabled.
Skip if no parent phandle is set in the device tree.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2  No change
---
 drivers/edac/altera_edac.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 5b4d223..b127e77 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1108,6 +1108,7 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
 	struct resource res;
 	int edac_idx;
 	int rc = 0;
+	struct device_node *parent;
 	const struct edac_device_prv_data *prv;
 	/* Get matching node and check for valid result */
 	const struct of_device_id *pdev_id =
@@ -1120,6 +1121,14 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
 	if (IS_ERR_OR_NULL(prv))
 		return -ENODEV;
 
+	/* If there is a parent parameter, exit if it is not available. */
+	parent = of_parse_phandle(np, "parent", 0);
+	if (parent && !of_device_is_available(parent)) {
+		of_node_put(parent);
+		return -ENODEV;
+	}
+	of_node_put(parent);
+
 	if (!devres_open_group(edac->dev, altr_edac_a10_device_add, GFP_KERNEL))
 		return -ENOMEM;
 
-- 
1.7.9.5
