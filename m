From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [RFC][PATCH] pstore: use DT reserved-memory bindings
Date: Fri, 29 Jul 2016 18:16:23 -0700
Message-ID: <20160730011623.GA25495@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Hackmann <ghackmann-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Instead of a ramoops-specific node, use a child node of /reserved-memory.
This requires that of_platform_populate() be called for the node, though,
since it does not have its own "compatible" property.

Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Here's what I've got for moving ramoops under /reserved-memory... still
feels like a bit of a hack.
---
 Documentation/devicetree/bindings/misc/ramoops.txt | 48 ----------------------
 .../bindings/reserved-memory/ramoops.txt           | 48 ++++++++++++++++++++++
 Documentation/ramoops.txt                          |  2 +-
 drivers/of/platform.c                              |  5 +++
 fs/pstore/ram.c                                    | 12 +-----
 5 files changed, 56 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/misc/ramoops.txt
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/ramoops.txt

diff --git a/Documentation/devicetree/bindings/misc/ramoops.txt b/Documentation/devicetree/bindings/misc/ramoops.txt
deleted file mode 100644
index cd02cec67d38..000000000000
--- a/Documentation/devicetree/bindings/misc/ramoops.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-Ramoops oops/panic logger
-=========================
-
-ramoops provides persistent RAM storage for oops and panics, so they can be
-recovered after a reboot. It is a backend to pstore, so this node is named
-"ramoops" after the backend, rather than "pstore" which is the subsystem.
-
-Parts of this storage may be set aside for other persistent log buffers, such
-as kernel log messages, or for optional ECC error-correction data.  The total
-size of these optional buffers must fit in the reserved region.
-
-Any remaining space will be used for a circular buffer of oops and panic
-records.  These records have a configurable size, with a size of 0 indicating
-that they should be disabled.
-
-At least one of "record-size", "console-size", "ftrace-size", or "pmsg-size"
-must be set non-zero, but are otherwise optional as listed below.
-
-
-Required properties:
-
-- compatible: must be "ramoops"
-
-- memory-region: phandle to a region of memory that is preserved between
-  reboots
-
-
-Optional properties:
-
-- ecc-size: enables ECC support and specifies ECC buffer size in bytes
-  (defaults to 0: no ECC)
-
-- record-size: maximum size in bytes of each dump done on oops/panic
-  (defaults to 0: disabled)
-
-- console-size: size in bytes of log buffer reserved for kernel messages
-  (defaults to 0: disabled)
-
-- ftrace-size: size in bytes of log buffer reserved for function tracing and
-  profiling (defaults to 0: disabled)
-
-- pmsg-size: size in bytes of log buffer reserved for userspace messages
-  (defaults to 0: disabled)
-
-- unbuffered: if present, use unbuffered mappings to map the reserved region
-  (defaults to buffered mappings)
-
-- no-dump-oops: if present, only dump panics (defaults to panics and oops)
diff --git a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
new file mode 100644
index 000000000000..e81f821a2135
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
@@ -0,0 +1,48 @@
+Ramoops oops/panic logger
+=========================
+
+ramoops provides persistent RAM storage for oops and panics, so they can be
+recovered after a reboot. This is a child-node of "/reserved-memory", and
+is named "ramoops" after the backend, rather than "pstore" which is the
+subsystem.
+
+Parts of this storage may be set aside for other persistent log buffers, such
+as kernel log messages, or for optional ECC error-correction data.  The total
+size of these optional buffers must fit in the reserved region.
+
+Any remaining space will be used for a circular buffer of oops and panic
+records.  These records have a configurable size, with a size of 0 indicating
+that they should be disabled.
+
+At least one of "record-size", "console-size", "ftrace-size", or "pmsg-size"
+must be set non-zero, but are otherwise optional as listed below.
+
+
+Required properties:
+
+- compatible: must be "ramoops"
+
+- reg: region of memory that is preserved between reboots
+
+
+Optional properties:
+
+- ecc-size: enables ECC support and specifies ECC buffer size in bytes
+  (defaults to 0: no ECC)
+
+- record-size: maximum size in bytes of each dump done on oops/panic
+  (defaults to 0: disabled)
+
+- console-size: size in bytes of log buffer reserved for kernel messages
+  (defaults to 0: disabled)
+
+- ftrace-size: size in bytes of log buffer reserved for function tracing and
+  profiling (defaults to 0: disabled)
+
+- pmsg-size: size in bytes of log buffer reserved for userspace messages
+  (defaults to 0: disabled)
+
+- unbuffered: if present, use unbuffered mappings to map the reserved region
+  (defaults to buffered mappings)
+
+- no-dump-oops: if present, only dump panics (defaults to panics and oops)
diff --git a/Documentation/ramoops.txt b/Documentation/ramoops.txt
index 9264bcab4099..deaf07cbf484 100644
--- a/Documentation/ramoops.txt
+++ b/Documentation/ramoops.txt
@@ -55,7 +55,7 @@ Setting the ramoops parameters can be done in 3 different manners:
  region at 128 MB boundary:
  "mem=128M ramoops.mem_address=0x8000000 ramoops.ecc=1"
  2. Use Device Tree bindings, as described in
- Documentation/device-tree/bindings/misc/ramoops.txt.
+ Documentation/device-tree/bindings/reserved-memory/ramoops.txt.
  3. Use a platform device and set the platform data. The parameters can then
  be set through that platform data. An example of doing that is:
 
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 16e8daffac06..c07adf72bb8e 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -356,6 +356,11 @@ static int of_platform_bus_create(struct device_node *bus,
 	void *platform_data = NULL;
 	int rc = 0;
 
+	/* Always populate reserved-memory nodes. */
+	if (strict && strcmp(bus->full_name, "/reserved-memory") == 0) {
+		return of_platform_populate(bus, matches, lookup, parent);
+	}
+
 	/* Make sure it has a compatible property */
 	if (strict && (!of_get_property(bus, "compatible", NULL))) {
 		pr_debug("%s() - skipping %s, no compatible prop\n",
diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 47516a794011..af5cee0c2156 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -486,24 +486,16 @@ static int ramoops_parse_dt(struct platform_device *pdev,
 			    struct ramoops_platform_data *pdata)
 {
 	struct device_node *of_node = pdev->dev.of_node;
-	struct device_node *mem_region;
 	struct resource res;
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
+	ret = of_address_to_resource(of_node, 0, &res);
 	if (ret) {
 		dev_err(&pdev->dev,
-			"failed to translate memory-region to resource: %d\n",
+			"failed to translate reserved-memory to resource: %d\n",
 			ret);
 		return ret;
 	}
-- 
2.7.4


-- 
Kees Cook
Brillo & Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
