From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH ] ARM: dts: iwg20d-q7: Add chosen node
Date: Tue, 22 Aug 2017 10:07:35 +0200
Message-ID: <20170822080735.GH30838@verge.net.au>
References: <1503075488-44304-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1503075488-44304-1-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 18, 2017 at 05:58:08PM +0100, Biju Das wrote:
> Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
> This patch tested against renesas-dev tag renesas-devel-20170815-v4.13-rc5

Thanks, I have applied this for v4.15.

There was some fuzz when applying this patch.
Please check that it is correct when I have pushed today's devel tag to
the renesas tree.

> 
>  arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
> index 081af01..305a6a1 100644
> --- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
> +++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
> @@ -19,6 +19,11 @@
>  		serial0 = &scif0;
>  		ethernet0 = &avb;
>  	};
> +
> +	chosen {
> +		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
> +		stdout-path = "serial0:115200n8";
> +	};
>  };
>  
>  &pfc {
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
