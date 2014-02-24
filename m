From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2] dt/bindings: fsl-fec: add clock properties
Date: Mon, 24 Feb 2014 09:51:43 +0100
Message-ID: <20140224085143.GI3327@book.gsilab.sittig.org>
References: <1393206490-25234-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393206490-25234-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 24, 2014 at 09:48 +0800, Shawn Guo wrote:
> 
> Update fsl-fec.txt to add 'clocks' and 'clock-names' properties.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> Changes since v1:
>  - Leave compatible change out, which should probably be addressed by
>    another patch
>  - Move clock properties into 'Optional properties:' section
> 
>  Documentation/devicetree/bindings/net/fsl-fec.txt |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Documentation/devicetree/bindings/net/fsl-fec.txt
> index 845ff84..468736d 100644
> --- a/Documentation/devicetree/bindings/net/fsl-fec.txt
> +++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
> @@ -16,6 +16,15 @@ Optional properties:
>    will have the duration be 1 millisecond.  Numbers greater than 1000 are
>    invalid and 1 millisecond will be used instead.
>  - phy-supply: regulator that powers the Ethernet PHY.
> +- clocks: the clocks feeding the FEC controller and phy.
> +   - "ipg": the peripheral access clock
> +   - "ahb": the bus clock for MAC
> +   - "ptp": the sampling clock for PTP (IEEE 1588).  On SoC like i.MX6Q,
> +     the clock could come from either the internal clock control module
> +     or external oscillator via pad depending on board design.
> +   - "enet_out": the phy reference clock provided by SoC via pad, which
> +     is available on SoC like i.MX28.
> +- clock-names: Must contain the clock names described just above
>  
>  Example:

I can agree with that change.  It improves the situation for i.MX
(provides missing information for ARM), and doesn't break MPC,
while I'm not aware of other FEC (fast ethernet controller) uses.


For MPC though, I will have to provide a followup.

Starting with v3.12 (2771399a "fs_enet: cleanup clock API use")
the Linux drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
implementation looks up the "per" clock, while failure isn't
fatal.  I will change this to lookup "ipg" first and fallback to
"per" then.  Up to and including v3.13 no PowerPC .dts file
provides clock specs for FEC nodes, so lookup always fails.  I'm
guilty of not having provided a bindings update back then.

Starting with v3.14-rc1 the MPC5121/23/25 platform does provide
proper COMMON_CLK support, but comes with full backwards compat
support, too.  So failure to lookup the clock spec still isn't
fatal, the code works with both updated as well as pre-existing
device trees.  And it will keep working across "incompatible"
changes in the .dts, switching from "per" to "ipg" names for the
FEC nodes.

So there are three changes that I will have to prepare:
- documenting "per" as an (obsolete) alias for "ipg" in the
  binding
- looking up "ipg" before "per" in one of the FEC drivers
- and switching from "per" to "ipg" in MPC .dts files

As outlined above, none of these changes depends on a specific
order, nothing needs to get rushed into v3.14, although it would
be nice to start shipping with a consistent state.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
