From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 0/4] arm64: renesas: enable M3ULCB board peripherals
Date: Sat, 8 Apr 2017 09:18:39 -0400
Message-ID: <20170408131839.GD20684@verge.net.au>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1489788135.8957.2.camel@collabora.co.uk>
 <CAMuHMdX9caECvsBnfUQhbQKdW_uGJ_VXAUksMMXw7EAGP8QUCQ@mail.gmail.com>
 <20170407135212.GA24096@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170407135212.GA24096-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 07, 2017 at 09:52:13AM -0400, Simon Horman wrote:
> On Thu, Apr 06, 2017 at 11:53:45AM +0200, Geert Uytterhoeven wrote:
> > Hi Simon,
> > 
> > On Fri, Mar 17, 2017 at 11:02 PM, Sjoerd Simons
> > <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org> wrote:
> > > On Thu, 2017-01-26 at 17:53 +0300, Vladimir Barinov wrote:
> > >> This adds the folowing:
> > >> - R8A7796 SoC based M3ULCB board peripherals
> > >>
> > >> Vladimir Barinov (4):
> > >> [1/4] arm64: dts: m3ulcb: enable I2C
> > >> [2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map
> 
> I have queued up the above two patches.
> > >> [3/4] arm64: dts: m3ulcb: enable EthernetAVB
> 
> Please update the above patch to reflect the changes made in
> ef3f08c83fd1 ("arm64: dts: r8a7796: salvator-x: Fix EthernetAVB PHY timing")
> 
> > >> [4/4] arm64: dts: m3ulcb: enable HS200 for eMMC
> 
> I will look at queuing this up in the near future
> with other HS200 enablement patches.

I have now done so; patches 1,2,4 are queued up for v4.13.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
