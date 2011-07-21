From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of/irq: use of_find_property() to check for
	interrupt-controller
Date: Thu, 21 Jul 2011 15:22:42 +0100 (BST)
Message-ID: <20110721142242.AD1029D401C@zog.reactivated.net>
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
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The interrupt-controller property is used as a marker with no value.
This check should check for existence of the property, rather than for
a non-NULL property value.

On the OLPC XO-1.5, this marker property exists in the correct place
but was not being picked up due to having no value. Using
of_find_property() avoids this issue.

Signed-off-by: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
---
 drivers/of/irq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 9f689f1..f86cc43 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -155,7 +155,7 @@ int of_irq_map_raw(struct device_node *parent, const __be32 *intspec,
 		/* Now check if cursor is an interrupt-controller and if it is
 		 * then we are done
 		 */
-		if (of_get_property(ipar, "interrupt-controller", NULL) !=
+		if (of_find_property(ipar, "interrupt-controller", NULL) !=
 				NULL) {
 			pr_debug(" -> got it !\n");
 			for (i = 0; i < intsize; i++)
-- 
1.7.6
