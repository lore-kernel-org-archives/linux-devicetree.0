From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [sodaville] [PATCH 10/15] x86/ioapic: Add OF bindings for	IO-APIC
Date: Thu, 13 Jan 2011 11:38:48 +0100
Message-ID: <20110113103848.GA23275@www.tglx.de>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	<1292600033-12271-11-git-send-email-bigeasy@linutronix.de>
	<20110111235353.GG2131@angua.secretlab.ca>
	<20110112170707.GA6907@www.tglx.de>
	<4D2DE2B9.2000607@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D2DE2B9.2000607-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

* H. Peter Anvin | 2011-01-12 09:19:53 [-0800]:

>On 01/12/2011 09:07 AM, Sebastian Andrzej Siewior wrote:
>>>
>>> I'm confused here.  Are there multiple ioapic's described by a single
>>> device tree node?
>
>That's normal multiple IOAPIC behavior (and multiple IOAPICs is a common
>thing), but why use the same device tree node for both?

I'm sorry, I miss understood Grant's question. The two io apics in the
system are described by two nodes. ioapic_add_ofnode() is called for one
node:

> +     for (i = 0; i < nr_ioapics; i++) {
> +             if (r.start == mp_ioapics[i].apicaddr) {
> +                     struct irq_domain *id;
> +
> +                     mp_of_ioapic[i].node = np;
> +                     id = kzalloc(sizeof(*id), GFP_KERNEL);
> +                     BUG_ON(!id);
> +                     id->controller = np;
> +                     id->xlate = ioapic_xlate;
> +                     id->priv = (void *)i;
> +                     add_interrupt_host(id);
> +                     return;
> +             }

and once it matches the previously registered io apic it calls
add_interrupt_host() on it and returns. x86_add_irq_domains() calls it
for every io apic node so it calls add_interrupt_host() twice.

>	-hpa

Sebastian
