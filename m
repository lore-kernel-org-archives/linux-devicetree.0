From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: How to represent negative values for device tree property
Date: Tue, 2 Apr 2013 17:17:47 +1100
Message-ID: <20130402061747.GI7426@truffula.fritz.box>
References: <5159F760.1080605@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Gk0KcsbyUMelFU1"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5159F760.1080605@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--/Gk0KcsbyUMelFU1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2013 at 02:08:48PM -0700, David Collins wrote:
> Hi,
>=20
> I am working on a thermal driver which needs to be able to read a
> temperature threshold from a device tree property.  The hardware supports
> thresholds in the range -204.8 to +204.7 C in 0.1 C steps.  I have found,
> as I am sure others have as well, that dtc treats a '-' before an integer
> in a dtsi file as a syntax error.  Therefore, I need some artificial way
> to represent negative numbers in device tree.  Here are the possibilities
> that I have thought of so far:

So, as a later posted suggests, dtc does now have integer expression
support, including unary -.  The catch is you have to put your
expression in parentheses, so < (-200) > should work where < -200 >
does not.  The reason for this is that otherwise something like
	<500 -300>
is ambiguous.  It could either mean <(500 -300)> =3D=3D <200> or it could
mean <(500) (-300)>.

It's a bit of a pain, but there's not really any way of fixing it that
doesn't cause more pain along the way.

Well.. while writing that I realised its a bit more complicated.  We
could allow negative literals (similar but different in parsing from
unary -).  But that causes lexing/parsing problems since then
(500-300) (no spaces) would, without extra fiddling, get lexed as:
	"(" LITERAL(500) LITERAL(-300) ")"
whereas the parser would need to see it as
	"(" LITERAL(500) "-" LITERAL(300) ")"
So, maybe there's a way but I haven't thought of it yet.


> 1. Use a second integer to specify the sign of the threshold:
>      20000 mC --> <0 20000>
>     -20000 mC --> <1 20000>
> 2. Use a string instead of an integer to specify the threshold and
>    then convert it to an integer in the driver software:
>      20000 mC --> "20000"
>     -20000 mC --> "-20000"
> 3. Use units of millikelvin instead of millicelcius.  0 mC =3D=3D 273150 =
mK
>      20000 mC --> <293150>
>     -20000 mC --> <253150>

There's always something to be said for using SI units, regardless of
any other considerations.

> 4. Use an arbitrary offset e.g. 0 mC =3D=3D 1000000
>      20000 mC --> <1020000>
>     -20000 mC --> <980000>
> 5. Use the unsigned 32-bit representation for 2=E2=80=99s-compliment
>    signed 32-bit integer
>      20000 mC --> <20000>
>     -20000 mC --> <0xffffb1e0> or <4294947296>

This is effectively what use of unary - in dtc will do.

> Which of these options would you recommend using?  Is there any better way
> to handle negative values that I haven=E2=80=99t listed?  What is the bes=
t general
> case solution for specifying negative numbers in device tree?

In short both (3) and (5) are reasonable, and dtc will help you with
(5).  For the love of god, don't do (1), (2) or (4).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/Gk0KcsbyUMelFU1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFaeAsACgkQaILKxv3ab8Y93QCcC7CNyi9tYGgp3L3R1pcSnO3n
xA8An0OfrTOkr2xYPMzRI+umEFWvSBR0
=AmrE
-----END PGP SIGNATURE-----

--/Gk0KcsbyUMelFU1--
