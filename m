From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv2 6/8] regulator: isl9305: deprecate use of isl in compatible string for isil
Date: Tue, 16 Dec 2014 22:20:50 +0100
Message-ID: <50335b337738057806dbe5f3171dedd6f84b9eda.1418763328.git.arno@natisbad.org>
References: <cover.1418763328.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1418763328.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


"isil" and "isl" prefixes are used at various locations inside the kernel
to reference Intersil corporation. This patch is part of a series fixing
those locations were "isl" is used in compatible strings to use the now
expected "isil" prefix instead (NASDAQ symbol for Intersil and most used
version). The old compatible string is kept for backward compatibility.

Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/isl9305.txt | 4 ++--
 drivers/regulator/isl9305.c                             | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/isl9305.txt b/Documentation/devicetree/bindings/regulator/isl9305.txt
index a626fc1bbf0d..d6e7c9ec9413 100644
--- a/Documentation/devicetree/bindings/regulator/isl9305.txt
+++ b/Documentation/devicetree/bindings/regulator/isl9305.txt
@@ -2,7 +2,7 @@ Intersil ISL9305/ISL9305H voltage regulator
 
 Required properties:
 
-- compatible: "isl,isl9305" or "isl,isl9305h"
+- compatible: "isil,isl9305" or "isil,isl9305h"
 - reg: I2C slave address, usually 0x68.
 - regulators: A node that houses a sub-node for each regulator within the
   device. Each sub-node is identified using the node's name, with valid
@@ -19,7 +19,7 @@ Optional properties:
 Example
 
 	pmic: isl9305@68 {
-		compatible = "isl,isl9305";
+		compatible = "isil,isl9305";
 		reg = <0x68>;
 
 		VINDCD1-supply = <&system_power>;
diff --git a/drivers/regulator/isl9305.c b/drivers/regulator/isl9305.c
index 92fefd98da58..6e3a15fe00f1 100644
--- a/drivers/regulator/isl9305.c
+++ b/drivers/regulator/isl9305.c
@@ -177,8 +177,10 @@ static int isl9305_i2c_probe(struct i2c_client *i2c,
 
 #ifdef CONFIG_OF
 static const struct of_device_id isl9305_dt_ids[] = {
-	{ .compatible = "isl,isl9305" },
-	{ .compatible = "isl,isl9305h" },
+	{ .compatible = "isl,isl9305" }, /* for backward compat., don't use */
+	{ .compatible = "isil,isl9305" },
+	{ .compatible = "isl,isl9305h" }, /* for backward compat., don't use */
+	{ .compatible = "isil,isl9305h" },
 	{},
 };
 #endif
-- 
2.1.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
