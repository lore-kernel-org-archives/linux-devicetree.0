From: NeilBrown <neilb@suse.de>
Subject: Re: [PATCH 2/3] TTY: add slave driver to power-on device via a
 regulator.
Date: Fri, 12 Dec 2014 16:27:14 +1100
Message-ID: <20141212162714.3a2378df@notabene.brown>
References: <20141211214801.4127.93914.stgit@notabene.brown>
	<20141211215944.4127.4186.stgit@notabene.brown>
	<548A29A4.7060908@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/nGuruU7=j8u7iA3sSe52jru"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <548A29A4.7060908@hurleysoftware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/nGuruU7=j8u7iA3sSe52jru
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Dec 2014 18:32:52 -0500 Peter Hurley <peter@hurleysoftware.com>
wrote:

> On 12/11/2014 04:59 PM, NeilBrown wrote:
> > The regulator is identified in devicetree as 'vdd-supply'
> >=20
> > Signed-off-by: NeilBrown <neilb@suse.de>
>=20
> tty_* is only for tty core functions/data.

I think you are just objecting to the function and type names - is that
correct?  I suspect I can come up with something different.

Thanks,
NeilBrown


--Sig_/nGuruU7=j8u7iA3sSe52jru
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVIp8sjnsnt1WYoG5AQIF9RAAkoi+pYauHtj3C4ERmiZ3mJQZITlYnXE1
WmmnqAxLBa+hhLc/iUNGNmHFCgVCquuxQiwrWjpK44FZfJGnTmy/iVotGo4uWjVY
wGGQd/XSJvnvVppJh/8ycO81ryxFXqj3/zSoaJK0tG9hDRTNeFVIfzP+w9Q1pALT
DYHz7j4gz8w3bK4h3cJCgshp6dNoFMIrgHWAZDMfioUbJMkuPJAfKkwdnH8qCY9M
DcmZQV7uelG42hr+aw9sG6ULt1RvwjY/B/JRhnHqwZJugCz+P5hGy/MdgfM0k5F5
uzQ/p/d1ZfyGUlPCbGKOHgmvRGeS9BnqoeanyqRAdMeJ7jgWrkMtBIkr7cYnI2+u
3BPx+6F26ENyUUJvsjGp/S95PqmygXVG1j7PgDq0ffBFP3ORDBS8HHcGucqbs8YQ
niDxYqMYiJXYAKOH/KiD0H3pm6yhtrkJsYznZNCN3pxkjvFy7wDKI95JtezD8R+9
PQX+LPhfoMXfWbD1aE99Nda0bng37iFMOiDhw9wf8aZJ/6yt2Zz1VFKKX5I+0BVt
G1HSoCCr0KCdRtLgwQwuJTqQxjCgAoNCtnLeWrMt1CbFRreTqQtOH4beCWfqbuVJ
qt8yZzlOEjXIGWdA96l+9OVrydl/N0shf0Xh7e5KXBl6d/bzUDBj28yYzN2S4yPJ
suWpFNRdTds=
=/YQJ
-----END PGP SIGNATURE-----

--Sig_/nGuruU7=j8u7iA3sSe52jru--
