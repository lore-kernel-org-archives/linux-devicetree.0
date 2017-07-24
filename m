From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of/irq: use of_property_read_u32_index to parse interrupts property
Date: Mon, 24 Jul 2017 10:14:38 -0500
Message-ID: <20170724151438.7069-2-robh@kernel.org>
References: <20170724151438.7069-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170724151438.7069-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Convert the interrupts property parsing to use the OF property API
instead of open coding the parsing of the raw property value. This saves
a number of LoC, and the result is easier to read.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/irq.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index abbd252fe25b..aa2a60c8868e 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -292,8 +292,8 @@ EXPORT_SYMBOL_GPL(of_irq_parse_raw);
 int of_irq_parse_one(struct device_node *device, int index, struct of_phandle_args *out_irq)
 {
 	struct device_node *p;
-	const __be32 *intspec, *addr;
-	u32 intsize, intlen;
+	const __be32 *addr;
+	u32 intsize;
 	int i, res;
 
 	pr_debug("of_irq_parse_one: dev=%pOF, index=%d\n", device, index);
@@ -311,15 +311,6 @@ int of_irq_parse_one(struct device_node *device, int index, struct of_phandle_ar
 	if (!res)
 		return of_irq_parse_raw(addr, out_irq);
 
-	/* Get the interrupts property */
-	intspec = of_get_property(device, "interrupts", &intlen);
-	if (intspec == NULL)
-		return -EINVAL;
-
-	intlen /= sizeof(*intspec);
-
-	pr_debug(" intspec=%d intlen=%d\n", be32_to_cpup(intspec), intlen);
-
 	/* Look for the interrupt parent. */
 	p = of_irq_find_parent(device);
 	if (p == NULL)
@@ -331,20 +322,21 @@ int of_irq_parse_one(struct device_node *device, int index, struct of_phandle_ar
 		goto out;
 	}
 
-	pr_debug(" intsize=%d intlen=%d\n", intsize, intlen);
-
-	/* Check index */
-	if ((index + 1) * intsize > intlen) {
-		res = -EINVAL;
-		goto out;
-	}
+	pr_debug(" parent=%pOF, intsize=%d\n", p, intsize);
 
 	/* Copy intspec into irq structure */
-	intspec += index * intsize;
 	out_irq->np = p;
 	out_irq->args_count = intsize;
-	for (i = 0; i < intsize; i++)
-		out_irq->args[i] = be32_to_cpup(intspec++);
+	for (i = 0; i < intsize; i++) {
+		res = of_property_read_u32_index(device, "interrupts",
+						 (index * intsize) + i,
+						 out_irq->args + i);
+		if (res)
+			goto out;
+	}
+
+	pr_debug(" intspec=%d\n", *out_irq->args);
+
 
 	/* Check if there are any interrupt-map translations to process */
 	res = of_irq_parse_raw(addr, out_irq);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
