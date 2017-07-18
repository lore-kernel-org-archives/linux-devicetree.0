From: Rob Herring <robh@kernel.org>
Subject: [PATCH] nvmem: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:43:20 -0500
Message-ID: <20170718214339.7774-40-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 4c49285168fb..b0c60338296a 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -794,8 +794,8 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,

 	addr = of_get_property(cell_np, "reg", &len);
 	if (!addr || (len < 2 * sizeof(u32))) {
-		dev_err(&nvmem->dev, "nvmem: invalid reg on %s\n",
-			cell_np->full_name);
+		dev_err(&nvmem->dev, "nvmem: invalid reg on %pOF\n",
+			cell_np);
 		rval  = -EINVAL;
 		goto err_mem;
 	}
--
2.11.0
