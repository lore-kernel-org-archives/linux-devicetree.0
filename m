From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] DT: export of_irq_to_resource_table()
Date: Sun, 26 Aug 2012 09:13:09 +0200
Message-ID: <1345965189-14548-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Trivial patch that exports the of_irq_to_resource_table() symbol so that
modules can use it.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 drivers/of/irq.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index ff8ab7b..a23ec77 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -392,6 +392,7 @@ int of_irq_to_resource_table(struct device_node *dev, struct resource *res,
 
 	return i;
 }
+EXPORT_SYMBOL_GPL(of_irq_to_resource_table);
 
 struct intc_desc {
 	struct list_head	list;
-- 
1.7.9.1
