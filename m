From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 0/2] arm64: renesas: Add support for R-Car V3M
Date: Wed, 30 Aug 2017 09:26:45 +0200
Message-ID: <20170830072644.GI10398@verge.net.au>
References: <1503665810-13945-1-git-send-email-geert+renesas@glider.be>
 <20170828074453.GA22421@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170828074453.GA22421-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 28, 2017 at 09:44:54AM +0200, Simon Horman wrote:
> On Fri, Aug 25, 2017 at 02:56:48PM +0200, Geert Uytterhoeven wrote:
> > 	Hi all,
> > 
> > This patch series adds initial R-Car V3M infrastructure:
> >   1. SoC DT bindings,
> >   2. Main Kconfig symbol.
> > 
> > Both follow the example set by R-Car D3 aka r8a77995, using 5-digit instead
> > of 4-digit part numbers.
> > Alternatively, we could stick to 4-digit part numbers if the fifth digit is
> > a zero.
> > 
> > For your convenience, a branch with more preliminary work (thanks Sergei,
> > for posting the clock driver!) for testing on v3m/eagle is also available
> > in the topic/r8a77970-integration branch of my renesas-drivers git
> > repository at
> > git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
> > 
> > Thanks for your comments!
> 
> This looks good to me.
> 
> I am in favour of using the 5-digit scheme for all new R-Car Gen 3 SoCs
> as it seems the safest option with regards to as yet unknown (to me) part
> numbers.

Geert, any objections to me applying these?
I'm happy to wait longer if you prefer.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
