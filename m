From: Eric Anholt <eric@anholt.net>
Subject: Re: [RESEND PATCH v2 0/7] drm/vc4: VEC (SDTV) output support
Date: Fri, 02 Dec 2016 15:59:11 -0800
Message-ID: <877f7hrigg.fsf@eliezer.anholt.net>
References: <1480686493-4813-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1674456759=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480686493-4813-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Scott Branden <sbranden@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>, Ray Jui <rjui@broadcom.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1674456759==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> Sorry for the noise, but I forgot to Cc the DT maintainers.
>
> Here is the 2nd version of the VC4/VEC series.
>
> We still miss the two clock patches mentioned by Eric in the first
> version to make the encoder work no matter the setting applied by the
> bootloader.

I'm happy with the series and I'm just waiting for the DT ack.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlhCCs8ACgkQtdYpNtH8
nuibhg/+KOziKF3l+lC7sE3jSXpQH2U9HArD8aikwFYwca48CIeWoqoeumeTMfOu
cKzkkMAy5oi6RskpYvu70WicLhcxmAxsx0R0QEZQ2YstsF/6Z+KeSw4MrQgFP3Fi
Hz9fGGCI91V0Tlc/nmYKpfKjy3pXOB3ZwJVtcJ6hFNbEtOat0N4yVk16FgT3XlT4
ZGLVd5ssC3Lkk6RbieUWmMci07RR7hwpHr0+qwAJYoeLiNqbR8yce+vSz1Rwhgux
fsgoW6PmQxPo9U0UN5hFpUIDMIALFlGdTKCF1wckr8Vu/2CnDhyU491rIcw4zzy0
o/k4j3R/C53x4zPa3wYhqzNWD8anY6JR7LZZi6XBEDwvvUuU7uTPJvEhB1w5Z0yq
VdKY64iwAPU8PQG2TQ1O9DdQHDwWrfl4JMQ3OctulPca+XJr0OloRzPOOrX6DT8u
cCknMl1GxtJtpCBuXgs9EeuEfn/E5VrKMSIpN4QLj+o4fxGXSiDpAY7MGWVwx/rd
vLA+IWQDTniwdQ8b4TvBIbYqh7f5BxDo5S5fza7RCax2dKPbmNEHMlxsm7oiNmzX
6QrDDclq2inO9nCJeYTKQBLgtDklZEP0Y/hsye8pLd7cozBUU110ULxLUToEZ3/5
ey5HVwd0QU4qsYh3m5PNFhAi0i3zc0KG6bT70CRXBy/qG9BKJxc=
=D5mZ
-----END PGP SIGNATURE-----
--=-=-=--

--===============1674456759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1674456759==--
