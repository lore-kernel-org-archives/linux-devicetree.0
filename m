From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Pinmux bindings proposal
Date: Wed, 18 Jan 2012 13:22:19 -0700
Message-ID: <20120118202219.GI4223@ponder.secretlab.ca>
References: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
 <20120116182808.GG4223@ponder.secretlab.ca>
 <20120118141329.GA22818@atomide.com>
 <CAAQ0ZWTtYz3Lg7=Xz29m07j_k8yA95hn6cyk92SAJ4iGJRT_gw@mail.gmail.com>
 <20120118153256.GB22818@atomide.com>
 <20120118162943.GC22818@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120118162943.GC22818-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2012 at 08:29:43AM -0800, Tony Lindgren wrote:
> * Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> [120118 07:00]:
> > * Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [120118 05:57]:
> > > On 18 January 2012 22:13, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
> > > > Hi,
> > > >
> > > > * Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> [120116 09:55]:
> > > >> On Fri, Jan 13, 2012 at 12:39:42PM -0800, Stephen Warren wrote:
> > > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinmux =3D
> > > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"default" &pmx_=
sdhci_active>
> > > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"suspend" &pmx_=
sdhci_suspend>;
> > > >> >
> > > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 1:n example: */
> > > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pinmux =3D
> > > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"default" &pmx_=
sdhci_mux_a>
> > > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"default" &pmx_=
sdhci_pincfg_a>
> > > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"suspend" &pmx_=
sdhci_mux_a>
> > > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <"suspend" &pmx_=
sdhci_pincfg_a_suspend>;
> > > >>
> > > >>
> > > >> Yeah, don't do this. =A0Mixing phandle, string and cell values in a
> > > >> property gets messy and could become troublesome to parse. =A0I've
> > > >> backed away from it in the clk binding.
> > > >
> > > > Yup, that's because the string is embedded directly into the mixed
> > > > mode array and will likely make the following data unaligned. That
> > > > means it's extremely flakey to parse, and will lead into horrible
> > > > errors if you have typos in the .dts file.. Tried that and gave up
> > > > on it.
> > > >
> > > > I think I've found a way to avoid using names at all, assuming we s=
et
> > > > each pin as a phandle for the drivers to use :)
> > > >
> > > The problem with doing that is we will have to represent each pin as a
> > > node in device tree.  For imx6q case, we have 197 pins.  Doing so will
> > > bloat the device tree.
> > =

> > Sure there's some overhead. I've got it working with 220 pins, it's
> > not too bad as threre's not much string parsing involved.
> > =

> > I don't have all the devices mapping the pins though. The .dtb for
> > omap4 is about 25k now.
> > =

> > If we wanted to avoid adding phandles for each pin, then we could do:
> > =

> > serial@0x48020000 {
> > 	compatible =3D "ti,8250";
> > 	reg =3D <0x48020000 0x100>;
> > 	reg-shift =3D <2>;
> > 	interrupts =3D <106>;
> > =

> > 	/* controller, offset, value */
> > 	pins =3D <&mux1 0xabcd 0x10
> >                 &mux1 0xabcf 0x0>;
> > };
> > =

> > But then the .dts file becomes an unreadable matrix unless we have
> > a preprocessor..
> =

> Forgot to mention that as long as we all standardize to use something
> common for #pin-args and of_parse_phandle_with_args(), the pin mapping
> could depend on the pinmux driver for selecting whether or not to use
> a phandle for each pin.

Yes, the actual layout parsing should remain in the control of the
pinmux controller like it does for irqs, gpios, etc.

g.
