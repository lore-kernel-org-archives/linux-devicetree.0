From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] pstore: use DT reserved-memory bindings
Date: Mon, 1 Aug 2016 12:05:27 -0700
Message-ID: <20160801190527.GA16445@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Hackmann <ghackmann-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Instead of a ramoops-specific node, use a child node of /reserved-memory.
This requires that of_platform_device_create() be explicitly called
for the node, though, since "/reserved-memory" does not have its own
"compatible" property.

Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
v2:
- rebase to 4.8, use of_platform_default_populate_init(), robh
- use platform device resources instead of node directly, robh
---
 .../bindings/{misc => reserved-memory}/ramoops.txt |  8 ++---
 Documentation/ramoops.txt                          | 38 +++++++++++++++-------
 drivers/of/platform.c                              | 20 ++++++++++--
 fs/pstore/ram.c                                    | 23 ++++---------
 4 files changed, 56 insertions(+), 33 deletions(-)
 rename Documentation/devicetree/bindings/{misc => reserved-memory}/ramoops.txt (86%)

diff --git a/Documentation/devicetree/bindings/misc/ramoops.txt b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
similarity index 86%
rename from Documentation/devicetree/bindings/misc/ramoops.txt
rename to Documentation/devicetree/bindings/reserved-memory/ramoops.txt
index cd02cec67d38..e81f821a2135 100644
--- a/Documentation/devicetree/bindings/misc/ramoops.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
@@ -2,8 +2,9 @@ Ramoops oops/panic logger
 =========================
 
 ramoops provides persistent RAM storage for oops and panics, so they can be
-recovered after a reboot. It is a backend to pstore, so this node is named
-"ramoops" after the backend, rather than "pstore" which is the subsystem.
+recovered after a reboot. This is a child-node of "/reserved-memory", and
+is named "ramoops" after the backend, rather than "pstore" which is the
+subsystem.
 
 Parts of this storage may be set aside for other persistent log buffers, such
 as kernel log messages, or for optional ECC error-correction data.  The total
@@ -21,8 +22,7 @@ Required properties:
 
 - compatible: must be "ramoops"
 
-- memory-region: phandle to a region of memory that is preserved between
-  reboots
+- reg: region of memory that is preserved between reboots
 
 
 Optional properties:
diff --git a/Documentation/ramoops.txt b/Documentation/ramoops.txt
index 9264bcab4099..26b9f31cf65a 100644
--- a/Documentation/ramoops.txt
+++ b/Documentation/ramoops.txt
@@ -45,18 +45,34 @@ corrupt, but usually it is restorable.
 
 2. Setting the parameters
 
-Setting the ramoops parameters can be done in 3 different manners:
- 1. Use the module parameters (which have the names of the variables described
- as before).
- For quick debugging, you can also reserve parts of memory during boot
- and then use the reserved memory for ramoops. For example, assuming a machine
- with > 128 MB of memory, the following kernel command line will tell the
- kernel to use only the first 128 MB of memory, and place ECC-protected ramoops
- region at 128 MB boundary:
+Setting the ramoops parameters can be done in several different manners:
+
+ A. Use the module parameters (which have the names of the variables described
+ as before). For quick debugging, you can also reserve parts of memory during
+ boot and then use the reserved memory for ramoops. For example, assuming a
+ machine with > 128 MB of memory, the following kernel command line will tell
+ the kernel to use only the first 128 MB of memory, and place ECC-protected
+ ramoops region at 128 MB boundary:
  "mem=128M ramoops.mem_address=0x8000000 ramoops.ecc=1"
- 2. Use Device Tree bindings, as described in
- Documentation/device-tree/bindings/misc/ramoops.txt.
- 3. Use a platform device and set the platform data. The parameters can then
+
+ B. Use Device Tree bindings, as described in
+ Documentation/device-tree/bindings/reserved-memory/ramoops.txt.
+ For example:
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@8f000000 {
+			compatible = "ramoops";
+			reg = <0 0x8f000000 0 0x100000>;
+			record-size = <0x4000>;
+			console-size = <0x4000>;
+		};
+	};
+
+ C. Use a platform device and set the platform data. The parameters can then
  be set through that platform data. An example of doing that is:
 
 #include <linux/pstore_ram.h>
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 765390e3ed8d..8aa197691074 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -499,8 +499,24 @@ EXPORT_SYMBOL_GPL(of_platform_default_populate);
 
 static int __init of_platform_default_populate_init(void)
 {
-	if (of_have_populated_dt())
-		of_platform_default_populate(NULL, NULL, NULL);
+	struct device_node *node;
+
+	if (!of_have_populated_dt())
+		return -ENODEV;
+
+	/*
+	 * Handle ramoops explicitly, since it is inside /reserved-memory,
+	 * which lacks a "compatible" property.
+	 */
+	node = of_find_node_by_path("/reserved-memory");
+	if (node) {
+		node = of_find_compatible_node(node, NULL, "ramoops");
+		if (node)
+			of_platform_device_create(node, NULL, NULL);
+	}
+
+	/* Populate everything else. */
+	of_platform_default_populate(NULL, NULL, NULL);
 
 	return 0;
 }
diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 47516a794011..427eee7570bb 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -486,30 +486,21 @@ static int ramoops_parse_dt(struct platform_device *pdev,
 			    struct ramoops_platform_data *pdata)
 {
 	struct device_node *of_node = pdev->dev.of_node;
-	struct device_node *mem_region;
-	struct resource res;
+	struct resource *res;
 	u32 value;
 	int ret;
 
 	dev_dbg(&pdev->dev, "using Device Tree\n");
 
-	mem_region = of_parse_phandle(of_node, "memory-region", 0);
-	if (!mem_region) {
-		dev_err(&pdev->dev, "no memory-region phandle\n");
-		return -ENODEV;
-	}
-
-	ret = of_address_to_resource(mem_region, 0, &res);
-	of_node_put(mem_region);
-	if (ret) {
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
 		dev_err(&pdev->dev,
-			"failed to translate memory-region to resource: %d\n",
-			ret);
-		return ret;
+			"failed to locate DT /reserved-memory resource\n");
+		return -EINVAL;
 	}
 
-	pdata->mem_size = resource_size(&res);
-	pdata->mem_address = res.start;
+	pdata->mem_size = resource_size(res);
+	pdata->mem_address = res->start;
 	pdata->mem_type = of_property_read_bool(of_node, "unbuffered");
 	pdata->dump_oops = !of_property_read_bool(of_node, "no-dump-oops");
 
-- 
2.7.4


-- 
Kees Cook
Brillo & Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
