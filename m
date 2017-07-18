From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v6 2/3] clk: gate: expose clk_gate_ops::is_enabled
Date: Tue, 18 Jul 2017 15:52:03 -0700
Message-ID: <20170718225203.GD18179@codeaurora.org>
References: <1500364414-10021-1-git-send-email-gabriel.fernandez@st.com>
 <1500364414-10021-3-git-send-email-gabriel.fernandez@st.com>
 <55bc0f3f-67ed-a15f-5b71-d87044fd5237@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55bc0f3f-67ed-a15f-5b71-d87044fd5237-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: gabriel.fernandez-qxv4g6HH51o@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrea.merello-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslaw.pietrzyk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org, gabriel.fernandez.st-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arvind Yadav <arvind.yadav.cs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/18, Vladimir Zapolskiy wrote:
> On 07/18/2017 10:53 AM, gabriel.fernandez-qxv4g6HH51o@public.gmane.org wrote:
> > From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
> >  }
> > +EXPORT_SYMBOL_GPL(clk_gate_is_enabled);
> >  
> >  const struct clk_ops clk_gate_ops = {
> >  	.enable = clk_gate_enable,
> > diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> > index c59c625..e9587ab 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -343,6 +343,7 @@ struct clk_hw *clk_hw_register_gate(struct device *dev, const char *name,
> >  		u8 clk_gate_flags, spinlock_t *lock);
> >  void clk_unregister_gate(struct clk *clk);
> >  void clk_hw_unregister_gate(struct clk_hw *hw);
> > +int clk_gate_is_enabled(struct clk_hw *hw);
> 
> Here the prefix does not reflect the type of its argument, it might be
> acceptable for a veiled function, but it is not wanted for the exported
> function. Something like clk_hw_gate_is_enabled() is expected here, but
> again, let's firstly come to an agreement, that the export is needed.
> 

I'd prefer clk_gate_is_enabled() as it's not a struct
clk_hw_gate, it's a struct clk_gate and there isn't any
requirement for function names to reflect the type of the
argument. That's what we have type analysis for.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
