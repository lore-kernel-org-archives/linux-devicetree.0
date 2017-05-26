From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v3 0/4] r8a7793 Gose video input support
Date: Fri, 26 May 2017 08:49:07 +0200
Message-ID: <20170526064907.GD2628@verge.net.au>
References: <1495199224-16337-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495199224-16337-1-git-send-email-ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 03:07:00PM +0200, Ulrich Hecht wrote:
> Hi!
> 
> This is a by-the-datasheet implementation of analog and digital video input
> on the Gose board.
> 
> This revision adds new bindings that distinguish between ADV7180 variants
> with three and six input ports. There are numerous variants of this chip,
> but since all that have "CP" in their names have three inputs, and all that
> have "ST" have six, I have limited myself to two new compatible strings,
> "adv7180cp" and "adv7180st".
> 
> The digital input patch has received minor tweaks of the port names for
> consistency, and the Gose analog input patch has been modified to use the
> new bindings, and a composite video connector has been added.
> 
> CU
> Uli
> 
> 
> Changes since v2:
> - hdmi: port hdmi_con renamed to hdmi_con_out
> - adv7180: added new compatibility strings and bindings
> - composite: added connector, use new bindings
> 
> Changes since v1:
> - r8a7793.dtsi: added VIN2
> - modeled HDMI decoder input/output and connector
> - added "renesas,rcar-gen2-vin" compat strings
> - removed unnecessary "remote" node and aliases
> - set ADV7612 interrupt to GP4_2
> 
> 
> Ulrich Hecht (4):
>   ARM: dts: gose: add HDMI input

I have queued-up the above patch for v4.13.

>   media: adv7180: add adv7180cp, adv7180st compatible strings
>   media: adv7180: Add adv7180cp, adv7180st bindings
>   ARM: dts: gose: add composite video input

I have marked the above dts patch as "deferred" pending acceptance
of the binding. Please repost or otherwise ping me once that has happened.

>  .../devicetree/bindings/media/i2c/adv7180.txt      |  15 +++
>  arch/arm/boot/dts/r8a7793-gose.dts                 | 127 ++++++++++++++++++++-
>  drivers/media/i2c/adv7180.c                        |   2 +
>  3 files changed, 142 insertions(+), 2 deletions(-)
> 
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
