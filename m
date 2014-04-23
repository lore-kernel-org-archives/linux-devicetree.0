From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 6/8] ARM: sun6i: Sort the NMI node by
 physical address
Date: Wed, 23 Apr 2014 15:11:42 +0200
Message-ID: <20140423131142.GR24905@lukather>
References: <1397724379-15398-1-git-send-email-maxime.ripard@free-electrons.com>
 <1397724379-15398-7-git-send-email-maxime.ripard@free-electrons.com>
 <201404231439.26549.arnd@arndb.de>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DzFMwNuU1QL7hgxO"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBWHZ32NAKGQEOMBHCRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201404231439.26549.arnd-r2nGTMty4D4@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--DzFMwNuU1QL7hgxO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 02:39:26PM +0200, Arnd Bergmann wrote:
> On Thursday 17 April 2014, Maxime Ripard wrote:
> > The DT are supposed to be ordered by physical address. Move the NMI nod=
e where
> > it belongs.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Thanks!

Just applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--DzFMwNuU1QL7hgxO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTV7wOAAoJEBx+YmzsjxAgnIwP/RoS5ePrSE58YIbkgXI9bw/a
XOVHEk5vul8XGhOAUp3FL1O2Ux19wk+VGmUzXOH426tXJn7FBmrJiKZuBt7ulAwh
j7kUKtHRV6zvkHcNnRStruCY8zSTxHo7DfgPGWCDJ7B6jUOQHk27ftOOWDZYGoLZ
MQmEukdSVvSIgNpZ09zpHrUwrvDFYPnLak1eKBV1sHb8o3BGk2aexRDNZZ/OU4ut
3+346wgHBp5In1q1HrrNAn+gtXHDTWyWgzf5PXdCnqMJFLzVfG/xAAk6Ktoco1SJ
81m9sot+r67bHSc4edHhMp2CjPz0XVbWE/O2lifcBIOCGOhYasPCaBrlrIg1Qmim
1O0plBUJKsZ/41tDH/LuK+fbyYLY7LBes7dUojCl0r/X8s+gHEE8WEdda+C1jPez
QH15fBbALtrr5gtHDzW62hlOzBiwpgE1DZ8wvcpsI5QKm1dCCj0ajF6Nowx9bUis
PcJDjiKDT4r5GShTtRQesQde5sze7tkoDYmL/dYr9qq3Gu7x+VMVR8UH9C0rPm+Q
k+XBg/oKCdEvGOSqLOrYpIUaUuoiJ9mrKzuoFnQrLEXBV5/nIaCUu0F9y7D2ls07
Zw17eslEBJt0Xk1YnS6BHUX4d4Pn/9sxH56rYh9Hg7jasOnWkecvXJe8/IB1eTuS
n7dprVEfVDhtTonxqQz8
=lqrT
-----END PGP SIGNATURE-----

--DzFMwNuU1QL7hgxO--
