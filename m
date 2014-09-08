From: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/4] arm64, thunder: Document devicetree bindings for
 Cavium Thunder SoC
Date: Mon, 8 Sep 2014 09:54:59 +0200
Message-ID: <20140908075459.GW4703@rric.localhost>
References: <1409903205-2762-1-git-send-email-rric@kernel.org>
 <1409903205-2762-4-git-send-email-rric@kernel.org>
 <20140905084200.GE13515@arm.com>
 <20140905093222.GS4703@rric.localhost>
 <20140905093932.GI2172@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140905093932.GI2172@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05.09.14 10:39:33, Mark Rutland wrote:
> On Fri, Sep 05, 2014 at 10:32:22AM +0100, Robert Richter wrote:
> > On 05.09.14 09:42:00, Will Deacon wrote:
> > > On Fri, Sep 05, 2014 at 08:46:44AM +0100, Robert Richter wrote:
> > > > From: Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> > > > 
> > > > This patch adds documentation for the devicetree bindings used by the
> > > > DT files of Cavium Thunder SoC platforms.
> > > > 
> > > > Signed-off-by: Radha Mohan Chintakuntla <rchintakuntla-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> > > > Signed-off-by: Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/cavium-thunder.txt | 10 ++++++++++
> > > >  Documentation/devicetree/bindings/arm/cpus.txt           |  1 +
> > > >  2 files changed, 11 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder.txt
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/arm/cavium-thunder.txt b/Documentation/devicetree/bindings/arm/cavium-thunder.txt
> > > > new file mode 100644
> > > > index 000000000000..6f63a5866902
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/arm/cavium-thunder.txt
> > > > @@ -0,0 +1,10 @@
> > > > +Cavium Thunder platform device tree bindings
> > > > +--------------------------------------------
> > > > +
> > > > +Boards with Cavium's Thunder SoC shall have following properties.
> > > > +
> > > > +Root Node
> > > > +---------
> > > > +Required root node properties:
> > > > +
> > > > +  - compatible = "cavium,thunder-88xx";
> > > 
> > > Is this file necessary? We don't have one for xgene afaict.
> > 
> > Hmm, looking at Documentation/devicetree/bindings/arm/calxeda.txt
> > there is something similar.
> > 
> > I am fine with both, keeping or removing it.
> > 
> > Would leave this to the DT maintainers.
> 
> Having a required root node compatible is fine, though I would only
> expect it to be necessary for errata workarounds if we have no other way
> of detecting things.

Ok, will keep the change.

> That said, compatible strings shouldn't have wildcards, so
> "cavium,thunder-88xx" should be replaced with something more specific.
> Later boards can claim compatibility with that (but should have their
> own strings too).

88xx is not a wildcard for chips, there are no chips named 8800 or
whatever, instead we have e.g. 87xx. That said, 88xx is the specific
name of the soc and the first reference board. If there will be other
boards with the same soc, it should have its own name but should be
compatible with cavium,thunder-88xx. Later soc revisions will get a
different name than thunder-88xx for differentiation.

-Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
