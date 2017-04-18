From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Tue, 18 Apr 2017 13:51:59 +0200
Message-ID: <20170418115159.GD14505@amd>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
 <1492503544.2432.32.camel@pengutronix.de>
 <20170418100840.GF7456@valkosipuli.retiisi.org.uk>
 <20170418103453.GC14505@amd>
 <20170418105540.GH7456@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170418105540.GH7456-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-04-18 13:55:40, Sakari Ailus wrote:
> On Tue, Apr 18, 2017 at 12:34:53PM +0200, Pavel Machek wrote:
> > On Tue 2017-04-18 13:08:41, Sakari Ailus wrote:
> > > Hi Philipp,
> > >=20
> > > On Tue, Apr 18, 2017 at 10:19:04AM +0200, Philipp Zabel wrote:
> > > > On Thu, 2017-04-13 at 17:48 +0200, Philipp Zabel wrote:
> > > > > This adds device tree binding documentation for mmio-based syscon
> > > > > multiplexers controlled by a single bitfield in a syscon register
> > > > > range.
> > > > >=20
> > > > > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/mux/mmio-mux.txt | 56 ++++++++=
++++++++++++++
> > > > >  1 file changed, 56 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/mux/mmio-mu=
x.txt
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/mux/mmio-mux.txt b=
/Documentation/devicetree/bindings/mux/mmio-mux.txt
> > > > > new file mode 100644
> > > > > index 0000000000000..11d96f5d98583
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/mux/mmio-mux.txt
> > > > > @@ -0,0 +1,56 @@
> > > > > +MMIO bitfield-based multiplexer controller bindings
> > > > > +
> > > > > +Define a syscon bitfield to be used to control a multiplexer. Th=
e parent
> > > > > +device tree node must be a syscon node to provide register acces=
s.
> > > > > +
> > > > > +Required properties:
> > > > > +- compatible : "gpio-mux"
> > > > > +- reg : register base of the register containing the control bit=
field
> > > > > +- bit-mask : bitmask of the control bitfield in the control regi=
ster
> > > > > +- bit-shift : bit offset of the control bitfield in the control =
register
> > > > > +- #mux-control-cells : <0>
> > > > > +* Standard mux-controller bindings as decribed in mux-controller=
=2Etxt
> > > > > +
> > > > > +Optional properties:
> > > > > +- idle-state : if present, the state the mux will have when idle=
=2E The
> > > > > +	       special state MUX_IDLE_AS_IS is the default.
> > > > > +
> > > > > +The multiplexer state is defined as the value of the bitfield de=
scribed
> > > > > +by the reg, bit-mask, and bit-shift properties, accessed through=
 the parent
> > > > > +syscon.
> > > > > +
> > > > > +Example:
> > > > > +
> > > > > +	syscon {
> > > > > +		compatible =3D "syscon";
> > > > > +
> > > > > +		mux: mux-controller@3 {
> > > > > +			compatible =3D "mmio-mux";
> > > > > +			reg =3D <0x3>;
> > > > > +			bit-mask =3D <0x1>;
> > > > > +			bit-shift =3D <5>;
> > > > > +			#mux-control-cells =3D <0>;
> > > > > +		};
> > > > > +	};
> > > > > +
> > > > > +	video-mux {
> > > > > +		compatible =3D "video-mux";
> > > > > +		mux-controls =3D <&mux>;
> > > > > +
> > > > > +		ports {
> > > > > +			/* input 0 */
> > > > > +			port@0 {
> > > > > +				reg =3D <0>;
> > > > > +			};
> > > > > +
> > > > > +			/* input 1 */
> > > > > +			port@1 {
> > > > > +				reg =3D <1>;
> > > > > +			};
> > > > > +
> > > > > +			/* output */
> > > > > +			port@2 {
> > > > > +				reg =3D <2>;
> > > > > +			};
> > > > > +		};
> > > > > +	};
> > > >=20
> > > > So Pavel (added to Cc:) suggested to merge these into one node for =
the
> > > > video mux, as really we are describing a single hardware entity that
> > > > happens to be multiplexing multiple video buses into one:
> > >=20
> > > Two drivers will be needed in a way or another to disconnect the depe=
ndency
> > > between the video switch driver and the MUX implementation. Are there=
 ways
> > > to do that cleanly other than having two devices?
> >=20
> > Yes.
> >=20
> > Device tree describes hardware, not the driver structure.
>=20
> I think you you could view the MUX control as a device, too, and that's
> separate from the actual video switch.

Actually, I believe what matters here is hardware. There's some chip,
somewhere, that does the switching, and the device tree should should
basically describe that switch.


									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj1/d8ACgkQMOfwapXb+vKAJwCfWbgb0nzf1+I9LEgozU1NPDji
0fUAoMRrSSgwTCjlnY28ny2ZKLbncSDQ
=wgIl
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
