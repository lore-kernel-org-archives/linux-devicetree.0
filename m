From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] MFD/OF: document MFD devices and handle simple-mfd
Date: Tue, 3 Mar 2015 17:56:33 +0000
Message-ID: <20150303175633.GJ32624@x1>
References: <1425375148-4369-1-git-send-email-linus.walleij@linaro.org>
 <1425375148-4369-2-git-send-email-linus.walleij@linaro.org>
 <CAL_JsqLjooPxPdG2+fqSJToyWCtZHB=FvkqCUt+WgHExNo7D=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLjooPxPdG2+fqSJToyWCtZHB=FvkqCUt+WgHExNo7D=A@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 03 Mar 2015, Rob Herring wrote:

> On Tue, Mar 3, 2015 at 3:32 AM, Linus Walleij <linus.walleij@linaro.o=
rg> wrote:
> > This defines a new compatible option for MFD devices "simple-mfd" t=
hat will
> > make the OF core spawn child devices for all subnodes of that MFD d=
evice.
> > It is optional but handy for things like syscon and possibly other
> > simpler MFD devices.
> >
> > Since there was no file to put the documentation in, I took this op=
portunity
> > to make a small writeup on MFD devices and add the compatible defin=
ition
> > there.
> >
> > Suggested-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Cc: Devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > I make the patch to the OF core in this one, it makes much more sen=
se since
> > it's a oneliner
> >
> > Lee: this is a (tested!) implementation of your suggestion for simp=
le-mfd.
> > If you can eventually ACK this from the MFD side, I think it should=
 be
> > funneled through the ARM SoC tree.
> >
> > Grant/Rob: if either of you can ACK the change to the OF core likew=
ise it can
> > be taken through ARM SoC.
> >
> > DT binings maintainers: there is some background discussion on this=
 here:
> > http://marc.info/?l=3Dlinux-arm-kernel&m=3D142486676603889&w=3D2
> > http://marc.info/?l=3Ddevicetree&m=3D142166313621469&w=3D2
> > ---
> >  Documentation/devicetree/bindings/mfd/mfd.txt | 40 +++++++++++++++=
++++++++++++
> >  drivers/of/platform.c                         |  1 +
> >  2 files changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mfd.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/mfd.txt b/Docume=
ntation/devicetree/bindings/mfd/mfd.txt
> > new file mode 100644
> > index 000000000000..cc057438abe8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mfd.txt
> > @@ -0,0 +1,40 @@
> > +Multi-Function Devices (MFD)
> > +
> > +These devices comprise a nexus for heterogeneous hardware blocks s=
pawning
> > +multiple child devices.
> > +
> > +A typical MFD can be:
> > +
> > +- A mixed signal ASIC on an external bus, sometimes a PMIC (power =
management
> > +  integrated circuit) that is manufactured in a lower technology n=
ode (rough
> > +  silicon) that handles analog drivers for things like audio ampli=
fiers, LED
> > +  drivers, level shifters, PHY (physical interfaces to things like=
 USB or
> > +  ethernet), regulators etc.
> > +
> > +- A range of memory registers containing "miscellaneous system reg=
isters" also
> > +  known as a system controller "syscon" or any other memory range =
containing a
> > +  mix of unrelated registers.
> > +
> > +Optional properties:
> > +
> > +- compatible : "simple-mfd" - this signifies that the operating sy=
stem should
> > +  spawn child devices for all the subnodes of the MFD device akin =
to how
> > +  "simple-bus" inidicates when to spawn children for a simple memo=
ry-mapped
> > +  bus. For more complex devices, when the nexus driver has to prob=
e registers
> > +  to figure out what children exist etc, this should not be used. =
In the latter
> > +  case the child devices will be instantiated by the operating sys=
tem.
>=20
> If you point of_platform_populate to the parent node, it should
> instantiate all children regardless of "simple-bus" or any other
> match. The match is to probe the grandchildren. I could be mistaken,
> but that's how it works at the root level. You don't have a driver
> probe for the parent, so you want the top level of_platform_populate
> call to instantiate these devices?
>=20
> Why does simple-bus not work for you? After all, it is not
> "simple-memory-map-bus."

simple-bus does 'work'.  There are even some (3 I think) platforms
actively making use of it.  However, there was some controversy over
using it, as syscon isn't really a bus.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
