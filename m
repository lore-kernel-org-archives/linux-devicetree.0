From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add dts file for pcDuino 3 Nano board
Date: Mon, 26 Jan 2015 11:09:21 +0100
Message-ID: <20150126100921.GQ8470@lukather>
References: <1422199921-325-1-git-send-email-ats@offog.org>
 <20150125164846.GL8470@lukather>
 <20150126003520.GA871@cartman.at.offog.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AFQGHouA0VN8Ovbt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150126003520.GA871-dFjyuVMluBNBLe56cvE0J2D2FQJk+8+b@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--AFQGHouA0VN8Ovbt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2015 at 12:35:20AM +0000, Adam Sampson wrote:
> Hi Maxime,
>=20
> On Sun, Jan 25, 2015 at 05:48:46PM +0100, Maxime Ripard wrote:
> > > +			label =3D "pcduino3-nano:green:led3";
> ...
> > > +			label =3D "pcduino3-nano:green:led4";
> > Where are the three other leds?
>=20
> LED1 is the power LED, and as far as I can see there isn't an LED2 on
> the board. LED5 is next to LED3/4, but it's not exposed by the 3.4
> kernel that LinkSprite ship, and this forum post says it's not
> software-controllable (which seems weird):
> http://forum.linksprite.com/index.php?/topic/3145-pcduino3-nano-led-contr=
ol/
>=20
> > Also, usually, the last part of the label is what the led function
> > usually is.
>=20
> "LED3" and "LED4" are how those LEDs are actually labelled on the board
> (unlike the pcDuino v3, which labels them "TX" and "RX", and calls them
> pcduino3:green:rx/tx in the DTS). I've changed them to
> pcduino3-nano:led3:usr and pcduino3-nano:led4:usr, but if you've got any
> better suggestions then please let me know!

It depends on what the leds are used for, but this is not what the
label should be either.

If you read Documentation/leds/leds-class.txt, the pattern to follow is:

"devicename:colour:function"

so it should rather be pcduino3-nano:green:usr1 and usr2, or some
other thing.

> > > +&uart0 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&uart0_pins_a>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&uart2 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&uart2_pins_a>;
> > > +	status =3D "okay";
> > > +};
> >=20
> > You probably want aliases for these two UARTs.
>=20
> Done: I've aliased serial0 =3D &uart0 and serial1 =3D &uart2. Should there
> be aliases for I2C as well, since the same situation applies (i2c0 and
> i2c2)?

Yep.

> More generally, is it correct to add nodes like these (uart2, spi0,
> i2c2) for features that appear on the Arduino GPIO headers?

If those pins are specifically dedicated to this feature, then yes.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--AFQGHouA0VN8Ovbt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUxhJRAAoJEBx+YmzsjxAgPQwQAL3HsFKy0S+vnwdGN1UFEQqp
9VjgCu/BLjMbkvkYC+4tlwHKViU7ZqfvFOjWnmNrVYpBNQpBjoMZSlzM9iSRnjhI
XofUbFRzhFdzJz2xX0d8ecJee4Uy51Wnvbm2VzMhV8l74w62FgLYllD0Orxdx+Km
4/WTe3/0SngB7zN1j/EDXClQtHwNkpbkDP+NG5SLqQSIrmPRwvmJyKj4Ca3LjV+k
9j/cV+wn8jic31Lpczonzo0ECetX3RLIrzZO06KUQbtH/Ax1UKTT0B643parVNq3
IKLibxzFnETUjQaw5ucZkN2qWqhfQiDeVwTXr3TDwoUUqmWcCSgO5O2u3xKxeIPY
o+9PWB33PbWCIrckCqkQy8V0cx38wFfyFE51dQLIEgMt9IqoPboPTp+E7+2iHteF
CFNwkxiC06WtP/3dqrrMUefYdK+1+KB/Ynvjh5p7ur0WCtgfcVnoW7WpztvCFNxZ
//8TIiXJFFLjhOB6L+abqQkL4lzs4fhvdKEG6Lzye1wXmG0CkG7Lg3ADP+qI0ITH
aIryQz6SPKEUrPHY9/bObDYIX7UjwK3/SeC3RC8KBPwT5Ji837hkuI2Z19U0/CfV
v3uypPC2CoqoU9Uf6wHXrYWv0j1p1kmmDH1ET5wQepTVco3m32ORnpMMO/Ig1YML
BR5kd1MFNG8yDmq/haVM
=Fs02
-----END PGP SIGNATURE-----

--AFQGHouA0VN8Ovbt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
