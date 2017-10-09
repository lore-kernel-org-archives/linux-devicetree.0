From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2 0/2] ARM: dts: iwg20d-q7: New DT architecture
Date: Mon, 9 Oct 2017 09:30:11 +0200
Message-ID: <20171009073011.GR17360@verge.net.au>
References: <CAMuHMdW-Y7tK28YAGBRMqdgZK7vVqnUcud1FtzQd6wLrKii_AA@mail.gmail.com>
 <1507312793-6877-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507312793-6877-1-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 06, 2017 at 06:59:51PM +0100, Fabrizio Castro wrote:
> Some of the serial interfaces are exposed on the camera daughter board.
> The camera daughter board can be connected to the carrier board
> by means of expansion connectors 1, 2 and 3. The carrier board may host
> an RZ/G1M or an RZ/G1N based SoM.
> While adding support for the serial interfaces on the camera daughter
> board we faced the dilemma of how to properly describe all of the
> possible HW configurations and how to maximize code reuse.
> The best option would be to use device tree overlays, however there is
> still some work to be done on that front before actually using them,
> therefore for the time being we decided to provide .dtsi files to
> describe the carrier board and the camera daughter board, and provide
> .dts files to describe the HW configurations we need to support.
> 
> Best regards,
> 
> Fabrizio Castro (2):
>   ARM: dts: iwg20d-q7: Rework DT architecture
>   ARM: dts: iwg20d-q7-dbcm-ca: Add device trees for camera DB

Thanks, applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
