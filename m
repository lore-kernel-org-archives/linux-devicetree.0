From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH RESEND] display: panel: Add KOE tx14d24vm1bpa display
 support (320x240)
Date: Tue, 29 May 2018 17:22:25 +0200
Message-ID: <20180529152225.GB16038@ulmo>
References: <20180412143715.6828-1-lukma@denx.de>
 <20180509154338.2841-1-lukma@denx.de>
 <20180519130533.2494bceb@jawa> <20180528095519.799adadc@jawa>
 <20180529143047.GB22634@ulmo> <20180529170148.7a0363f2@jawa>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0882842986=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180529170148.7a0363f2@jawa>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0882842986==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 29, 2018 at 05:01:48PM +0200, Lukasz Majewski wrote:
> Hi Thierry,
>=20
> > On Mon, May 28, 2018 at 09:55:19AM +0200, Lukasz Majewski wrote:
> > > Hi,
> > >  =20
> > > > Hi Thierry,
> > > >  =20
> > > > > This commit adds support for KOE's 5.7" display.
> > > > >    =20
> > > >=20
> > > > Thierry, shall I perform some more work on this code, or is it
> > > > eligible for applying to your tree? =20
> > >=20
> > > Gentle ping. If Thierry is overworked - maybe there is a
> > > co-maintainer so he/she could apply this patch? =20
> >=20
> > Please use the proper prefix for the commit subject to increase the
> > chances of this being noticed.
>=20
> Ok. Is there any list of prefixes in the kernel repository, so I could
> look for them (like get_prefix.py - similar to get_maintainer script)?

I don't think there is. A good rule of thumb that I use is to go over
the git log for the last couple of commits and see if there's a clear
pattern. This doesn't work for every subsystem, but drm/panel is very
consistent in this regard, on purpose.

> I've used "display: panel" prefix, but I should have used "drm/panel"
>=20
> >=20
> > This is also still missing a Reviewed-by or Acked-by from Rob.
>=20
> Rob has already reviewed this patch. I will send v2
> with Rob's Reviewed-by tag.

Okay, I'll apply that v2 then.

Thanks,
Thierry

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlsNcC4ACgkQ3SOs138+
s6GNJg//QNwLTu5zJwMdcqqDu33Oa89ye5Kn1PBUfKG1koPdAlzfrA+J1kpIqUlB
6c5sG0tDvyMLxM7LAj3gSIISTnWZ3SeUW1VItbfHuitLWJdN0k9BkMuGturoc6jG
tDs6BiKY5UONRR618Qpauo84aBt+HTnmzvlRWmOJwAPlQmRxQZccyGlE1yuKJnCN
AXA/2A4tWHJ6K+pQ6DsJRjtcj/q/QNv+5VBZ5OOlYuQU+fnuZUgObOtUEACAF47X
TLCpfBVMw8IWRxeM1GuOhvfWPEW20W6vmS68iY5MgtL8KAAXQKWc7zeFN6MmeN93
GUIRqUdmX/D5dakKNLZZGGi2HmDaq5NUv4JGhwqpXH2FkDlOzBRQexAAVx95B6Ft
8KRah9aDcAy1DppyTUZrKAErjd2hIeBGbbL2rsYjd3JYO6WotC8ohExOzurcz5uI
1dIV3kNmqa5mFGEh45j/mxPMypGRF3xP31HJ3RRBk54MVQSAL2av+kbU3p8ua/MH
hdVLeNrM+di6Q/0RKgbWMm7mTLkNu3wigS/OMcBm6kW7HvCbsgU7khuHRBVNywkG
BTVf5cc+kUoyP5k/U5AGB+VDU7OAj441EtIO7wgb/hf8NxDxFpBSEO28qmTv5XgA
3zRpuRO7gfp+IepgU2LgpLdsfBuxBIwadKQJ8tikYOZcNCUiUM4=
=bLev
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--

--===============0882842986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0882842986==--
