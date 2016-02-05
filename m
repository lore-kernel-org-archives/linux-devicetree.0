From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: r8a7795: Add L2 cache-controller nodes
Date: Fri, 5 Feb 2016 10:57:59 +0100
Message-ID: <20160205095758.GE16556@verge.net.au>
References: <1452953856-5146-1-git-send-email-dirk.behme@gmail.com>
 <56B2370D.2010102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56B2370D.2010102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

[CC new linux-renesas-soc ML]

Hi Dirk,

On Wed, Feb 03, 2016 at 06:21:17PM +0100, Dirk Behme wrote:
> On 16.01.2016 15:17, Dirk Behme wrote:
> >From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >
> >Add device nodes for the L2 caches, and link the CPU node to its L2
> >cache node.
> >
> >The L2 cache for the Cortex-A57 CPU cores is 2 MiB large (organized as
> >128 KiB x 16 ways).
> >
> >Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >Signed-off-by: Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

[snip]

> Any further comments to this? If not, could this be applied?

Sorry for the delay.

This looks good; I have queued it up.

It should appear in the next (and devel) branches of my renesas tree soon.
And in linux-next whenever it includes my updated next branch.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
