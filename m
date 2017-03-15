From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [v2, 4/4] dt-bindings: mtd: Add Octal SPI support to Cadence
 QSPI.
Date: Wed, 15 Mar 2017 15:23:24 -0500
Message-ID: <20170315202324.44k43sjn5qnobins@rob-hp-laptop>
References: <1488959932-6657-1-git-send-email-jartur@cadence.com>
 <1488960326-13858-1-git-send-email-jartur@cadence.com>
 <132a4818-11d1-263f-aae4-bac4e76c14c8@gmail.com>
 <DM5PR07MB2780A784F8973310542FDBE3D4200@DM5PR07MB2780.namprd07.prod.outlook.com>
 <7d303436-77cf-fb11-30b6-c59014950ae6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7d303436-77cf-fb11-30b6-c59014950ae6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Artur Jedrysek <jartur-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 10, 2017 at 01:52:31PM +0100, Marek Vasut wrote:
> On 03/10/2017 01:03 PM, Artur Jedrysek wrote:
> > 
> >> From: Marek Vasut [mailto:marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> >> Sent: 10 March 2017 04:39
> >> On 03/08/2017 09:05 AM, Artur Jedrysek wrote:
> >>> This patch updates Cadence QSPI Device Tree documentation to include
> >>> information about new compatible used to indicate, whether or not
> >>> Octal SPI transfers are supported by the device.
> >>>
> >>> Signed-off-by: Artur Jedrysek <jartur-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
> >>> ---
> >>> Changelog:
> >>> v2: Use new compatible, instead of boolean property, to indicate
> >>> Octal SPI support.
> >>> ---
> >>>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 +++-
> >>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> >> b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> >>> index f248056..41d1e98 100644
> >>> --- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> >>> +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> >>> @@ -1,7 +1,9 @@
> >>>  * Cadence Quad SPI controller
> >>>
> >>>  Required properties:
> >>> -- compatible : Should be "cdns,qspi-nor".
> >>> +- compatible : Should be "cdns,{qspi|ospi}-nor".
> >>
> >> Please explicitly list all compatibles , ie.
> >> Should be "cdns,qspi-nor" or "cdns,ospi-nor".
> >>
> > 
> > Two possible options are also explicitly listed right below. I did that
> > in the way it was done in other driver for Cadence IP:
> > /Documentation/devicetree/bindings/net/macb.txt
> > Should I remove all of that and replace it with both options, separated
> > by an "or" word?
> 
> Wait for Rob to confirm.

As Marek suggested, but with one valid combination per line. I don't 
think checkpatch.pl will work with it as is.

> 
> >> But I think the ospi is backward compatible with qspi, right ? So the
> >> binding for ospi should list both, ie.
> >> compatible = "cdns,ospi-nor", "cdns,qspi-nor";
> >>
> > 
> > Yes, the ospi is backwards compatible with qspi. However, the sole point
> > of introducing new compatible was to differentiate between them (which
> > was previously done using a boolean flag, but that was criticized).
> > Listing both bindings for ospi would only help for kernels not
> > containing driver update being subject of this patch series, as both
> > ospi and qspi are handled by the same driver - just with a slight
> > difference. I apologize if I got something wrong here.
> 
> You got it right, I was just curious about the compatibility.

You are assuming every OS/user everywhere is updated. It doesn't hurt to 
have the backwards compatibility.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
