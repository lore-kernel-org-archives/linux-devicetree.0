From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/irq: Drop obsolete 'interrupts' vs
 'interrupts-extended' text
Date: Mon, 3 Nov 2014 10:14:28 -0800
Message-ID: <20141103181428.GH23619@ld-irv-0074>
References: <20141101233531.4958.96713.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141101233531.4958.96713.stgit-1RhO1Y9PlrlHTL0Zs8A6p/gx64E7kk8eUsxypvmhUTTZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 01, 2014 at 05:35:31PM -0600, Bjorn Helgaas wrote:
> a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' property
> first") updated the description to say that:
> 
>   - Both 'interrupts' and 'interrupts-extended' may be present
>   - Software should prefer 'interrupts-extended'
>   - Software that doesn't comprehend 'interrupts-extended' may use
>     'interrupts'
> 
> But there is still a paragraph at the end that prohibits having both and
> says 'interrupts' should be preferred.
> 
> Remove the contradictory text.
> 
> Fixes: a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' property first")
> Signed-off-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> CC: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org	# v3.13+

Acked-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks for noticing.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
