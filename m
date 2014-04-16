From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 1/6] mfd: arizona: Factor out read of device tree GPIOs
Date: Wed, 16 Apr 2014 10:01:37 +0100
Message-ID: <1397638902-7576-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1397638902-7576-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397638902-7576-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, sameo@linux.intel.com, lee.jones@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ckeepax@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

This patch factors out the reading of GPIOs for the Arizona devices
into a helper function.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/mfd/arizona-core.c       |   31 ++++++++++++++++++++++---------
 include/linux/mfd/arizona/core.h |    3 +++
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 1c3ae57..37b5e14 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -508,19 +508,32 @@ int arizona_of_get_type(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(arizona_of_get_type);
 
+int arizona_of_get_named_gpio(struct arizona *arizona, const char *prop,
+			      bool mandatory)
+{
+	int gpio;
+
+	gpio = of_get_named_gpio(arizona->dev->of_node, prop, 0);
+	if (gpio < 0) {
+		if (mandatory)
+			dev_err(arizona->dev,
+				"Mandatory DT gpio %s missing/malformed: %d\n",
+				prop, gpio);
+
+		gpio = 0;
+	}
+
+	return gpio;
+}
+EXPORT_SYMBOL_GPL(arizona_of_get_named_gpio);
+
 static int arizona_of_get_core_pdata(struct arizona *arizona)
 {
+	struct arizona_pdata *pdata = &arizona->pdata;
 	int ret, i;
 
-	arizona->pdata.reset = of_get_named_gpio(arizona->dev->of_node,
-						 "wlf,reset", 0);
-	if (arizona->pdata.reset < 0)
-		arizona->pdata.reset = 0;
-
-	arizona->pdata.ldoena = of_get_named_gpio(arizona->dev->of_node,
-						  "wlf,ldoena", 0);
-	if (arizona->pdata.ldoena < 0)
-		arizona->pdata.ldoena = 0;
+	pdata->reset = arizona_of_get_named_gpio(arizona, "wlf,reset", true);
+	pdata->ldoena = arizona_of_get_named_gpio(arizona, "wlf,ldoena", true);
 
 	ret = of_property_read_u32_array(arizona->dev->of_node,
 					 "wlf,gpio-defaults",
diff --git a/include/linux/mfd/arizona/core.h b/include/linux/mfd/arizona/core.h
index 5cf8b91..6d9371f 100644
--- a/include/linux/mfd/arizona/core.h
+++ b/include/linux/mfd/arizona/core.h
@@ -124,4 +124,7 @@ int wm5102_patch(struct arizona *arizona);
 int wm5110_patch(struct arizona *arizona);
 int wm8997_patch(struct arizona *arizona);
 
+extern int arizona_of_get_named_gpio(struct arizona *arizona, const char *prop,
+				     bool mandatory);
+
 #endif
-- 
1.7.2.5
