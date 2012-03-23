From: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH] mtd: spear-smi: Update compatible property
Date: Fri, 23 Mar 2012 14:18:07 +0530
Message-ID: <97859bb4d86d008968a784339be8567094c487a1.1332492461.git.viresh.kumar@st.com>
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

SPEAr SMI controller version is same for all SPEAr machines. Thus we don't need
per machine compatible property in driver.

Thus this patch updates compatible entry to: "st,spear-smi", so that it
works for all SPEAr machines.

Signed-off-by: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/mtd/spear_smi.txt          |    4 ++--
 drivers/mtd/devices/spear_smi.c                    |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/spear_smi.txt b/Documentation/devicetree/bindings/mtd/spear_smi.txt
index 7248aad..80dfd96 100644
--- a/Documentation/devicetree/bindings/mtd/spear_smi.txt
+++ b/Documentation/devicetree/bindings/mtd/spear_smi.txt
@@ -1,7 +1,7 @@
 * SPEAr SMI
 
 Required properties:
-- compatible : "st,spear600-smi"
+- compatible : "st,spear-smi"
 - reg : Address range of the mtd chip
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
@@ -16,7 +16,7 @@ Optional properties:
 Example:
 
 	smi: flash@fc000000 {
-		compatible = "st,spear600-smi";
+		compatible = "st,spear-smi";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		reg = <0xfc000000 0x1000>;
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index bebce11..f392594 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -1113,7 +1113,7 @@ int spear_smi_resume(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id spear_smi_id_table[] = {
-	{ .compatible = "st,spear600-smi" },
+	{ .compatible = "st,spear-smi" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, spear_smi_id_table);
-- 
1.7.8.110.g4cb5d
