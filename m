From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/2] regulator: of: Added a property to indicate bypass mode
 support
Date: Thu, 20 Jun 2013 14:07:37 +0530
Message-ID: <1371717458-10307-2-git-send-email-kishon@ti.com>
References: <1371717458-10307-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371717458-10307-1-git-send-email-kishon-l0cyMroinI0@public.gmane.org>
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
To: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Added a property to indicate if the regulator supports bypass mode.
Also modified of_get_regulation_constraints() to check for that
property and set appropriate constraints.

Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/regulator.txt |    1 +
 drivers/regulator/of_regulator.c                          |    3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index ecfc6cc..48a3b8e 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -9,6 +9,7 @@ Optional properties:
 - regulator-max-microamp: largest current consumers may set
 - regulator-always-on: boolean, regulator should never be disabled
 - regulator-boot-on: bootloader/firmware enabled regulator
+- regulator-allow-bypass: allow the regulator to go into bypass mode
 - <name>-supply: phandle to the parent supply/regulator node
 - regulator-ramp-delay: ramp delay for regulator(in uV/uS)
 
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 66ca769..f3c8f8f 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -61,6 +61,9 @@ static void of_get_regulation_constraints(struct device_node *np,
 	else /* status change should be possible if not always on. */
 		constraints->valid_ops_mask |= REGULATOR_CHANGE_STATUS;
 
+	if (of_property_read_bool(np, "regulator-allow-bypass"))
+		constraints->valid_ops_mask |= REGULATOR_CHANGE_BYPASS;
+
 	ramp_delay = of_get_property(np, "regulator-ramp-delay", NULL);
 	if (ramp_delay)
 		constraints->ramp_delay = be32_to_cpu(*ramp_delay);
-- 
1.7.10.4
