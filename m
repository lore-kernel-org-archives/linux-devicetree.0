From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 0/4] dts: rskrza1: Add pin configurations
Date: Thu, 27 Jul 2017 17:03:40 +0200
Message-ID: <20170727150339.GD16143@verge.net.au>
References: <20170720182019.85075-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170720182019.85075-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 20, 2017 at 01:20:15PM -0500, Chris Brandt wrote:
> Now that the RZ/A1 pin control driver has appeared in 4.13-rc1, it
> is safe to now add pin configurations for RZ/A1 boards.
> 
> 
> Chris Brandt (4):
>   arm: dts: rskrza1: Add SCIF2 pin group
>   arm: dts: rskrza1: Add Ethernet pin group
>   arm: dts: rskrza1: Add SDHI1 pin group
>   arm: dts: rskrza1: Add LED0 pin support
> 
>  arch/arm/boot/dts/r7s72100-rskrza1.dts | 61 ++++++++++++++++++++++++++++++++++

Thanks, applied for v4.14.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
