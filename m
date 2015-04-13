From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] of/fdt: fix argument name and add comments of unflatten_dt_node()
Date: Mon, 13 Apr 2015 10:30:20 +0900
Message-ID: <1428888620-307-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Match the name of the third argument in the comment block
to the actual function: p -> poffset

Add missing comments about the arguments "nodepp" and "dryrun".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/of/fdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 3a896c9..35898ca 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -145,9 +145,12 @@ static void *unflatten_dt_alloc(void **mem, unsigned long size,
  * unflatten_dt_node - Alloc and populate a device_node from the flat tree
  * @blob: The parent device tree blob
  * @mem: Memory chunk to use for allocating device nodes and properties
- * @p: pointer to node in flat tree
+ * @poffset: pointer to node in flat tree
  * @dad: Parent struct device_node
+ * @nodepp: The device_node tree created by the call
  * @fpsize: Size of the node path up at the current depth.
+ * @dryrun: If true, do not allocate device nodes but still calculate needed
+ * memory size
  */
 static void * unflatten_dt_node(void *blob,
 				void *mem,
-- 
1.9.1
