From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 4/9] dt-bindings: add Marvell PMU documentation
Date: Thu, 12 Mar 2015 21:42:12 +0000
Message-ID: <20150312214211.GB8656@n2100.arm.linux.org.uk>
References: <20150312183020.GU8656@n2100.arm.linux.org.uk>
 <E1YW7t0-0003mE-My@rmk-PC.arm.linux.org.uk>
 <CAL_Jsq+R70GVsuig7Ebo49_MeneD_RZ=E0haTVsb_xFhTR7-pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+R70GVsuig7Ebo49_MeneD_RZ=E0haTVsb_xFhTR7-pw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 12, 2015 at 04:32:07PM -0500, Rob Herring wrote:
> On Thu, Mar 12, 2015 at 1:31 PM, Russell King
> <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> > Add the required DT binding documentation for the Marvell PMU driver.
> >
> > Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/soc/dove/pmu.txt | 49 ++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/dove/pmu.txt
> >
> > diff --git a/Documentation/devicetree/bindings/soc/dove/pmu.txt b/Documentation/devicetree/bindings/soc/dove/pmu.txt
> > new file mode 100644
> > index 000000000000..9617aa298dd4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/dove/pmu.txt
> > @@ -0,0 +1,49 @@
> > +Device Tree bindings for Marvell PMU
> > +
> > +Required properties:
> > + - compatible: value should be "marvell,dove-pmu".
> > + - reg: two base addresses and sizes of the PM controller and PMU.
> > + - interrupts: single interrupt number for the PMU interrupt
> > + - interrupt-controller: must be specified as the PMU itself is an
> > +    interrupt controller.
> 
> Is it always an interrupt controller or just in low power modes like
> ones typically tacked on to GICs?

Always.  It's an interrupt controller: it takes interrupts from other
parts of the system with individual status and masks, and forwards it
on as a single interrupt input to the upstream interrupt controller.

> > + - #interrupt-cells: must be 1.
> > + - #reset-cells: must be 1.
> > +
> > +Optional properties:
> > + - None
> > +
> > +Domain descriptions are listed as child nodes of the power management
> 
> "Power domain descriptions..." just to be clear.

Ok.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
