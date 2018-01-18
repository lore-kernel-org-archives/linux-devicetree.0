From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 02/12] clk: sunxi-ng: Change formula for NKMP PLLs
Date: Thu, 18 Jan 2018 11:58:41 +0100
Message-ID: <20180118105841.73rwj3he2exd7pno@flea.lan>
References: <20180117201421.25954-1-jernej.skrabec@siol.net>
 <20180117201421.25954-3-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bjqey3xnhxqbomrf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180117201421.25954-3-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--bjqey3xnhxqbomrf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 17, 2018 at 09:14:11PM +0100, Jernej Skrabec wrote:
> This commit changes formula from this:
>=20
> Freq =3D (parent_freq * N * K) / (M * P)
>=20
> to this:
>=20
> Freq =3D (parent_freq / M) * N * K / P
>=20
> This improves situation when N is in the range 1-255. PLL parent clock
> is almost always 24 MHz, which means that for N >=3D 180 original formula
> overflows and result becomes useless. Situation can be improved if M is
> used as predivider as it can be seen in the second formula. That way at
> least M > 1 is considered, but it still leaves small gap for wrong result
> when M =3D 1 and N >=3D 180.
>=20
> Using M as predivider shouldn't cause any issue, because it is in range
> 1-4 at most, so there is no or only minimal rounding error.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>

I'd really prefer to stick to the formula documented and that we've
used so far. NKMP clocks are most notably used for the CPU PLLs and
I've debugged way too many cpufreq bugs already :)

What about using long long types for the parent * n * k result?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bjqey3xnhxqbomrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpgfeAACgkQ0rTAlCFN
r3QsuA//ZPN9qEwKK3dPLf4cg/Dkj1qD6kvO014duItcgmcz/eNHU4wiQg7ebexf
SSjKctf7Ne5FEnzeyIDq+wxsElAJS49k/xUbDQpLRy3y05LY2WUVw4UnQmPUqC3K
oNmpMkXg7oa2bA5jPWzpbNCRwZUeHay88vqwB/TD5jXeJ+2G0X9MqEHsWOBS9Pyy
jiNLYc2MVASw3d+LWA4wwYYbidGfGSrGfxjcdBtxaRMNV1CU8ZaeAhsSda7e+A7f
tMRjpP02iJh0CMuGqGXhffgCwfnnFp+lfGHynUVY8dXgIF7+MLb/xmfpXvmfu5f7
eq44GdsitmEb/QE0u9ZQR6Jrbatz53+MqpYUrEANTVgBRf6SRS35Ucjt7+W1riBZ
ueuPIAz2xUqfYXJ/q9FKtcZ6Wwoi0hShv32AsSY7vzhxAwsqq5Ckv6INS1bVwKeC
aaGCqRfoRD7EZCmOdi7PGidKncKMZxecjO1TUIoXHl07aDSDawwlsaLusdkLcW5V
qclRtiKiE0uRRcbPcVTs4R9IeensI6lC064Sh1gy/OWlU3s3Kl+bKFvkda5qkZoB
REKPElNO1CRllXTmg4iyJl90nC8y4AuARx3PFLbK/Q48Y/ZTx79WZnWsG7cDxPAX
wMi5U4DstAq5xfXTOw2iG79CDb0v4LDtHTrWzXqWiKwu2rafsqg=
=u95o
-----END PGP SIGNATURE-----

--bjqey3xnhxqbomrf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
