From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [RFC PATCH] irq: add irq_domain translation infrastructure
Date: Mon, 27 Jun 2011 11:00:59 +0200
Message-ID: <20110627090059.GA31287@linutronix.de>
References: <20110526065438.23444.69386.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110526065438.23444.69386.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Grant Likely | 2011-05-26 00:54:38 [-0600]:

>diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
>index 39645b6..9891cd4 100644
>--- a/arch/x86/kernel/devicetree.c
>+++ b/arch/x86/kernel/devicetree.c
>@@ -371,36 +321,49 @@ static struct of_ioapic_type of_ioapic_type[] =
> 	},
> };
> 
>-static int ioapic_xlate(struct irq_domain *id, const u32 *intspec, u32 intsize,
>-			u32 *out_hwirq, u32 *out_type)
>+static int ioapic_dt_translate(struct irq_domain *domain,
>+				struct device_node *controller,
>+				const u32 *intspec, u32 intsize,
>+				irq_hw_number_t *out_hwirq, u32 *out_type)
> {
>-	struct mp_ioapic_gsi *gsi_cfg;
> 	struct io_apic_irq_attr attr;
> 	struct of_ioapic_type *it;
> 	u32 line, idx, type;
>+	int rc;
> 
>-	if (intsize < 2)
>+	if (controller != domain->of_node)
> 		return -EINVAL;

Is there a reason not havining the (controller != domain->of_node) check
in irq_create_of_mapping()?

Sebastian
