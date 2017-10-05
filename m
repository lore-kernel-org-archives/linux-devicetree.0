From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 1/5] of/platform: Generalize /reserved-memory handling
Date: Wed,  4 Oct 2017 20:32:54 -0700
Message-ID: <20171005033258.12825-2-bjorn.andersson@linaro.org>
References: <20171005033258.12825-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171005033258.12825-1-bjorn.andersson@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <andy.gross@linaro.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Frank Rowand <frowand.list@gmail.com>, Kees Cook <keescook@chromium.org>, Rob Herring <robh+dt@kernel.org>, Tony Luck <tony.luck@intel.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

By iterating over all /reserved-memory child nodes and match each one to
a list of compatibles that we want to treat specially, we can easily
extend the list of compatibles to handle - without having to resort to
of_platform_populate() that would create unnecessary platform_devices.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Simplify logic per Rob's suggestion.

Changes since v1:
- New patch

 drivers/of/platform.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index b19524623498..ee89f096f0f3 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -497,6 +497,11 @@ int of_platform_default_populate(struct device_node *root,
 EXPORT_SYMBOL_GPL(of_platform_default_populate);
 
 #ifndef CONFIG_PPC
+static const struct of_device_id reserved_mem_matches[] = {
+	{ .compatible = "ramoops" },
+	{}
+};
+
 static int __init of_platform_default_populate_init(void)
 {
 	struct device_node *node;
@@ -505,15 +510,12 @@ static int __init of_platform_default_populate_init(void)
 		return -ENODEV;
 
 	/*
-	 * Handle ramoops explicitly, since it is inside /reserved-memory,
-	 * which lacks a "compatible" property.
+	 * Handle certain compatibles explicitly, since we don't want to create
+	 * platform_devices for every node in /reserved-memory with a
+	 * "compatible",
 	 */
-	node = of_find_node_by_path("/reserved-memory");
-	if (node) {
-		node = of_find_compatible_node(node, NULL, "ramoops");
-		if (node)
-			of_platform_device_create(node, NULL, NULL);
-	}
+	for_each_matching_node(node, reserved_mem_matches)
+		of_platform_device_create(node, NULL, NULL);
 
 	/* Populate everything else. */
 	of_platform_default_populate(NULL, NULL, NULL);
-- 
2.12.0
