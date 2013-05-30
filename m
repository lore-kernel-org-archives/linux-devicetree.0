From: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Subject: [PATCH 3/3] mfd: twl4030-power: Simplify error path
Date: Thu, 30 May 2013 15:51:56 +0200
Message-ID: <1369921916-7435-4-git-send-email-florian.vaussard@epfl.ch>
References: <1369921916-7435-1-git-send-email-florian.vaussard@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369921916-7435-1-git-send-email-florian.vaussard-p8DiymsW2f8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove unnecessary goto statements, causing duplicated if
conditions.

Signed-off-by: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
---
 drivers/mfd/twl4030-power.c |   37 ++++++++++++++-----------------------
 1 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/twl4030-power.c b/drivers/mfd/twl4030-power.c
index d12d748..7eed526 100644
--- a/drivers/mfd/twl4030-power.c
+++ b/drivers/mfd/twl4030-power.c
@@ -567,21 +567,25 @@ int twl4030_power_probe(struct platform_device *pdev)
 
 	err = twl_i2c_write_u8(TWL_MODULE_PM_MASTER, TWL4030_PM_MASTER_KEY_CFG1,
 			       TWL4030_PM_MASTER_PROTECT_KEY);
-	if (err)
-		goto unlock;
-
-	err = twl_i2c_write_u8(TWL_MODULE_PM_MASTER, TWL4030_PM_MASTER_KEY_CFG2,
+	err |= twl_i2c_write_u8(TWL_MODULE_PM_MASTER, TWL4030_PM_MASTER_KEY_CFG2,
 			       TWL4030_PM_MASTER_PROTECT_KEY);
-	if (err)
-		goto unlock;
+
+	if (err) {
+		pr_err("TWL4030 Unable to unlock registers\n");
+		return err;
+	}
 
 	if (pdata) {
 		err = twl4030_power_configure_scripts(pdata);
-		if (err)
-			goto load;
+		if (err) {
+			pr_err("TWL4030 failed to load scripts\n");
+			return err;
+		}
 		err = twl4030_power_configure_resources(pdata);
-		if (err)
-			goto resource;
+		if (err) {
+			pr_err("TWL4030 failed to configure resource\n");
+			return err;
+		}
 	}
 
 	/* Board has to be wired properly to use this feature */
@@ -611,19 +615,6 @@ relock:
 	if (err)
 		pr_err("TWL4030 Unable to relock registers\n");
 	return err;
-
-unlock:
-	if (err)
-		pr_err("TWL4030 Unable to unlock registers\n");
-	return err;
-load:
-	if (err)
-		pr_err("TWL4030 failed to load scripts\n");
-	return err;
-resource:
-	if (err)
-		pr_err("TWL4030 failed to configure resource\n");
-	return err;
 }
 
 static int twl4030_power_remove(struct platform_device *pdev)
-- 
1.7.5.4
