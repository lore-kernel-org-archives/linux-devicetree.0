From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/4] drm: arm: Add DT bindings documentation for HDLCD
 driver.
Date: Thu, 12 Nov 2015 10:42:10 +0000
Message-ID: <20151112104210.GZ963@e106497-lin.cambridge.arm.com>
References: <1447258010-2234-1-git-send-email-Liviu.Dudau@arm.com>
 <1447258010-2234-2-git-send-email-Liviu.Dudau@arm.com>
 <20151111184849.GA9172@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151111184849.GA9172@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>, DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 11, 2015 at 12:48:50PM -0600, Rob Herring wrote:
> On Wed, Nov 11, 2015 at 04:06:47PM +0000, Liviu Dudau wrote:
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
>=20
> Looks pretty good, but a few comments.
>=20
> > ---
> >  .../devicetree/bindings/drm/arm/arm,hdlcd.txt      | 74 ++++++++++=
++++++++++++
> >  1 file changed, 74 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/drm/arm/arm,h=
dlcd.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/drm/arm/arm,hdlcd.tx=
t b/Documentation/devicetree/bindings/drm/arm/arm,hdlcd.txt
> > new file mode 100644
> > index 0000000..b57f1b9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/drm/arm/arm,hdlcd.txt
> > @@ -0,0 +1,74 @@
> > +ARM HDLCD
> > +
> > +This is a display controller found on several development platform=
s produced
> > +by ARM Ltd and in more modern of its' Fast Models. The HDLCD is an=
 RGB
> > +streamer that reads the data from a framebuffer and sends it to a =
single
> > +digital encoder (DVI or HDMI).
> > +
> > +Required properties:
> > +  - compatible: "arm,hdlcd"
>=20
> Kind of generic. Something more specific please.

"There can be only one!" (hdlcd) :) This is going to be a "one version =
only" HW part.
ARM has now switched to a new display hardware that has more features a=
nd a new name,
and work on mainlining support for that will start once I get the HDLCD=
 driver accepted.=20

>=20
> > +  - reg: Physical base address and length of the controller's regi=
sters.
> > +    If a second pair of address and length values is present this =
specifies
> > +    the presence of a DMA coherent memory area that the HDLCD can =
use as
> > +    framebuffer instead of normal CMA memory.
>=20
> This is on-chip RAM or nornal system RAM? We already have bindings fo=
r=20
> both.

Juno has a set of TLX (ThinLinks) connectors on the board where an FPGA=
 can be attached. On r1
the code running on FPGA can even participate as an AXI master with ful=
l coherency. The FPGA
has local memory that we want to share with the HDLCD to be used as a f=
ramebuffer.

>=20
> > +  - interrupts: One interrupt used by the display controller to no=
tify the
> > +    interrupt controller when any of the interrupt sources program=
med in
> > +    the interrupt mask register have activated.
> > +  - clocks: A list of phandle + clock-specifier pairs, one for eac=
h
> > +    entry in 'clock-names'.
> > +  - clock-names: A list of clock names. For HDLD it should contain=
:
> > +      - "pxlclk" for the clock feeding the output PLL of the contr=
oller.
> > +  - port: The HDLCD connection to an encoder chip. The connection =
is modelled
> > +    using the OF graph bindings specified in Documentation/devicet=
ree/bindings/graph.txt.
>=20

Thanks for reviewing this,
Liviu

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
