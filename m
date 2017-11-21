From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v3 4/5] pinctrl: mcp23s08: configure irq polarity using
 irq data
Date: Tue, 21 Nov 2017 17:30:04 +0100
Message-ID: <20171121163004.luw5wol2gordgom2@earth>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <c191a9d6-3ebb-e95b-7342-aa18598ddf2b@electromag.com.au>
 <20171121152142.zg3r57gl2kenjwgi@earth>
 <2197074.iKMxQHLgca@ws-stein>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="duxiiwsryoxxov43"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2197074.iKMxQHLgca@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Phil Reid <preid@electromag.com.au>, robh+dt@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--duxiiwsryoxxov43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 21, 2017 at 05:04:51PM +0100, Alexander Stein wrote:
> Hi,
>=20
> On Tuesday, November 21, 2017, 4:21:42 PM CET Sebastian Reichel wrote:
> >[...]
> > --------------------------------------------
> > gpio: host-gpio {
> >     random-properties;
> > }
> >=20
> > inv: line-inverter {
> >     /*
> >      * configure the gpio controller input to be active low
> >      * and the inverter interrupt output to be active low
> >      */
> >     interrupts =3D <&gpio ACTIVE_LOW>;
> > };
> >=20
> > mcp23xxx {
> >     random-properties;
> >=20
> >     /*
> >      * configure the chip interrupt output to be active high=20
> >      * and the inverter interrupt input to be active high
> >      */
> >     interrupts =3D <&inv ACTIVE_HIGH>;
> > }
> > --------------------------------------------
> >=20
> > versus
> >=20
> > --------------------------------------------
> > gpio: host-gpio {
> >     random-properties;
> > }
> >=20
> > mcp23xxx {
> >     random-properties;
> >=20
> >     /* configure host interrupt input pin to be active low */
> >     interrupts =3D <&gpio ACTIVE_LOW>;
> >=20
> >     /* configure chip interrupt output pin to be active high */
> >     microchip,irq-active-high;
> > }
> > --------------------------------------------
> >=20
> > I think this is something, that Rob should comment on. Obviously at
> > least in the mainline kernel nobody implemented the first solution
> > (since there is no fitting interrupt-invert driver), but there are
> > a few instances of the second variant. On the other hand the first
> > solution describes the hardware more detailed.
> >
> > > And if someone is relying on that implicit behaviour are we allowed
> > > to break things? Probably ok with this one as it's currently not poss=
ible
> > > due to code patch 1 removes.
> > >=20
> > > If we need to model the invert to get the patches accepted I look int=
o that.
> > > I don't actually need it for my system as I can set open-drain with o=
verrides
> > > the active-high control on this device, while have active high irq co=
nsumer.
> > > :)
> >=20
> > IMHO the explicit line-inverter is a bit over-engineered and
> > implicit line-inverter is enough, but I'm fine with both solutions.
> > I think the DT binding maintainers should comment on this though,
> > since it's pretty much a core decision about interrupt specifiers.
>=20
> Once you have a hardware, where one of several IRQ users is not attached =
to the
> inverter you need this inverter node anyway, caused by the mixed polariti=
es.
> Also some IRQ controllers, like ARM GIC, only support rising edge interru=
pts
> (also level high).
>
> This might get important if there are dedicated IRQ pads connected to sev=
eral
> users.

Both binding formats support this use-case as far as I can tell.
Since you seem to understand how it looks like with the inverter
node here is an example without it:

irqctrl: irq-controller {
    random-properties;
}

mcp23xxx0 {
    random-properties;

    /*=20
     * configure host interrupt input pin to be active high, since
     * nothing else is supported by the interrupt controller
     */
    interrupts =3D <&irqctrl ACTIVE_HIGH>;

    /*
     * configure chip interrupt output pin to be active low due to
     * line invert
     */
    microchip,irq-active-high;
}

mcp23xxx1 {
    random-properties;

    /*=20
     * shared irq, see description from other chip
     */
    interrupts =3D <&irqctrl ACTIVE_HIGH>;

    /*
     * configure chip interrupt output pin to be active high, since
     * it's routed through the line invert
     */
    /* microchip,irq-active-high; */
}

-- Sebastian

--duxiiwsryoxxov43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAloUVIoACgkQ2O7X88g7
+poOjBAAjQFqHFC2f2xZbEFcrV/gvI3nONqghMRrWyHirz+I+TyiOFAKtngOk8ZL
NIY+G3k+jPrFEGgrbHh90ORBfKFBsg/YuGFpNN4vHDQOkmKf+NyvEfhA1oB8zvCM
fF3E+QgG8U8/GM6ATQEjiHC+YBySXlrSkC9KId1MwtpM66g5ldl6rAHryxThvL5f
Oe4HwBsB3WvQu54ceLmh0Uz1qKPyRG4EDvqQ8nDpidB2omrQvErb92MmJLInj/dc
AMA6FcI1b3wQFwss4oTlhKZ0+4m+k+p+b4vQz3Elekp6FZvisjHVnAuO/gAZwmhO
jlvr1COr6OTmAn6L/wHBqN1i1Ct4ftcSuZar7v0M3d3tPBgDjAx1zmqHreZ+8OBZ
QhBbU7FNfc5jB+p1tSgWuPjSoi0/eM/oPmkpbwoxBphhfCUPyGPTtX4E7BZb6GBo
6CY9ItgVdp5ohSCuMc8BHCsytc14Qp0/r/B6ZBiHpfuchpbMj4RtZonVmF0jbC9M
RD0S5Hc1+9PtJowEG2hWUTzMmIcwsN0/SUGu9bmYxWjDV4SXzmDtrZ/38tOIeEvX
vUoVyMEk6yKb1sxJ83SJZcoR1NGZAcEzoE+Wad4Z6GnHNMW2VGdFgS+ZufFv7Wkd
ZSBbFrDsni0+8ZoE+nKbMrU+L5l/UGc0Xf+Nh8staRzHN6DX8to=
=xvOF
-----END PGP SIGNATURE-----

--duxiiwsryoxxov43--
