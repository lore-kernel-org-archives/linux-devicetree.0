From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Subject: [PATCH 5/9] drivers/usb/host/isp1760-if.c: introduce missing kfree
Date: Fri, 23 Dec 2011 18:39:30 +0100
Message-ID: <1324661974-17281-5-git-send-email-julia@diku.dk>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

drvdata needds to be freed before leaving the function in an error case.

A simplified version of the semantic match that finds the problem is as
follows: (http://coccinelle.lip6.fr)

// <smpl>
@r exists@
local idexpression x;
statement S;
identifier f1;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x == NULL) S
<... when != x
     when != if (...) { <+...x...+> }
x->f1
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>

---
 drivers/usb/host/isp1760-if.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
index b605224..61de62c 100644
--- a/drivers/usb/host/isp1760-if.c
+++ b/drivers/usb/host/isp1760-if.c
@@ -56,14 +56,18 @@ static int of_isp1760_probe(struct platform_device *dev)
 		return -ENOMEM;
 
 	ret = of_address_to_resource(dp, 0, &memory);
-	if (ret)
-		return -ENXIO;
+	if (ret) {
+		ret = -ENXIO;
+		goto free_data;
+	}
 
 	res_len = resource_size(&memory);
 
 	res = request_mem_region(memory.start, res_len, dev_name(&dev->dev));
-	if (!res)
-		return -EBUSY;
+	if (!res) {
+		ret = -EBUSY;
+		goto free_data;
+	}
 
 	if (of_irq_map_one(dp, 0, &oirq)) {
 		ret = -ENODEV;
@@ -125,6 +129,7 @@ free_gpio:
 		gpio_free(drvdata->rst_gpio);
 release_reg:
 	release_mem_region(memory.start, res_len);
+free_data:
 	kfree(drvdata);
 	return ret;
 }

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
