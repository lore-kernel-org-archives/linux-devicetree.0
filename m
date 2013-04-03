From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH/RFC 1/2] irqchip: renesas-intc-irqpin: DT binding for sense
 bitfield width
Date: Wed, 3 Apr 2013 11:19:03 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1304031112170.10531@axis700.grange>
References: <Pine.LNX.4.64.1304031103590.10531@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.1304031103590.10531-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
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
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Most Renesas irqpin controllers have 4-bit sense fields, however, some
have different widths. This patch adds a DT binding to optionally
specify such non-standard values.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../interrupt-controller/renesas,intc-irqpin.txt   |    2 ++
 drivers/irqchip/irq-renesas-intc-irqpin.c          |    5 ++++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
index e55d183..6b48742 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
@@ -11,3 +11,5 @@ Optional properties:
   resource allocation properties
 - control-parent: disable and enable interrupts on the parent interrupt
   controller, needed for some broken implementations
+- sense-bitfield-width: width of a single sense bitfield in the SENSE register,
+  if different from the default 4 bits
diff --git a/drivers/irqchip/irq-renesas-intc-irqpin.c b/drivers/irqchip/irq-renesas-intc-irqpin.c
index 82bbe8f..6aadfe6 100644
--- a/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ b/drivers/irqchip/irq-renesas-intc-irqpin.c
@@ -381,9 +381,12 @@ static int intc_irqpin_probe(struct platform_device *pdev)
 	for (k = 0; k < p->number_of_irqs; k++)
 		intc_irqpin_mask_unmask_prio(p, k, 1);
 
-	if (!pdata)
+	if (!pdata) {
 		p->config.control_parent = of_property_read_bool(pdev->dev.of_node,
 								 "control-parent");
+		of_property_read_u32(pdev->dev.of_node, "sense-bitfield-width",
+				     &p->config.sense_bitfield_width);
+	}
 
 	/* use more severe masking method if requested */
 	if (p->config.control_parent) {
-- 
1.7.2.5
