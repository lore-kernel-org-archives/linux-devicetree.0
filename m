From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 03/11] drm: sun4i: ignore swapped mixer<->tcon
 connection for DE2
Date: Tue, 13 Jun 2017 11:46:18 +0200
Message-ID: <20170613094618.hxjuc5yx7udypbxh@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-4-icenowy@aosc.io>
 <20170607093512.rfvpefmyskgjw3ik@flea.lan>
 <01A7F22E-C4FF-4B4B-A9BC-FF0C96B996B9@aosc.io>
 <20170607143827.4ng5gedvzn3f5pyx@flea.lan>
 <66881eac1dd06d918692482bdb1ea9e6@aosc.io>
 <20170609144649.67i3zscq26jt5hhe@flea.home>
 <03e5cb4ada3e19ed3476e1d562450f6f@aosc.io>
 <0b7d3cc334929ab2464477bbccc37e31@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0636143716=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <0b7d3cc334929ab2464477bbccc37e31@aosc.io>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: icenowy@aosc.io
Cc: devicetree@vger.kernel.org, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>, linux-sunxi@googlegroups.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0636143716==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="42uig743fx76vuiw"
Content-Disposition: inline


--42uig743fx76vuiw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 10, 2017 at 11:16:35PM +0800, icenowy@aosc.io wrote:
> =E5=9C=A8 2017-06-10 22:57=EF=BC=8Cicenowy@aosc.io =E5=86=99=E9=81=93=EF=
=BC=9A
> > =E5=9C=A8 2017-06-09 22:46=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=
=BC=9A
> > > On Thu, Jun 08, 2017 at 01:01:53PM +0800, icenowy@aosc.io wrote:
> > > > =E5=9C=A8 2017-06-07 22:38=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=
=EF=BC=9A
> > > > > On Wed, Jun 07, 2017 at 06:01:02PM +0800, Icenowy Zheng wrote:
> > > > > > >I have no idea what this is supposed to be doing either.
> > > > > > >
> > > > > > >I might be wrong, but I really feel like there's a big mismatch
> > > > > > >between your commit log, and what you actually implement.
> > > > > > >
> > > > > > >In your commit log, you should state:
> > > > > > >
> > > > > > >A) What is the current behaviour
> > > > > > >B) Why that is a problem
> > > > > > >C) How do you address it
> > > > > > >
> > > > > > >And you don't.
> > > > > > >
> > > > > > >However, after discussing it with Chen-Yu, it seems like you'r=
e trying
> > > > > > >to have all the mixers probed before the TCONs. If that is so,=
 there's
> > > > > > >nothing specific to the H3 here, and we also have the same iss=
ue on
> > > > > > >dual-pipeline DE1 (A10, A20, A31). Chen-Yu worked on that a bi=
t, but
> > > > > > >the easiest solution would be to move from a DFS algorithm to =
walk
> > > > > > >down the graph to a BFS one.
> > > > > > >
> > > > > > >That way, we would add all mixers first, then the TCONs, then =
the
> > > > > > >encoders, and the component framework will probe them in order.
> > > > > >
> > > > > > No. I said that they're swappable, however, I don't want to
> > > > > > implement the swap now, but hardcode 0-0 1-1 connection.
> > > > >
> > > > > We're on the same page, it's definitely not what I was mentionning
> > > > > here. This would require a significant rework, and the usecase is
> > > > > still unclear for now.
> > > > >
> > > > > > However, as you and Chen-Yu said, device tree should reflect the
> > > > > > real hardware, there will be bonus endpoints for the swapped
> > > > > > connection.
> > > > >
> > > > > If by bonus you mean connections from mixer 0 to tcon 1 and mixer=
 1 to
> > > > > tcon 0, then yes, we're going to need it.
> > > > >
> > > > > > What I want to do is to ignore the bonus connection, in order to
> > > > > > prevent them from confusing the code.
> > > > > >
> > > > > > If you just change the bind sequence, I think it cannot be
> > > > > > prevented that wrong connections will be bound.
> > > > >
> > > > > This is where I don't follow you anymore. The component framework
> > > > > doesn't list connections but devices. The swapped connections do =
not
> > > > > matter here, we have the same set of devices: mixer0, mixer1, tco=
n0
> > > > > and tcon1.
> > > > >
> > > > > The thing that does change with your patch is that before, the bi=
nding
> > > > > sequence would have been mixer0, tcon0, tcon1, mixer1. With your
> > > > > patch, it's mixer0, tcon0, mixer1, tcon1.
> > > > >
> > > > > So, again, stating what issue you were seeing before making this =
patch
> > > > > would be very helpful to see what you're trying to do / fix.
> > > >=20
> > > > So maybe I can drop the forward search (searching output) code,
> > > > and keep
> > > > only the backward search (search input) code in TCON?
> > > >=20
> > > > Forward search code is only used when binding, but backward
> > > > search is used
> > > > for TCON to find connected mixer.
> > >=20
> > > It is hard to talk about a solution, when it's not clear what the
> > > issue is.
> > >=20
> > > So please state
> > > > > > >A) What is the current behaviour
> > > > > > >B) Why that is a problem
> > > > > > >C) How do you address it
> > >=20
> > > We'll talk about a solution once this is done.
> >=20
> > (All those things are based on the assumption that mixer0, mixer1, tcon0
> > and tcon1 are all enabled in DT. If one group of mixer-tcon pair is
> > fully
> > disabled in DT it will behave properly.)
>=20
> So there's a temporary workaround -- only enable one pipeline and disable
> the unused mixer and tcon totally.

As a short-term workaround, while we rework the code to enable both
pipelines, it definitely works for me.

Maxim

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--42uig743fx76vuiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZP7RqAAoJEBx+YmzsjxAgc1gP+QEur+Yq1XfbJxcXnAPP0k5H
YOU7F95LCoBi/rnEp5upfNlvJ9h3gf9FCQXzmpJlDeyoaLnj6vfg8hxPiC9lQNXL
7n+gtnjmx1a1C/PcCmaMr+G8UUJUfGxe4xgKiKYvgOozyFBBdm0IGGzs1FCUdNwf
ABtZ4bIVTNx65S8KT8nNDL5I34EMP5u0xXjyrsMnFXv0jMvqy6Tk5kLNx54IErI6
abMZGNohc0O6pRczVpvRE+w1115RJZ4o12x3kNJuvVo2edY0mkfCroRDvuksAhKk
bK8UzMGUWWuGp9YWJYEyXQnfzq+A5KTKDp1b4TXCSx7VMFWCnxCD+mivEkZtGR/N
IFmCImun5KYLuStB/6cch3jTmQcLgfkgky/pjRqzkY9edLln8iDjB6ec8BIbhDqE
VhWVrdLFMCNWAjv8n6GpFFGFCfNAPj7pemvhsDYhXQgXDdN997FXvy09RrBQqjxn
42JYYnGbi7rVCgJB7xfnKhIUscQd4Qx6vmvMK5Lper5k90t8ZfLz9vEyF59Lf3rV
TGARbSvuXH03hrjCl2c78g3eDrw526yQehCBnmPu3/v/zbapqsUnV0p7ObtZSJzP
vlJDocjDnKagK1YWgt70JMQx5PCPaTGPh7h3tpjHEUW2uPQQ6FntwPmwdSvhozRL
0Z+KSUSfmm7WPFmNJTIY
=pYPE
-----END PGP SIGNATURE-----

--42uig743fx76vuiw--

--===============0636143716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0636143716==--
