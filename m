From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2 1/2] doc/devicetree: Add Aspeed VIC bindings
Date: Thu, 12 May 2016 11:01:22 +1000
Message-ID: <1463014882.20290.203.camel@kernel.crashing.org>
References: <462797239-14765-1-git-send-email-joel@jms.id.au>
	 <1462802317-27086-1-git-send-email-joel@jms.id.au>
	 <1462802317-27086-2-git-send-email-joel@jms.id.au>
	 <20160511143313.GA7426@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160511143313.GA7426@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-05-11 at 09:33 -0500, Rob Herring wrote:
> > +- interrupt-controller : Identifies the node as an interrupt contr=
oller
> > +- #interrupt-cells : Specifies the number of cells needed to encod=
e an
> > +=C2=A0 interrupt source. The value shall be 1.
>=20
> No need for level vs. edge flags?

That's an open question. Most interrupts are fixed. A handful of GPIOs
can be configured either way. For now I am relying on uboot setting up
the right config for them and I read it back at boot time, but we could
make it part of the binding I suppose.

> > +- valid-sources : bitmask of valid irq sources
>=20
> Drop this. Either all interrupt controllers need this or none of=C2=A0
> them do. The valid sources are the ones described in the DT.

Looking at the code (I wrote that ages ago), this is only used for:

=C2=A0 - Failing map on an unsupported source, so we could drop it

=C2=A0 - Counting the number of sources in order to optimize the
=C2=A0 =C2=A0 revmap size allocation. We could unconditionally allocate
=C2=A0 =C2=A0 64, I don't see a big deal here.

So yes Joel, feel free to just ditch this.

> > +
> > +Example:
> > +
> > + vic: interrupt-controller {
>=20
> Needs a unit address.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "aspeed,ast2400-vic"=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-controller;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #interrupt-cells =3D <1>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 valid-sources =3D < 0xffffffff 0x00=
07ffff>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x1e6c0080 0x80>;
> > + };
> > --=C2=A0
> > 2.8.1
> >=C2=A0
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetre=
e" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at=C2=A0 http://vger.kernel.org/majordomo-info.=
html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
