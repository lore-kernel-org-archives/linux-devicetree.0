From: "lee.jones@linaro.org" <lee.jones@linaro.org>
Subject: Re: [PATCH] dt: platform: Extract device name from device tree blob
Date: Fri, 16 Nov 2012 08:15:36 +0000
Message-ID: <20121116081536.GE14476@gmail.com>
References: <1352732343-1199-1-git-send-email-per.forlin@stericsson.com>
 <CACxGe6vjLA3j-bc_048UrdB5Q=8pV8=LPSVUnU_k3anX23vwyw@mail.gmail.com>
 <50A17E30.7030807@stericsson.com>
 <20121115155246.C4EC83E194B@localhost>
 <50A51515.3020206@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <50A51515.3020206@stericsson.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Per =?iso-8859-1?Q?F=F6rlin?= <per.forlin@stericsson.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Linus Walleij <linus.walleij@linaro.org>, Fredrik SODERSTEDT <fredrik.soderstedt@stericsson.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 15 Nov 2012, Per F=C3=B6rlin wrote:

> On 11/15/2012 04:52 PM, Grant Likely wrote:
> > On Mon, 12 Nov 2012 23:54:40 +0100, Per F=C3=83=C2=B6rlin <per.forl=
in@stericsson.com> wrote:
> >> On 11/12/2012 04:20 PM, Grant Likely wrote:
> >>> On Mon, Nov 12, 2012 at 2:59 PM, Per Forlin <per.forlin@stericsso=
n.com> wrote:
> >>>> Add support to extract device name from device tree blob.
> >>>> If the property "dev-name" is set in the DTS this name will
> >>>> be used when creating the device.
> >>>> The auxdata_lookup has precedence and will override
> >>>> the "dev-name" property.
> >>>
> >>> Using a 'dev-name' property has the same problem that the 'cell-i=
ndex'
> >>> properties have in that it is encoding part of the global namespa=
ce
> >>> local to the node and it becomes easy to create collisions. Inste=
ad of
> >>> this check to see if one of the properties in /aliases points to =
the
> >>> node and use that for the name.
> >>>
> >>> g.
> >>>
> >> Thanks Grant for your feedback,
> >>
> >> Extract from exynos5250.dtsi:
> >> -----------
> >> 	aliases {
> >> 		spi0 =3D &spi_0;
> >> 		spi1 =3D &spi_1;
> >> 		spi2 =3D &spi_2;
> >> 	};
> >>
> >> 	spi_0: spi@12d20000 {
> >> ...
> >> 	};
> >>
> >> 	spi_1: spi@12d30000 {
> >> ...
> >> 	};
> >>
> >> 	spi_2: spi@12d40000 {
> >> ...
> >> 	};
> >> ---------------
> >>
> >> Alias refers to the device node. The device node is not aware of t=
he alias.
> >>
> >> How to get a device name from the aliases.
> >> 1. Traverse all aliases for each device node (time consuming if th=
ere are many aliases)
> >> 2. Make a new function of_alias_get_name(), today there is only of=
_alias_get_id()
> >> 3. The functionality of setting device_name based on alias name ne=
eds to be optional because one may want to use aliases without changing=
 the name of the device.
> >> All this is feasible but perhaps not optimal.
> >>
> >> I don't really see how come name space is a big issue in this case=
=2E The name space of "dev-name" is local to the device node. A child d=
evice node can use the same dev-name as the parent (unless I'm mistaken=
 which happens quite often). Introducing yet another property name poll=
utes the name space of the device node. Still I think the pros are stro=
nger than the cons.
> >>
> >> Do you still prefer to use the name of the Alias? Could you please=
 elaborate a bit more how this can be done in practice?
> >> I would agree with you if there was a reference from the device no=
de to the alias.
> >=20
> > Oh, I see what you're trying to do. As Lee pointed out you're tryin=
g to
> > make the Linux internal way of matching up clocks and regulators ha=
ppy.
> > That is very much a Linux-kernel internal thing and should be solve=
d in
> > the kernel. Trying to solve it with fixed names in the device tree =
will
> > cause problems down the road.
> >=20
> > I though you were wanting to have logical names for the devices tha=
t
> > make sense to the user which is how aliases is used now.
> >=20
> > So, no, don't do this.
> >=20
> > g.
> >=20
> Hi,
>=20
> I came to the same conclusion when I dag into it some more. I replied=
 to my own comment and concluded (https://lkml.org/lkml/2012/11/13/309)=
=2E
> The solution is to move clocks and regulators into the DTS. When this=
 is done there will be no need for setting a specific device-name (all =
those auxdata_lookup can be removed)

Right, something I will do when we have all the pieces in place.

=46WIW, all of the regulators are in the DTS(I) files and are happy.
We're still working on Clocks, I believe Ulf will deal with these.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
