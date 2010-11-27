From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 04/11] x86/dtb: add irq host abstraction
Date: Fri, 26 Nov 2010 21:11:52 -0600
Message-ID: <E1PMBCa-0007l1-1V@jdl.com>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-5-git-send-email-bigeasy@linutronix.de>
	<E1PLhWV-0004y7-44@jdl.com> <4CEFC1EC.7030507@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <4CEFC1EC.7030507-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Jon Loeliger wrote:
> 
> >> +struct irq_host {
> >> +	int (*xlate)(struct irq_host *h, const u32 *intspec, u32 intsize,
> >> +			u32 *out_hwirq, u32 *out_type);
> >> +	void *priv;
> >> +	struct device_node *controller;
> >> +	struct list_head l;
> >> +};
> > 
> > I thought there was an intent and desire to rename the irq_host
> > as irq_domain.
> > 
> > jdl
> 
> AFAIK Benh was thinking about renaming it. I don't know if this is
> still the case or when he intends to do so.

I submitted a first version of that patch already.
I thought we were waiting on gkh's patches to go upstream
before re-submitting the next version of that patch.
If we're ready to proceed with that, we can rebase it
and re-submit it too.

> Once he does so, this can be renamed as well.

Hrm.  Well, let's ask Ben what order he wants to do...?

jdl
