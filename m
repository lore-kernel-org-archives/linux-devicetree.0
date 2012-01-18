From: Tony Lindgren <tony@atomide.com>
Subject: Re: Pinmux bindings proposal
Date: Wed, 18 Jan 2012 07:32:56 -0800
Message-ID: <20120118153256.GB22818@atomide.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF17801D202F@HQMAIL01.nvidia.com>
 <20120116182808.GG4223@ponder.secretlab.ca>
 <20120118141329.GA22818@atomide.com>
 <CAAQ0ZWTtYz3Lg7=Xz29m07j_k8yA95hn6cyk92SAJ4iGJRT_gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAQ0ZWTtYz3Lg7=Xz29m07j_k8yA95hn6cyk92SAJ4iGJRT_gw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Dong Aisheng <dongas86@gmail.com>
List-Id: devicetree@vger.kernel.org

* Shawn Guo <shawn.guo@linaro.org> [120118 05:57]:
> On 18 January 2012 22:13, Tony Lindgren <tony@atomide.com> wrote:
> > Hi,
> >
> > * Grant Likely <grant.likely@secretlab.ca> [120116 09:55]:
> >> On Fri, Jan 13, 2012 at 12:39:42PM -0800, Stephen Warren wrote:
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinmux =3D
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <"default" &pmx_sdhci_active>
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <"suspend" &pmx_sdhci_suspend>;
> >> >
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 1:n e=
xample: */
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinmux =3D
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <"default" &pmx_sdhci_mux_a>
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <"default" &pmx_sdhci_pincfg_a>
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <"suspend" &pmx_sdhci_mux_a>
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 <"suspend" &pmx_sdhci_pincfg_a_suspend>;
> >>
> >>
> >> Yeah, don't do this. =C2=A0Mixing phandle, string and cell values =
in a
> >> property gets messy and could become troublesome to parse. =C2=A0I=
've
> >> backed away from it in the clk binding.
> >
> > Yup, that's because the string is embedded directly into the mixed
> > mode array and will likely make the following data unaligned. That
> > means it's extremely flakey to parse, and will lead into horrible
> > errors if you have typos in the .dts file.. Tried that and gave up
> > on it.
> >
> > I think I've found a way to avoid using names at all, assuming we s=
et
> > each pin as a phandle for the drivers to use :)
> >
> The problem with doing that is we will have to represent each pin as =
a
> node in device tree.  For imx6q case, we have 197 pins.  Doing so wil=
l
> bloat the device tree.

Sure there's some overhead. I've got it working with 220 pins, it's
not too bad as threre's not much string parsing involved.

I don't have all the devices mapping the pins though. The .dtb for
omap4 is about 25k now.

If we wanted to avoid adding phandles for each pin, then we could do:

serial@0x48020000 {
	compatible =3D "ti,8250";
	reg =3D <0x48020000 0x100>;
	reg-shift =3D <2>;
	interrupts =3D <106>;

	/* controller, offset, value */
	pins =3D <&mux1 0xabcd 0x10
                &mux1 0xabcf 0x0>;
};

But then the .dts file becomes an unreadable matrix unless we have
a preprocessor..

Regards,

Tony
