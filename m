From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/7] drm/tinydrm: Add helper functions
Date: Tue, 7 Feb 2017 12:44:19 +0100
Message-ID: <20170207114419.GG29507@ulmo.ba.sec>
References: <20170131160319.9695-3-noralf@tronnes.org>
 <20170206085629.GD27607@ulmo.ba.sec>
 <20170206090918.6rqr6l7pd62znl5j@phenom.ffwll.local>
 <20170206093556.GF27607@ulmo.ba.sec>
 <CAKMK7uHgW15EPpPSU2se7r89JCGD_oTvn9ZJptYaNJAWMKb9Fg@mail.gmail.com>
 <20170206110847.GH27607@ulmo.ba.sec>
 <20170206155303.2fwihmlh6ln4eskt@phenom.ffwll.local>
 <CAPM=9tywXAt8v4VwjHA7OhsW6Xg=w8gDeY5s+fHjhdmuUUG7gg@mail.gmail.com>
 <20170207111128.GE29507@ulmo.ba.sec>
 <20170207112128.gzgxmry3ttkcud7y@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1082882210=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170207112128.gzgxmry3ttkcud7y@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dave Airlie <airlied@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org


--===============1082882210==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wtrm9ATX0sn6fFKv"
Content-Disposition: inline


--Wtrm9ATX0sn6fFKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 12:21:28PM +0100, Daniel Vetter wrote:
> On Tue, Feb 07, 2017 at 12:11:28PM +0100, Thierry Reding wrote:
> > On Tue, Feb 07, 2017 at 08:28:16AM +1000, Dave Airlie wrote:
> > > >
> > > > I definitely don't want that we don't attempt this. But brought fro=
m years
> > > > of experience, I recommend to merge first (with pre-refactoring alr=
eady
> > > > applied, but helpers only extracted, not yet at the right spot), an=
d then
> > > > follow up with. Because on average, there's way too many trees with
> > > > overloaded maintainers who maybe look at your patch once per kernel
> > > > release cycle.
> > > >
> > > > If you know that backlight and spi isn't one of these areas (anythi=
ng that
> > > > goes through takashi/sound is a similar good experience for us on t=
he i915
> > > > side), then I guess we can try. But then Noralf has already written=
 a few
> > > > months worth of really great refactoring, and I'm seriously startin=
g to
> > > > feel guilty for volunteering him for all of this. Even though he se=
ems to
> > > > be really good at it, and seems to not mind, it's getting a bit sil=
ly.
> > > > Given that I'd say up to Noralf.
> > > >
> > > > In short, there's always a balance.
> > >=20
> > > I don't think we can make a rule for this, it will always depend on t=
he
> > > code. There is always going to be stuff we put in drm that should go
> > > elsewhere, and stuff that is elsewhere that drm should use.
> > >=20
> > > I think however if we do add stuff like this, someone should keep tra=
ck
> > > of them and try to make them get further into the kernel.
> >=20
> > Yes, I think having some sort of TODO in drivers/gpu/drm could help
> > track things that we know should eventually be moved out. It could serve
> > as a list of janitorial tasks for newcomers that want to get their hands
> > dirty and tackle relatively trivial tasks.
>=20
> We have this list already, it's at: http://www.x.org/wiki/DRMJanitors/
>=20
> I guess I should highlight it more, maybe even add it to the docs? Eric
> just asked about it last week too.

Yeah, I'm aware of that list. I think it's a little problematic that
it's in a wiki and far removed from where the actual work is happening.
I think we should just take that list and add it as a TODO in
drivers/gpu/drm, or alternatively keep it as part of the GPU
documentation. That way we can more easily mark things as done or add
new stuff as work gets done.

For cases like this I think we could just add new items as they are
pointed out during review. For things that are already merged we can
add items separately. Once the refactoring is done, the patch series
can contain a final patch that simply removes the items again. I think
that has much less potential to become out-dated than a separate wiki
page.

FWIW, I'll volunteer to move the list to git if we decide to go ahead
with that.

Thierry

--Wtrm9ATX0sn6fFKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliZsxMACgkQ3SOs138+
s6EeKA//U7mr+twBhFnKOZf/LeamUMOv0E20Dh2Bv4OuY96o/Wkwe8Fl+NJHA/3m
hDvA4gXy9GVzl1XJZy0byEjikhkfmCl6lNtvfiiWtgdeLm93WxACMsSFpP/QYLSa
ZjUE1Bbo3seDQtanRLZ+ieC4A8GqeIiABiFvmrdujo8Jsu7nX+MwUfC8haGH9e5b
6PL6/YAOH+6lBy7bULhelVq6JkdyBLOdvpzrzc1pzrkPUjqhXn1Mpo8tkj2bLIXW
nTQiN7dWzjm+MMvzzcyLSuCOkS5HS7gMOVCvphXlH5ieZKvkz2PhOUg4wjYs1mRw
O+aCVsvbklVRTGl8SRVM5h1dUN48VBB+hxkZsoQejycirQJOke0Adls1Kr4JkG3O
gxnMMTlf9FIhxVb/5RboVGDJ7/EnIi+XiDme/+Umx81tAME6/GpGv8mZf+PkF1pN
kNTHIx7CKL3xwe0XbG1b8iSJ1x3xmHinJXhSC6dPGVIJoxuWZqaIbHiTtwATOpWV
b+woXXZeY1AzuO8yNmEaWXRrWdA24syjjEAMqkc8zldVKzVb0X1R8f9PEGXS4142
K1dMfwk6NkxCn9gelFO7mH9uQ30rFP0WkVvFx0lkb1P+Mx4UfL+2s8IaaO2YOh26
vN0GQBxwehH0nJv+XEONeDPluiT8Qli96CvTHdGrxmzV0+0cYnk=
=pWjO
-----END PGP SIGNATURE-----

--Wtrm9ATX0sn6fFKv--

--===============1082882210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1082882210==--
