From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/8] ARM: sun8i: a33: Mali improvements
Date: Thu, 23 Feb 2017 16:19:21 -0800
Message-ID: <20170224001921.wsis65um3jnhtpil@lukather>
References: <10fd28cb-269a-ec38-ecfb-b7c86be3e716@math.uni-bielefeld.de>
 <CACvgo51p+aqegjkbF6jGggwr+KXq_71w0VFzJvFAF6_egT1-kA@mail.gmail.com>
 <20170217154419.xr4n2ikp4li3c7co@lukather>
 <CACvgo51vLca_Ji8VQBO5fqCrbhpm_=6mrqx1K-7GddVv5yMKWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0514642027=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACvgo51vLca_Ji8VQBO5fqCrbhpm_=6mrqx1K-7GddVv5yMKWg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============0514642027==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qtgdrqfl5qdnwbjc"
Content-Disposition: inline


--qtgdrqfl5qdnwbjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 17, 2017 at 08:39:33PM +0000, Emil Velikov wrote:
> As I feared things have taken a turn for the bitter end :-]
>=20
> It seems that this is a heated topic, so I'l kindly ask that we try
> the following:
>=20
>  - For people such as myself/Tobias/others who feel that driver and DT
> bindings should go hand in hand, prove them wrong.
> But please, do so by pointing to the documentation (conclusion of a
> previous discussion). This way you don't have to repeat yourself and
> get [too] annoyed over silly suggestions.

http://lxr.free-electrons.com/source/Documentation/devicetree/usage-model.t=
xt#L13

"The "Open Firmware Device Tree", or simply Device Tree (DT), is a
data structure and language for describing hardware. More
specifically, it is a description of hardware that is readable by an
operating system so that the operating system doesn't need to hard
code details of the machine"

http://lxr.free-electrons.com/source/Documentation/devicetree/usage-model.t=
xt#L79

"What it does do is provide a language for decoupling the hardware
configuration from the board and device driver support in the Linux
kernel (or any other operating system for that matter)."

And like I said, we already had bindings for out of tree bindings,
like this one:
https://patchwork.kernel.org/patch/9275707/

Which triggered no discussion at the time (but the technical one,
hence a v2, that should always be done).

> - The series has code changes which [seemingly] cater for out of tree
> module(s).

That patch was dropped, only DT changes remains now, and do not depend
of that missing patch anyway.

> Clearly state in the commit message who is the user, why it's save to
> do so and get an Ack from more prominent [DRM] developers.

DRM is really not important here. We could implement a driver using
i2c as far as the DT is concerned.

FreeBSD for example uses a different, !DRM framework to support our
display stack, and still uses the DT.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qtgdrqfl5qdnwbjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYr3wEAAoJEBx+YmzsjxAgEO8P/2RPiI1tCakZ/C8Bv7y6nNkL
R0cAOiZEI6SJsxwKM9cP0LtC0jaZYTaRKy1SS5VXm9DCtPx00yhABI3FeXlFdwdW
Vq64affQg5owXUI365hARieEPXSNJMvC+nUYVv42QtKIL4U9+H//7ez4hcLTWb/B
GhWo369UALIN/dhtrfF+xL3Cf85S9/AMl7ct4oIlnnzbZI9hX+5r4uZ+rBoY0UO0
mbRemuJ5zny74epRcG1snLVlDl/a+8GTlcnDpY6E6E5Uqx3XpdHYMJxzaGxWYaiR
72sYAgIN9l2gZ1TIY8+Sv1LLRL365MwF8SJoeOe3r3BcBz+slFoaBqvC2USiZF9E
x5RgdbUy5DGppXGuo2xSkzR8/nY1uQFZ6xqnV7SILqHY6tD656wgdLb/mLZVQBxM
UyvfMiPnTqGcvpU0FkebGo8Zw/pUzjAGEtuVqKmYCsaUM9SUCjonPCtD5aAmcBMu
Ooe+ik2yAHDe0DxUbm7RcxcAD/uO7rAYTc3sDDMJHjctCEaRu2/eU6ZUQsJZG8xv
CCIWTGAxMefbQDlVorIDsYGIVsHDdRH1xopWTU+PSt7+4GnD+eYjAcBlGk8wSg0V
krPU+HUTNJp8MphOZpKjATpaaM+HT+sGk+WQOl5NgwOAFvKC6AdrQOIl8hJ2pyZN
eYUVvxLmF2lgIedeU3r5
=+DZ7
-----END PGP SIGNATURE-----

--qtgdrqfl5qdnwbjc--

--===============0514642027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0514642027==--
