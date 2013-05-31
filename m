From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH V3] irqchip: Add TB10x interrupt controller driver
Date: Fri, 31 May 2013 19:32:34 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1305311835040.2905@ionos>
References: <20130530211944.05F4D3E0A90@localhost>
 <1370014348-21121-1-git-send-email-christian.ruppert@abilis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370014348-21121-1-git-send-email-christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
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
To: Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
Cc: Pierrick Hascoet <pierrick.hascoet-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 31 May 2013, Christian Ruppert wrote:

> The SOC interrupt controller driver for the Abilis Systems TB10x series of
> SOCs based on ARC700 CPUs.
> 
> This patch depends on commits eb76bdd407d8a90e59a06cb0158886df390e5d1c and
> 712bc93df9e7f14b8a163148d2aa7c778e151627 from branch irq/for-arm of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git.

That branch can be pulled into ARC as well. It only contains the
changes, which are necessary for the irq domain support of the generic
irq chip.

> +static void tb10x_irq_cascade(unsigned int irq, struct irq_desc *desc)
> +{
> +	struct irq_domain *domain = irq_desc_get_handler_data(desc);
> +
> +	generic_handle_irq(irq_find_mapping(domain, irq));
> +}

...

> +	for (i = 0; i < nrirqs; i++) {
> +		unsigned int irq = irq_of_parse_and_map(ictl, i);
> +
> +		irq_set_handler_data(irq, domain);
> +		irq_set_chained_handler(irq, tb10x_irq_cascade);
> +	}

I might be completely confused, but this does not make any sense at
all.

You allocate a linear domain and then map the interrupts in the
domain. The mapping function retrieves the hardware interrupt number
and creates a virtual interrupt number, installs the chip and the
handler for the interrupt and finally returns the virtual interrupt
number.

Now you take that virtual interrupt number and install
tb10x_irq_cascade as the handler. irq_set_chained_handler() will
startup (unmask) the interrupt right away.

In the cascade handler you take the virtual interrupt number, which
you get as argument, and find the mapping, i.e. the matching VIRTUAL
interrupt number for the VIRTUAL interrupt number and then call the
handler.

How is this supposed to work?

Thanks,

	tglx
