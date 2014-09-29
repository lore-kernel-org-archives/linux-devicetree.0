From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] DT: add binding for mxs regulator
Date: Mon, 29 Sep 2014 13:41:38 +0100
Message-ID: <20140929124137.GD2432@leverpostej>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com>
 <1411779588-22031-2-git-send-email-stefan.wahren@i2se.com>
 <20140929110919.GB2432@leverpostej>
 <54294832.8000702@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54294832.8000702-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 29, 2014 at 12:53:22PM +0100, Stefan Wahren wrote:
> Hi Mark,
> 
> Am 29.09.2014 um 13:09 schrieb Mark Rutland:
> > On Sat, Sep 27, 2014 at 01:59:47AM +0100, Stefan Wahren wrote:
> >> This patch adds the Device tree bindings for the Freescale MXS
> >> on-chip regulators.
> >>
> >> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> >> ---
> >>  .../bindings/regulator/mxs-regulator.txt           |   36 ++++++++++++++++++++
> >>  1 file changed, 36 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/regulator/mxs-regulator.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/regulator/mxs-regulator.txt b/Documentation/devicetree/bindings/regulator/mxs-regulator.txt
> >> new file mode 100644
> >> index 0000000..e3133a4
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/regulator/mxs-regulator.txt
> >> @@ -0,0 +1,36 @@
> >> +MXS regulators
> >> +
> >> +Required node properties:
> >> +- compatible: Should be "simple-bus"
> > This does not look like an appropriate use of simple-bus.
> >
> > Why do you want the parent node to be a simple-bus?
> 
> the current parent node in imx28.dtsi looks like a placeholder for the
> power sub system:
> 
> power: power@80044000 {
> 	reg = <0x80044000 0x2000>;
> 	status = "disabled";
> };
> 
> I want to trigger the probing of the child nodes (regulators) without
> writing a driver for the complete power sub system. The simple-bus
> avoids that.

Well, the simple-bus will cause the children to be probed. But it looks
like you care about properties of the parent. I don't think that
simple-bus is appropriate because it's not being handled as a
transparent bridge from the PoV of the children.

> 
> Do we need a extra driver?

Perhaps, but it's relatively simple to match on a compatible string and
probe children if you just wantto start small for now.

> >
> >> +- #address-cells: Number of cells required to define regulator register,
> >> +  must be 1
> >> +- #size-cells: Number of cells required to define register size, must be 1
> > Why must this be the case, given that the child node expects an absolute
> > physical address?
> 
> I need a property to define the control register for the regulators
> without defining vendor specific properties like "fsl,mxs-control-reg"
> or something.

You misunderstand me. I was querying the "must be 1" rather than the
proeprties themselves.

> 
> > What's wrong with #address-cells = <2>, for example?
> 
> Nothing

Then we shouldn't specify "must be 1", no?

> 
> >
> >> +- reg: Absolute physical address and size of the register set for the device
> > Why is this here _and_ in the child node(s)?
> 
> The parent of the power node is also a simple bus. I use this to
> calculate the power status register per offset.
> 
> > What is the difference between this node and its children?
> 
> The parent node represent the power sub system and the regulators are
> part of this sub system.
> 
> > Can there be more than one sub-node?
> 
> In the i.MX28 are at least 4 voltage regulators, 1 current regulator and
> many more. At first, the driver should implement only 3 voltage
> regulators (vddd, vdda, vddio).

Ok.

I think you need a binding for the power subsystem, and a trivial driver
that can match on that and probe the child regulators. Are there
components other than voltage or current regulators in the sub system?

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
