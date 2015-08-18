From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: [PATCH] regulator: Introduce property to flag set-load support
Date: Tue, 18 Aug 2015 15:14:06 -0700
Message-ID: <1439936046-5289-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Introduce "regulator-allow-set-load" property to make it possible to
flag in the board configuration that a regulator is allowed to have the
load requirements changed.

Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 1 +
 drivers/regulator/of_regulator.c                          | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 24bd422cecd5..1d112fc456aa 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -11,6 +11,7 @@ Optional properties:
 - regulator-always-on: boolean, regulator should never be disabled
 - regulator-boot-on: bootloader/firmware enabled regulator
 - regulator-allow-bypass: allow the regulator to go into bypass mode
+- regulator-allow-set-load: allow the regulator performance level to be configured
 - <name>-supply: phandle to the parent supply/regulator node
 - regulator-ramp-delay: ramp delay for regulator(in uV/uS)
   For hardware which supports disabling ramp rate, it should be explicitly
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 250700c853bf..499e437c7e91 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -76,6 +76,9 @@ static void of_get_regulation_constraints(struct device_node *np,
 	if (of_property_read_bool(np, "regulator-allow-bypass"))
 		constraints->valid_ops_mask |= REGULATOR_CHANGE_BYPASS;
 
+	if (of_property_read_bool(np, "regulator-allow-set-load"))
+		constraints->valid_ops_mask |= REGULATOR_CHANGE_DRMS;
+
 	ret = of_property_read_u32(np, "regulator-ramp-delay", &pval);
 	if (!ret) {
 		if (pval)
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
