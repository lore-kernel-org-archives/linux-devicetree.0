From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv2 08/16] clk: mvebu: add suspend/resume for gatable
 clocks
Date: Fri, 21 Nov 2014 09:59:54 +0100
Message-ID: <20141121095954.5f708f54@free-electrons.com>
References: <1415978496-9334-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1415978496-9334-9-git-send-email-thomas.petazzoni@free-electrons.com>
	<20141117224604.25314.96198@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141117224604.25314.96198@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Mike Turquette,

On Mon, 17 Nov 2014 14:46:04 -0800, Mike Turquette wrote:
> Quoting Thomas Petazzoni (2014-11-14 07:21:28)
> > This commit adds suspend/resume support for the gatable clock driver
> > used on Marvell EBU platforms. When getting out of suspend, the
> > Marvell EBU platforms go through the bootloader, which re-enables all
> > gatable clocks. However, upon resume, the clock framework will not
> > disable again all gatable clocks that are not used.
> > 
> > Therefore, if the clock driver does not save/restore the state of the
> > gatable clocks, all gatable clocks that are not claimed by any device
> > driver will remain enabled after a resume. This is why this driver
> > saves and restores the state of those clocks.
> 
> It might be a good idea to call clk_disable_unused() from the clk core
> after resuming from suspend.

Yes, this might be an interesting clk core improvement.

> > @@ -177,14 +178,18 @@ struct clk_gating_ctrl {
> >         spinlock_t *lock;
> >         struct clk **gates;
> >         int num_gates;
> > +       struct syscore_ops syscore_ops;
> 
> You are registering suspend/resume ops per clock. Have you considered
> registering a single set of ops for your clock controller driver? See
> drivers/clk/samsung/clk-exynos5420.c for an example.
> 
> Combined with a table of clocks registered by your driver, centralized
> suspend/resume methods might be a cleaner solution.

Ok, I've changed. To be honest, I don't think it makes much change: if
we had two instances of a gatable clock controller, then we would have
two calls to mvebu_clk_gating_setup(), which would register twice the
same syscore_ops. But we were anyway already assuming that we have
already one instance of a gatable clock controller, since the
syscore_ops operation implementation already used a global pointer to
the gatable clock controller.

Will be part of the upcoming v3.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
