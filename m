From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v1] ARM: dts: sun7i: provide ramoops region on BananaPi
Date: Tue, 27 Jun 2017 15:59:00 +0200
Message-ID: <20170627135900.smezq4mvdowmhbaz@flea.lan>
References: <1498065017-30556-1-git-send-email-linux@rempel-privat.de>
 <20170622061617.5guhcyxdthvmiq7j@flea.lan>
 <48c81184-3713-31a8-03e8-f55ffaef639c@rempel-privat.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="r7u2543jfozqbruv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48c81184-3713-31a8-03e8-f55ffaef639c@rempel-privat.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--r7u2543jfozqbruv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2017 at 08:40:44AM +0200, Oleksij Rempel wrote:
> Am 22.06.2017 um 08:16 schrieb Maxime Ripard:
> > Hi Oleksij,
> >=20
> > On Wed, Jun 21, 2017 at 07:10:17PM +0200, Oleksij Rempel wrote:
> >> This should help provide useful debug information on remote
> >> targets without UART.
> >>
> >> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> >> ---
> >>  arch/arm/boot/dts/sun7i-a20-bananapi.dts | 16 ++++++++++++++++
> >>  1 file changed, 16 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/=
dts/sun7i-a20-bananapi.dts
> >> index ed2f35a..38923bf 100644
> >> --- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> >> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> >> @@ -63,6 +63,22 @@
> >>  		stdout-path =3D "serial0:115200n8";
> >>  	};
> >> =20
> >> +	reserved-memory {
> >> +		#address-cells =3D <1>;
> >> +		#size-cells =3D <1>;
> >> +		ranges;
> >> +
> >> +		ramoops@7fb6a000 {
> >> +			compatible =3D "ramoops";
> >> +			reg =3D <0x7fb6a000 0x100000>;
> >> +			ecc-size	=3D <16>;
> >> +			record-size	=3D <0x00020000>;
> >> +			console-size	=3D <0x00020000>;
> >> +			ftrace-size	=3D <0x00020000>;
> >> +			pmsg-size	=3D <0x00020000>;
> >> +		};
> >> +	};
> >> +
> >=20
> > I'm a bit skeptical about this one.
>=20
> I can understand your concern.
>=20
> > First, there's nothing specific to the bananapi,
>=20
> It is specific to memory size, bootloader used for the board and in some
> cases security co processor. Any thing else I forgot?

Ah, right, you end up depending on the memory size...

> > but every one will want to have different sizes here, or different
> > parameters.
>=20
> I don't thing every one need different configurations. I assume current
> parameters are good enough for most users. But if users need some thing
> different they should be overwritten by kernel boot args.

We're basically stuck between two constraints that are opposing: the
users that don't care about ramoops want to use all the RAM they can
and the users that care about ramoops will probably like to have quite
a big buffer to be able to have as much backlog as possible in case of
a crash.

And then, we'd need to define how much exactly "big enough" is, which
is probably going to be subject to debate across the latter population
:)

> May be, DTS should provide some generic/ramoops area and let
> distributions decide how to use it? For example compile kernel with
> some defaults for ramoops.

That would be difficult to achieve, since you don't know where the end
of the RAM is from one board to another (and even between two variants
of the same board sold in different memory size variants).

> > Since using the kernel parameters is also an option, I'd rather
> > document how to do that with the parameters.
>=20
> Here are my arguments to do this in DTS:
>
> - some issues are hardly reproducible and it is good to catch it as soon
> as possible. So it should be enabled before first problem will happen.

You'll probably need some extra step anyway though, for example to
load the module.

> - my previous experience with pstore was a bit disappointing, it didn't
> worked on SMP system correctly. So the test coverage seems to be
> minimal. Probably because it is not enabled by default.

That's not really a good argument to enable it though :)

> - at least barebox can extract some postmortem information from not
> booting system. Bootloader and Kernel need to use same parameters,
> devicetree seems to be perfect here.

That could be patched in the DT from bootloaders that are able to do
that then? That would even work better, since they know what the
memory size is.

> - distributions should be able to use this per default as soon as this
> option is available.

This is the issue with defaults, no one agree with them. I can
probably give you a good number of people that would not want to have
that memory at waste. And given the number of current users (3), the
default seems to be of not enabling it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--r7u2543jfozqbruv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZUmSkAAoJEBx+YmzsjxAgLJwQAJQ6wVrMVapTsLmYR5svImRA
iOPxL85AxZ1zIqOuktWw0x1OwckfQV4cc3fuv55Sad5py91bu6u+Wg47l2IrQvgw
+GkJevK3vIQixxgj4p+pjCB2KEgrel9xVNu2K4Bet6M8ax4bdcu4uE8ezacFsVbF
sLSc7D/5u8Qo8T69jggnvh2Y/ECJ1kTzgBMvgZpdSWfqhdBfGwBzlPSXRjxIu+T1
5J8PzvgkoFy3YDgOm2JcDsV5+bTcj59EMLYDOBbvmc7XEeNlHa3hLQXSgIB9SMOz
cpGl3zXIkemV9Xm8F0I3BVf83PgjXQKi59CNcPB1n5Td8e0LNSPJoGWP23EhvfKl
3Tws46mdaTUSnMy8zxBxArz36sueFqnd+dYDx2UaP6EpVGOwHZrfzb7PqWXOQawF
robdhlhze86bTO9QL4yTKgotzazzcTk+qaqXR75Lrg1+/kl/KOxNT1AYhu06Tmr2
Gs8pxSdaig8XksJZ8G9aghztJU1hycfRtWZ4+VQR2hqra03ETFhPsannl+tTtCCc
aruxr2iQgm4TapN+XjBnpyqnJ907WjzULJB9YUVpNXa3H8zn1ZkvMxu50cs9f4ts
rY1gP6wA5s9eejVDFnawhiE0gdvBLZvHvkZdbIcFeuapr3BCKraKlbMTBMNZB9Ii
ghjgEnsZ/8Goio6dhqdc
=/fkx
-----END PGP SIGNATURE-----

--r7u2543jfozqbruv--
