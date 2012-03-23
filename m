From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH] mtd: fsmc-nand: Update compatible property
Date: Fri, 23 Mar 2012 14:15:32 +0530
Message-ID: <2667979af077daa0f1bff81db7e25f5c8157b4bc.1332492218.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: sr-ynQEQJNshbs@public.gmane.org, artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

FSMC NAND driver can verify device version by itself and so we wouldn't be
required to have separate .compatible entries for different SPEAr SoCs.

Thus this patch updates compatible entry to: "st,spear-fsmc-nand", so that it
works for all SPEAr machines.

Signed-off-by: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/mtd/fsmc-nand.txt          |    4 ++--
 drivers/mtd/nand/fsmc_nand.c                       |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
index e2c663b..7551600 100644
--- a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
@@ -1,7 +1,7 @@
 * FSMC NAND
 
 Required properties:
-- compatible : "st,spear600-fsmc-nand"
+- compatible : "st,spear-fsmc-nand"
 - reg : Address range of the mtd chip
 - reg-names: Should contain the reg names "fsmc_regs" and "nand_data"
 - st,ale-off : Chip specific offset to ALE
@@ -15,7 +15,7 @@ Optional properties:
 Example:
 
 	fsmc: flash@d1800000 {
-		compatible = "st,spear600-fsmc-nand";
+		compatible = "st,spear-fsmc-nand";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0xd1800000 0x1000	/* FSMC Register */
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 1b8330e..ecb103e 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1231,7 +1231,7 @@ static SIMPLE_DEV_PM_OPS(fsmc_nand_pm_ops, fsmc_nand_suspend, fsmc_nand_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id fsmc_nand_id_table[] = {
-	{ .compatible = "st,spear600-fsmc-nand" },
+	{ .compatible = "st,spear-fsmc-nand" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsmc_nand_id_table);
-- 
1.7.8.110.g4cb5d
