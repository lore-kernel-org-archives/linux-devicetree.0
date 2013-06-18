From: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Subject: [PATCH v2 2/5] mfd: twl4030-power: Simplify probing of power scripts
 and resources
Date: Tue, 18 Jun 2013 15:17:57 +0200
Message-ID: <1371561480-28325-3-git-send-email-florian.vaussard@epfl.ch>
References: <1371561480-28325-1-git-send-email-florian.vaussard@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371561480-28325-1-git-send-email-florian.vaussard-p8DiymsW2f8@public.gmane.org>
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
Cc: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Increase lisibility when probing power scripts and resources by
creating dedicated functions.

Signed-off-by: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
---
 drivers/mfd/twl4030-power.c |   60 ++++++++++++++++++++++++++++--------------
 1 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/twl4030-power.c b/drivers/mfd/twl4030-power.c
index 7ade81b..8fa6c7b 100644
--- a/drivers/mfd/twl4030-power.c
+++ b/drivers/mfd/twl4030-power.c
@@ -492,6 +492,39 @@ int twl4030_remove_script(u8 flags)
 	return err;
 }
 
+int twl4030_power_configure_scripts(struct twl4030_power_data *pdata)
+{
+	int err;
+	int i;
+	u8 address = twl4030_start_script_address;
+
+	for (i = 0; i < pdata->num; i++) {
+		err = load_twl4030_script(pdata->scripts[i], address);
+		if (err)
+			return err;
+		address += pdata->scripts[i]->size;
+	}
+
+	return 0;
+}
+
+int twl4030_power_configure_resources(struct twl4030_power_data *pdata)
+{
+	struct twl4030_resconfig *resconfig = pdata->resource_config;
+	int err;
+
+	if (resconfig) {
+		while (resconfig->resource) {
+			err = twl4030_configure_resource(resconfig);
+			if (err)
+				return err;
+			resconfig++;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * In master mode, start the power off sequence.
  * After a successful execution, TWL shuts down the power to the SoC
@@ -511,9 +544,7 @@ int twl4030_power_probe(struct platform_device *pdev)
 {
 	struct twl4030_power_data *pdata = pdev->dev.platform_data;
 	int err = 0;
-	int i;
-	struct twl4030_resconfig *resconfig;
-	u8 val, address = twl4030_start_script_address;
+	u8 val;
 
 	err = twl_i2c_write_u8(TWL_MODULE_PM_MASTER, TWL4030_PM_MASTER_KEY_CFG1,
 			       TWL4030_PM_MASTER_PROTECT_KEY);
@@ -525,23 +556,12 @@ int twl4030_power_probe(struct platform_device *pdev)
 	if (err)
 		goto unlock;
 
-	for (i = 0; i < pdata->num; i++) {
-		err = load_twl4030_script(pdata->scripts[i], address);
-		if (err)
-			goto load;
-		address += pdata->scripts[i]->size;
-	}
-
-	resconfig = pdata->resource_config;
-	if (resconfig) {
-		while (resconfig->resource) {
-			err = twl4030_configure_resource(resconfig);
-			if (err)
-				goto resource;
-			resconfig++;
-
-		}
-	}
+	err = twl4030_power_configure_scripts(pdata);
+	if (err)
+		goto load;
+	err = twl4030_power_configure_resources(pdata);
+	if (err)
+		goto resource;
 
 	/* Board has to be wired properly to use this feature */
 	if (pdata->use_poweroff && !pm_power_off) {
-- 
1.7.5.4
