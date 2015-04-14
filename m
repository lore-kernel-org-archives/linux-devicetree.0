From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 3/5] arm64: introduce CPU_OF_TABLES for cpu ops
 selection
Date: Tue, 14 Apr 2015 16:52:14 +0100
Message-ID: <20150414155214.GJ28709@leverpostej>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
 <1428601031-5366-4-git-send-email-galak@codeaurora.org>
 <3133453.Cys8lc6CAy@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3133453.Cys8lc6CAy@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Abhimanyu Kapur <abhimany-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 09, 2015 at 10:17:06PM +0100, Arnd Bergmann wrote:
> On Thursday 09 April 2015 12:37:09 Kumar Gala wrote:
> > @@ -67,4 +67,9 @@ extern const struct cpu_operations *cpu_ops[NR_CPUS];
> >  int __init cpu_read_ops(struct device_node *dn, int cpu);
> >  void __init cpu_read_bootcpu_ops(void);
> >  
> > +#define CPU_METHOD_OF_DECLARE(name, __ops)                             \
> > +       static const struct cpu_operations *__cpu_method_table_##name   \
> > +       __used __section(__cpu_method_of_table)                         \
> > +       = __ops;
> > +
> >  #endif /* ifndef __ASM_CPU_OPS_H */
> > 
> 
> I'd rather not add this, to avoid giving the appearance that platforms
> can just add another one here.

Likewise.

SMP bringup is always hairy, and giving the appearance that such code
should be hidden away somewhere (and missing critical review) is a bad
idea.

While this seemed like a good idea in the past for 32-bit, we've only
seen marginal decoupling, and very little in the way of actual semantics
defined for the enable-methods. Which effectively spreads implementation
details further rather than separating them from the interface.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
