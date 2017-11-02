From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: shmobile: Document Renesas M3-W-based
 Salvator-XS board DT bindings
Date: Thu, 2 Nov 2017 08:58:25 +0100
Message-ID: <20171102075825.3hiqwfbxjpqmeayp@verge.net.au>
References: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
 <1509384599-28953-2-git-send-email-geert+renesas@glider.be>
 <20171101214904.b5adavvirlmphnqn@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171101214904.b5adavvirlmphnqn@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 01, 2017 at 04:49:04PM -0500, Rob Herring wrote:
> On Mon, Oct 30, 2017 at 06:29:57PM +0100, Geert Uytterhoeven wrote:
> > The Renesas Salvator-XS (Salvator-X 2nd version) development board can
> > be equipped with either an R-Car H3 ES2.0 or M3-W ES1.x SiP, which are
> > pin-compatible.
> > 
> > Document board part number and compatible values for the version with
> > R-Car M3-W.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks, applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
