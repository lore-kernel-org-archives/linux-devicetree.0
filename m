From: Rob Herring <robh@kernel.org>
Subject: [PATCH] staging: fsl-mc: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:43:33 -0500
Message-ID: <20170718214339.7774-53-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Stuart Yoder <stuyoder@gmail.com>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org
---
 drivers/staging/fsl-mc/bus/fsl-mc-bus.c                | 4 ++--
 drivers/staging/fsl-mc/bus/fsl-mc-msi.c                | 4 ++--
 drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c | 8 +++-----
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/fsl-mc/bus/fsl-mc-bus.c b/drivers/staging/fsl-mc/bus/fsl-mc-bus.c
index 19606e8d25dd..409f2b9e70ff 100644
--- a/drivers/staging/fsl-mc/bus/fsl-mc-bus.c
+++ b/drivers/staging/fsl-mc/bus/fsl-mc-bus.c
@@ -757,8 +757,8 @@ static int fsl_mc_bus_probe(struct platform_device *pdev)
 	error = of_address_to_resource(pdev->dev.of_node, 0, &res);
 	if (error < 0) {
 		dev_err(&pdev->dev,
-			"of_address_to_resource() failed for %s\n",
-			pdev->dev.of_node->full_name);
+			"of_address_to_resource() failed for %pOF\n",
+			pdev->dev.of_node);
 		return error;
 	}

diff --git a/drivers/staging/fsl-mc/bus/fsl-mc-msi.c b/drivers/staging/fsl-mc/bus/fsl-mc-msi.c
index c04a2f2b3409..49f95123b5c7 100644
--- a/drivers/staging/fsl-mc/bus/fsl-mc-msi.c
+++ b/drivers/staging/fsl-mc/bus/fsl-mc-msi.c
@@ -183,8 +183,8 @@ int fsl_mc_find_msi_domain(struct device *mc_platform_dev,
 	msi_domain = of_msi_get_domain(mc_platform_dev, mc_of_node,
 				       DOMAIN_BUS_FSL_MC_MSI);
 	if (!msi_domain) {
-		pr_err("Unable to find fsl-mc MSI domain for %s\n",
-		       mc_of_node->full_name);
+		pr_err("Unable to find fsl-mc MSI domain for %pOF\n",
+		       mc_of_node);

 		return -ENOENT;
 	}
diff --git a/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c b/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
index 865d38517508..e49dcde480fc 100644
--- a/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
+++ b/drivers/staging/fsl-mc/bus/irq-gic-v3-its-fsl-mc-msi.c
@@ -79,8 +79,7 @@ int __init its_fsl_mc_msi_init(void)

 		parent = irq_find_matching_host(np, DOMAIN_BUS_NEXUS);
 		if (!parent || !msi_get_domain_info(parent)) {
-			pr_err("%s: unable to locate ITS domain\n",
-			       np->full_name);
+			pr_err("%pOF: unable to locate ITS domain\n", np);
 			continue;
 		}

@@ -89,15 +88,14 @@ int __init its_fsl_mc_msi_init(void)
 						 &its_fsl_mc_msi_domain_info,
 						 parent);
 		if (!mc_msi_domain) {
-			pr_err("%s: unable to create fsl-mc domain\n",
-			       np->full_name);
+			pr_err("%pOF: unable to create fsl-mc domain\n", np);
 			continue;
 		}

 		WARN_ON(mc_msi_domain->host_data !=
 			&its_fsl_mc_msi_domain_info);

-		pr_info("fsl-mc MSI: %s domain created\n", np->full_name);
+		pr_info("fsl-mc MSI: %pOF domain created\n", np);
 	}

 	return 0;
--
2.11.0
