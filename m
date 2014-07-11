From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 10/13] [RFC] ARM: dts: Add shmobile platform device tree
 bindings documentation
Date: Fri, 11 Jul 2014 17:09:22 +0200
Message-ID: <20140711150921.GA1777@verge.net.au>
References: <1404908623-909-1-git-send-email-geert+renesas@glider.be>
 <1404908623-909-11-git-send-email-geert+renesas@glider.be>
 <20140711091720.GO12420@verge.net.au>
 <CAMuHMdXP6GfO7OEnXU8x4Sn5j8_tA2nnrFANr1sriB-B4BYoOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXP6GfO7OEnXU8x4Sn5j8_tA2nnrFANr1sriB-B4BYoOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 11, 2014 at 04:26:03PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Jul 11, 2014 at 11:17 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> > On Wed, Jul 09, 2014 at 02:23:40PM +0200, Geert Uytterhoeven wrote:
> >> Add Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
> >> Documentation, listing supported SoCs and boards.
> >>
> >> This allows to use checkpatch to validate DTSes referring to Renesas
> >> shmobile SoCs, and boards containing those SoCs.
> >>
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >
> > Thanks Geert,
> >
> > from my point of view this seems nice. Is there a reason it is marked as an RFC?
> 
> >From the cover letter:
> 
> "The last 4 patches contain compatible strings for new R-Car Gen2 SoCs,
>  which are not yet in active use, hence the RFC status."

Thanks, sorry for missing that.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
