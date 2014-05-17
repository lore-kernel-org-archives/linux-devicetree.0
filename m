From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sunxi: dt: build DTs according to new
 MACH_SUNxI Kconfig symbols
Date: Sat, 17 May 2014 18:41:14 +0200
Message-ID: <20140517164114.GL29258@lukather>
References: <1400332280-5398-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibe32dcbQs37CEZO"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBDVE32NQKGQEZ47XB3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1400332280-5398-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ibe32dcbQs37CEZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2014 at 09:11:20PM +0800, Chen-Yu Tsai wrote:
> Allwinner sunxi support has been split into the various SoCs in Kconfig.
> Adapt the new symbols for the device trees.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>=20
> Hi,
>=20
> This patch lets us build the DTBs according to the SoCs we selected in
> kernel config. This matches the build behavior of the kernel itself
> after splitting up sunxi support to various SoCs in Kconfig.
>=20
> Maxime, could you take this?

Applied, thanks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ibe32dcbQs37CEZO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTd5EqAAoJEBx+YmzsjxAgT9QQALHSM4D2pfP1Ck1Ul2nevDuo
YacPb8l8sTN/qdP7NRJubDK6/R0FIzInqUWJKSbIJ9rA4S3QBy6Y63h+D6l7LdXb
yDpZLbXJuldGicxyI4rdLeDUrBofuRZnDQBwtGmkgchFT83gMFZgMn7qzhv3+R5G
MukJOCIULYbQkRG1tlZkTsoDpwpMVjRQHzinHpv9R4EFMKTXVhz/nbGHKMefjs0L
QAoI5pQ5psaKgI+X3+jV9Gfqowkt7IRC7oNTeoRQiM+8DE+LKRxYgrAJwyIKVSfR
4NxPz7jA7uzf0A8cPwFKkxa8g6hWIyOo7KR4Pu9aFuujOiJfvDWEL7/EDtudwEk8
0CKs5Lw80gK7fVmZ1DFCq7A62++eFjuotISOY17LUb+c2CfEBMYAvqOmpau4puS4
LFFEDRtSyrIEv/6HqVNXKZqglF2JxAHp7xkENOK231unCnQmCVt3P5HLXpKrzlvM
Q1xZyyHPX7m/LKpkJ1Nj6HONsa1KxTRjyVaHrL75EnZ1C0BYYwUE68sBGF6yGugK
yUPhFXxLHiych7UBfJnbKHMH6MjkQ91eqHyjnWJxf16POVdlpYxnVoeCnibJThPX
EUkSdgJzSy3qrQZuiyRV+DRlNhc/d2ytvimueKoIdnpkLEiyiluGU5seIYftFtAx
Fb0oZs3AqOS/l61e4xI7
=VR85
-----END PGP SIGNATURE-----

--ibe32dcbQs37CEZO--
