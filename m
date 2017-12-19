From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: display: panel: Fix compatible string for
 Toshiba LT089AC29000
Date: Tue, 19 Dec 2017 17:40:43 -0600
Message-ID: <20171219234043.v6tbfhokxex6crun@rob-hp-laptop>
References: <20171217023433.11542-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171217023433.11542-1-j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 17, 2017 at 03:34:33AM +0100, Jonathan Neuschäfer wrote:
> The compatible string for this panel was specified as
> toshiba,lt089ac29000.txt. I believe this is a mistake.
> 
> Fixes: 06e733e41f87 ("drm/panel: simple: add Toshiba LT089AC19000")
> Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer-hi6Y0CQ0nG0@public.gmane.org>
> ---
>  .../devicetree/bindings/display/panel/toshiba,lt089ac29000.txt          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Rob

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
