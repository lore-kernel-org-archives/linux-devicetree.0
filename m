From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/6] ARM: dts: sun5i: q8-common: Enable various
 peripherals
Date: Wed, 25 May 2016 14:40:53 +0200
Message-ID: <20160525124053.GG9232@lukather>
References: <1463500571-28970-1-git-send-email-wens@csie.org>
 <abbb9686-bbc7-cfad-ec1d-e5f099ac124b@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xjyYRNSh/RebjC6o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <abbb9686-bbc7-cfad-ec1d-e5f099ac124b@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--xjyYRNSh/RebjC6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, May 18, 2016 at 10:13:52AM +0200, Hans de Goede wrote:
> Hi Chen-Yu,
>=20
> On 17-05-16 17:56, Chen-Yu Tsai wrote:
> >Hi everyone,
> >
> >This series enables more peripherals for Allwinner A13-based Q8 devices.
> >The peripherals include the WiFi, the PMIC's micro-usb power supply
> >(driver), audio codec (headphone and speaker), and full display support
> >with the new DRM KMS driver. The series is based on parts of Maxime's
> >"drm: Add Support for Passive RGB to VGA bridges" series, specifically
> >the clk and drm fixes, and common DTS bits.
> >
> >Hans, since you have a collection of q8 tablets, I'm hoping you could
> >test these bits and provide some feedback.
>=20
> I've not run any tests, just looked at the patches, the stuff in
> patch 3 is already present in arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
> I put it there because I saw some .fex files which don't use ldo3 for wifi
> I'm fine with moving it to -common though, I believe that you're right
> that it makes more sense there, having it in 2 places is not really
> useful though.

I'm not quite sure what you mean, do you want Chen-Yu to send a second
version, or are you ok with this patch?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--xjyYRNSh/RebjC6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRZ1VAAoJEBx+YmzsjxAggxUP/iQX9Gu7QkEz8vTDpRowFyfX
9ha5IdYwizhURHZ30d3dkLE/DjAoLOrnLu8vhCPG/5OV/WqApSw3rbeOT1prbsgT
/696EN6KxXn3QQMQ9Em5saZ8wmuNHaWUwtWY/oT558PWmchcYQ37ciKIa+NI3Bm7
uaEgieAK816R9NfVPw7dMk67TPSZqxNboT36l/on4KWojLGMLq67WEHgeMDy4Ga5
K0Lbtv7+dAYv6FJDdUurgGF4oOtyON/Z6SjNqeRHt7VL2f/lqiIjrdp762LIQPLq
rCyQJr910aQmQW7WZhzsmttuOuf47VZD+/FJ2VtvxLmW/x6lzXczwPtjATtzlTvJ
V70rI3CQyMB8MahAFFlSDPZ64qXZ5eX9QmapkQWjydPfcnrNe5M0vtt/lG9XWXp/
fSdZ0OfSLZbQerrsvT4yXbB449K/j5OlbVVd6lEdyNImZ7pcFIMKtS5RRQx39AEH
T5It6jG4AY6rbC8J1lC27rTpJeFk1zRE0fWqNN+oAYAU1CE0nRQKEl86CKfHk/7c
cu5CM0F4wz5htJ7bTvXVG77YmMDXipMTgKRNXyFtsi/aeQd3fifqINPDm+ta4BiG
Vt/5YBH7ukiwb/k36x1dq+syJ8g6e6UrEQZDoKTfgUphQU5TzzSRO+veix9XPE7u
5Os/bNkcuczcSHcN4TME
=JBRh
-----END PGP SIGNATURE-----

--xjyYRNSh/RebjC6o--
