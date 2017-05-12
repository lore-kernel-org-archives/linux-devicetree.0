From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/11] dt-bindings: clk: Extend binding doc for Stingray
 SOC
Date: Fri, 12 May 2017 10:21:34 -0500
Message-ID: <20170512152134.tjuc5exo4plalujs@rob-hp-laptop>
References: <1494071686-19098-1-git-send-email-anup.patel@broadcom.com>
 <1494071686-19098-3-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1494071686-19098-3-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oza Pawandeep <oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, May 06, 2017 at 05:24:37PM +0530, Anup Patel wrote:
> From: Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> Update iproc clock dt-binding documentation with
> Stingray pll and clock details.
> 
> Signed-off-by: Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/clock/brcm,iproc-clocks.txt           | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
> index 6f66e9a..f2c5f0e4a 100644
> --- a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
> +++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
> @@ -219,3 +219,79 @@ BCM63138
>  --------
>  PLL and leaf clock compatible strings for BCM63138 are:
>      "brcm,bcm63138-armpll"
> +
> +Stingray
> +-----------
> +PLL and leaf clock compatible strings for Stingray are:
> +    "brcm,sr-genpll0"
> +    "brcm,sr-genpll1"
> +    "brcm,sr-genpll2"
> +    "brcm,sr-genpll3"
> +    "brcm,sr-genpll4"
> +    "brcm,sr-genpll5"
> +    "brcm,sr-genpll6"
> +
> +    "brcm,sr-lcpll0"
> +    "brcm,sr-lcpll1"
> +    "brcm,sr-lcpll-pcie"
> +
> +
> +The following table defines the set of PLL/clock index and ID for Stingray.
> +These clock IDs are defined in:
> +    "include/dt-bindings/clock/bcm-sr.h"

This header should be part of this commit. With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
