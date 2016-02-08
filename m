From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 6/7] [PATCH] MIPS: OCTEON: Add support for OCTEON III
 interrupt controller.
Date: Mon, 8 Feb 2016 11:38:43 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1602081137460.25254@nanos>
References: <1454632974-7686-1-git-send-email-ddaney.cavm@gmail.com> <1454632974-7686-7-git-send-email-ddaney.cavm@gmail.com> <alpine.DEB.2.11.1602050954480.25254@nanos> <56B4DA3B.40607@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B4DA3B.40607-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 5 Feb 2016, David Daney wrote:
> On 02/05/2016 01:06 AM, Thomas Gleixner wrote:
> > > +int octeon_irq_ciu3_xlat(struct irq_domain *d,
> > 
> > static ?
> 
> To be used in follow-on patch for MSI-X irq_chip driver residing in a separate
> file.
> 
> The idea was to not be changing the to/from static multiple times as the new
> patches were merged.  If you think it preferable, I can make them all static
> and then remove the static later, when needed.

Nah. It was just not clear from reading this patch. A hint in the changelog
might be helpful.
 
Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
