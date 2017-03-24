From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: add power-domains to sdhi
Date: Fri, 24 Mar 2017 08:02:28 +0100
Message-ID: <20170324070228.GI1319@verge.net.au>
References: <20170209133803.21539-1-chris.brandt@renesas.com>
 <CAMuHMdXRD3o7KdaADvPYxzeuEVo44nRVWHfCverPc+9s=0owPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXRD3o7KdaADvPYxzeuEVo44nRVWHfCverPc+9s=0owPA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 02:25:04PM +0100, Geert Uytterhoeven wrote:
> (this time reply-to-all)
> 
> On Thu, Feb 9, 2017 at 2:38 PM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> > Reported-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> > Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> > Fixes: 66474697923c ("ARM: dts: r7s72100: add sdhi to device tree")
> 
> Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Thanks, I have queued this up for v4.12.

The fixes tag above indicates this is a fix for v4.10, however, when I
tried to apply it on top of v4.11-rc1 there was a conflict.  So I think a
backport will be required if we want it to be considered for v4.11 and be
considered for and in turn v4.10-stable.

This makes things a bit messy with regards to conflicts between v4.11 and
v4.12 and I'm inclined to pass on the backport.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
