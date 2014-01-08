From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: =?UTF-8?Q?=E7=AD=94=E5=A4=8D=3A?= [v7] clk: corenet: Adds the
 clock binding
Date: Wed, 8 Jan 2014 12:43:39 -0600
Message-ID: <1389206619.25654.9.camel@snotra.buserror.net>
References: <1384938289-24713-1-git-send-email-Yuantian.Tang@freescale.com>
	 <20140108002115.GA19801@home.buserror.net>
	 <375c32b2f4e34589ae336af61468a51b@BL2PR03MB115.namprd03.prod.outlook.com>
	 <20140108093046.GB6701@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140108093046.GB6701-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Yuantian Tang <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-01-08 at 09:30 +0000, Mark Rutland wrote:
> On Wed, Jan 08, 2014 at 08:53:56AM +0000, Yuantian Tang wrote:
> >=20
> > ________________________________________
> > =E5=8F=91=E4=BB=B6=E4=BA=BA: Wood Scott-B07421
> > =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2014=E5=B9=B41=E6=9C=888=E6=97=
=A5 8:21
> > =E6=94=B6=E4=BB=B6=E4=BA=BA: Tang Yuantian-B29983
> > =E6=8A=84=E9=80=81: galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org=
; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > =E4=B8=BB=E9=A2=98: Re: [v7] clk: corenet: Adds the clock binding
> >=20
> > On Wed, Nov 20, 2013 at 05:04:49PM +0800, tang yuantian wrote:
> > > +Recommended properties:
> > > +- ranges: Allows valid translation between child's address space=
 and
> > > +     parent's. Must be present if the device has sub-nodes.
> > > +- #address-cells: Specifies the number of cells used to represen=
t
> > > +     physical base addresses.  Must be present if the device has
> > > +     sub-nodes and set to 1 if present
> > > +- #size-cells: Specifies the number of cells used to represent
> > > +     the size of an address. Must be present if the device has
> > > +     sub-nodes and set to 1 if present
> >=20
> > Why are we specifying #address-cells/#size-cells here?
> >=20
> > A: it has sub-nodes which have REG property, don't we need to=20
> > specify #address-cells/#size-cells?
>=20
> If a node has a reg entry, its parent should have #size-cells and
> #address-cells to allow it to be parsed properly.

Yes, but why do we need to specify in this binding how many cells there
will be, especially since this binding only addresses the clock provide=
r
aspect of the clockgen nodes (e.g. it doesn't describe the reg)?  Or
rather, it's partially describing the non-clock aspect, and doesn't
address the clock aspect at all AFAICT.

Where does the actual input clock frequency go?  U-Boot puts it in the
clockgen node itself as clock-frequency, but that isn't described in th=
e
binding.  How does that relate to the sysclk node?  If
"fsl,qoriq-sysclk-1.0" is supposed to indicate that clock-frequency can
be found in the parent node, that isn't specified by the binding, nor i=
s
clock-frequency shown in the example.

What is the difference between "fsl,qoriq-sysclk-1.0" and
"fsl,qoriq-sysclk-2.0"?  How does the concept of a fixed input clock
change?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
