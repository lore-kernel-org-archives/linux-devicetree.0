From: Jan Glauber <jan.glauber-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: Add Cavium SOCs NAND bindings
Date: Mon, 3 Apr 2017 18:18:49 +0200
Message-ID: <20170403161849.GA2845@hardcore>
References: <20170327160524.29019-1-jglauber@cavium.com>
 <20170327160524.29019-2-jglauber@cavium.com>
 <20170403132937.z5mxksabo6kmo4jy@rob-hp-laptop>
 <20170403143840.GA23698@hardcore>
 <CAL_JsqJ2VgF_Lp-vpdn6VL71K4z6Mu7DWYSaLZ_N0U+jaTuPsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ2VgF_Lp-vpdn6VL71K4z6Mu7DWYSaLZ_N0U+jaTuPsQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 03, 2017 at 09:47:05AM -0500, Rob Herring wrote:
> On Mon, Apr 3, 2017 at 9:38 AM, Jan Glauber
> <jan.glauber-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> > On Mon, Apr 03, 2017 at 08:29:37AM -0500, Rob Herring wrote:
> >> On Mon, Mar 27, 2017 at 06:05:23PM +0200, Jan Glauber wrote:
> >> > Add device tree binding description for Cavium SOC nand flash controller.
> >> >
> >> > CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> > CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >> > CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> >
> >> > Signed-off-by: Jan Glauber <jglauber-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >> > ---
> >> >  .../devicetree/bindings/mtd/cavium_nand.txt        | 32 ++++++++++++++++++++++
> >> >  1 file changed, 32 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/mtd/cavium_nand.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/mtd/cavium_nand.txt b/Documentation/devicetree/bindings/mtd/cavium_nand.txt
> >> > new file mode 100644
> >> > index 0000000..4698d1f
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/mtd/cavium_nand.txt
> >> > @@ -0,0 +1,32 @@
> >> > +* Cavium NAND controller
> >> > +
> >> > +Required properties:
> >> > +
> >> > +- compatible:              should be "cavium,cn8xxx-nand"
> >>
> >> Don't use wildcards in compatible strings. For PCI devices, this should
> >> be based on the PCI vendor and device IDs.
> >>
> >
> > Is there a syntax for compatible PCI devices? I'm afraid I've not seen
> > this yet, can you give an example?
> 
> www.o3one.org/hwdocs/openfirmware/pci_supplement_2_1.pdf

Thanks, I probably should have read this before...

So it will be something like:
compatible = "pci177d,a04f"

A bit unreadable, but it solves the wildcard issue.

> > Most of Cavium's devices are PCI devices, we just added the compatible
> > as convenience and usually it is not parsed.
> 
> Linux doesn't parse it, but it's still required in the binding.

OK.

--Jan

> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
