From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 2/2] of: base: replace all duplicate code with of_machine_get_model_name
Date: Thu, 17 Nov 2016 15:32:55 +0000
Message-ID: <1479396775-32033-2-git-send-email-sudeep.holla@arm.com>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch replaces all the code snippets that reads the model name
from the device tree with the newly added helper function:
of_machine_get_model_name

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/mach-imx/cpu.c           |  5 +----
 arch/arm/mach-mxs/mach-mxs.c      |  4 +---
 arch/mips/cavium-octeon/setup.c   | 12 ++----------
 arch/mips/generic/proc.c          | 15 +++------------
 arch/sh/boards/of-generic.c       |  8 +-------
 drivers/soc/fsl/guts.c            |  8 ++------
 drivers/soc/renesas/renesas-soc.c |  4 +---
 7 files changed, 11 insertions(+), 45 deletions(-)

Hi,

This patch is just to show the use of PATCH 1/2. It needs to go after
1/2 is merged for sake of simplicity and avoid cross dependencies
(targetting v4.11)

Regards,
Sudeep

diff --git a/arch/arm/mach-imx/cpu.c b/arch/arm/mach-imx/cpu.c
index b3347d32349f..dc3ebc1560dd 100644
--- a/arch/arm/mach-imx/cpu.c
+++ b/arch/arm/mach-imx/cpu.c
@@ -75,7 +75,6 @@ struct device * __init imx_soc_device_init(void)
 {
 	struct soc_device_attribute *soc_dev_attr;
 	struct soc_device *soc_dev;
-	struct device_node *root;
 	const char *soc_id;
 	int ret;

@@ -85,9 +84,7 @@ struct device * __init imx_soc_device_init(void)

 	soc_dev_attr->family = "Freescale i.MX";

-	root = of_find_node_by_path("/");
-	ret = of_property_read_string(root, "model", &soc_dev_attr->machine);
-	of_node_put(root);
+	ret = of_machine_get_model_name(&soc_dev_attr->machine);
 	if (ret)
 		goto free_soc;

diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.c
index e4f21086b42b..871c65f02fca 100644
--- a/arch/arm/mach-mxs/mach-mxs.c
+++ b/arch/arm/mach-mxs/mach-mxs.c
@@ -381,7 +381,6 @@ static void __init eukrea_mbmx283lc_init(void)

 static void __init mxs_machine_init(void)
 {
-	struct device_node *root;
 	struct device *parent;
 	struct soc_device *soc_dev;
 	struct soc_device_attribute *soc_dev_attr;
@@ -391,8 +390,7 @@ static void __init mxs_machine_init(void)
 	if (!soc_dev_attr)
 		return;

-	root = of_find_node_by_path("/");
-	ret = of_property_read_string(root, "model", &soc_dev_attr->machine);
+	ret = of_machine_get_model_name(&soc_dev_attr->machine);
 	if (ret)
 		return;

diff --git a/arch/mips/cavium-octeon/setup.c b/arch/mips/cavium-octeon/setup.c
index 9a2db1c013d9..2e2b1b5befa4 100644
--- a/arch/mips/cavium-octeon/setup.c
+++ b/arch/mips/cavium-octeon/setup.c
@@ -498,16 +498,8 @@ static void __init init_octeon_system_type(void)
 	char const *board_type;

 	board_type = cvmx_board_type_to_string(octeon_bootinfo->board_type);
-	if (board_type == NULL) {
-		struct device_node *root;
-		int ret;
-
-		root = of_find_node_by_path("/");
-		ret = of_property_read_string(root, "model", &board_type);
-		of_node_put(root);
-		if (ret)
-			board_type = "Unsupported Board";
-	}
+	if (!board_type && of_machine_get_model_name(&board_type))
+		board_type = "Unsupported Board";

 	snprintf(octeon_system_type, sizeof(octeon_system_type), "%s (%s)",
 		 board_type, octeon_model_get_string(read_c0_prid()));
diff --git a/arch/mips/generic/proc.c b/arch/mips/generic/proc.c
index 42b33250a4a2..f7fc067bf908 100644
--- a/arch/mips/generic/proc.c
+++ b/arch/mips/generic/proc.c
@@ -10,20 +10,11 @@

 #include <linux/of.h>

-#include <asm/bootinfo.h>
-
 const char *get_system_type(void)
 {
 	const char *str;
-	int err;
-
-	err = of_property_read_string(of_root, "model", &str);
-	if (!err)
-		return str;
-
-	err = of_property_read_string_index(of_root, "compatible", 0, &str);
-	if (!err)
-		return str;

-	return "Unknown";
+	if (of_machine_get_model_name(&str))
+		return "Unknown";
+	return str;
 }
diff --git a/arch/sh/boards/of-generic.c b/arch/sh/boards/of-generic.c
index 1fb6d5714bae..9de3f81b2d22 100644
--- a/arch/sh/boards/of-generic.c
+++ b/arch/sh/boards/of-generic.c
@@ -124,8 +124,6 @@ static void __init sh_of_time_init(void)

 static void __init sh_of_setup(char **cmdline_p)
 {
-	struct device_node *root;
-
 #ifdef CONFIG_USE_BUILTIN_DTB
 	unflatten_and_copy_device_tree();
 #else
@@ -135,11 +133,7 @@ static void __init sh_of_setup(char **cmdline_p)
 	board_time_init = sh_of_time_init;

 	sh_mv.mv_name = "Unknown SH model";
-	root = of_find_node_by_path("/");
-	if (root) {
-		of_property_read_string(root, "model", &sh_mv.mv_name);
-		of_node_put(root);
-	}
+	of_machine_get_model_name(&sh_mv.mv_name);

 	sh_of_smp_probe();
 }
diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 6af7a11f09a5..94aef0465451 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -132,7 +132,7 @@ EXPORT_SYMBOL(fsl_guts_get_svr);

 static int fsl_guts_probe(struct platform_device *pdev)
 {
-	struct device_node *root, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	const struct fsl_soc_die_attr *soc_die;
@@ -152,11 +152,7 @@ static int fsl_guts_probe(struct platform_device *pdev)
 		return PTR_ERR(guts->regs);

 	/* Register soc device */
-	root = of_find_node_by_path("/");
-	if (of_property_read_string(root, "model", &machine))
-		of_property_read_string_index(root, "compatible", 0, &machine);
-	of_node_put(root);
-	if (machine)
+	if (!of_machine_get_model_name(&machine))
 		soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);

 	svr = fsl_guts_get_svr();
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 330960312296..d9a119073de5 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -228,9 +228,7 @@ static int __init renesas_soc_init(void)
 	if (!soc_dev_attr)
 		return -ENOMEM;

-	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
-	of_node_put(np);
+	of_machine_get_model_name(&soc_dev_attr->machine);

 	soc_dev_attr->family = kstrdup_const(family->name, GFP_KERNEL);
 	soc_dev_attr->soc_id = kstrdup_const(strchr(match->compatible, ',') + 1,
--
2.7.4
