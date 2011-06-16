From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 03/11] dt/irq: add irq_domain_add_simple() helper
Date: Thu, 16 Jun 2011 09:04:51 -0500
Message-ID: <4DFA0D83.6070604@gmail.com>
References: <20110616042653.29371.2052.stgit@ponder>
	<20110616044141.29371.76366.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110616044141.29371.76366.stgit@ponder>
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
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grant,

On 06/15/2011 11:41 PM, Grant Likely wrote:
> irq_domain_add_simple() is an easy way to generate an irq translation
> domain for simple irq controllers.  It assumes a flat 1:1 mapping from
> hardware irq number to an offset of the first linux irq number assigned
> to the controller
> 
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
>  include/linux/irq.h    |   11 +++++++++
>  kernel/irq/irqdomain.c |   58 +++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 68 insertions(+), 1 deletions(-)
> 
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index a103c01..50830fc 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -797,6 +797,17 @@ extern unsigned int irq_domain_map(struct irq_domain *domain,
>  				   irq_hw_number_t hwirq);
>  extern void irq_domain_unmap(struct irq_domain *domain, irq_hw_number_t hw);
>  
> +struct of_device_id;
> +#ifdef CONFIG_OF
> +extern void irq_domain_add_simple(struct device_node *controller, int irq_base);
> +extern void irq_domain_generate_simple(struct of_device_id *match,

match should be const

> +					u64 phys_base, unsigned int irq_start);
> +#else

Empty function for irq_domain_add_simple?

> +static inline void irq_domain_generate_simple(struct of_device_id *match,
> +					u64 phys_base, unsigned int irq_start) { }
> +#endif
> +
> +

Rob
