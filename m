From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH] phy-rcar-usb-gen2: add device tree support
Date: Wed, 29 Jan 2014 15:22:12 +0900
Message-ID: <20140129062212.GD23833@verge.net.au>
References: <1390754945-28142-6-git-send-email-ben.dooks@codethink.co.uk>
 <1390755901-3743-1-git-send-email-ben.dooks@codethink.co.uk>
 <52E6A436.5090408@cogentembedded.com>
 <52E6AE32.5050906@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52E6AE32.5050906-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 27, 2014 at 07:06:26PM +0000, Ben Dooks wrote:
> On 27/01/14 18:23, Sergei Shtylyov wrote:
> >Hello.
> >
> >On 01/26/2014 08:05 PM, Ben Dooks wrote:
> 
> [snip]
> 
> >>
> >>+static struct of_device_id rcar_gen2_usb_phy_ofmatch[] = {
> >>+    { .compatible = "renesas,usb-phy-r8a7790", },
> >>+    { .compatible = "renesas,rcar-gen2-usb-phy", },
> >
> >    Frankly speaking, I don't understand the need for the clearly
> >duplicate entries.
> 
> Thanks, will look into remove it.
> Anyone else have any comments on this?

I would like you to leave it there.

As we know the r8a7790 is an R-Car Gen2 SoC.  But there are other R-Car
Gen2 SoCs, such as the r8a7791, they it could plausibly make use of
rcar-gen2-usb-phy until the driver is updated with a usb-phy-r8a7791 entry.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
