From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/7] drm/vc4: Add devicetree bindings for VC4.
Date: Wed, 26 Aug 2015 13:51:50 +0200
Message-ID: <20150826115148.GB320@ulmo.nvidia.com>
References: <1439427380-2436-1-git-send-email-eric@anholt.net>
 <1439427380-2436-2-git-send-email-eric@anholt.net>
 <55CEC25E.7070303@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1622969773=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55CEC25E.7070303@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1622969773==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2015 at 10:38:54PM -0600, Stephen Warren wrote:
> On 08/12/2015 06:56 PM, Eric Anholt wrote:
> > Signed-off-by: Eric Anholt <eric@anholt.net>
>=20
> This one definitely needs a patch description, since someone might not
> know what a VC4 is, and "git log" won't show the text from the binding
> doc itself. I'd suggest adding the initial paragraph of the binding doc
> as the patch description, or more.
>=20
> > diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-vc4.txt b/D=
ocumentation/devicetree/bindings/gpu/brcm,bcm-vc4.txt
>=20
> > +Required properties for VC4:
> > +- compatible:	Should be "brcm,vc4"
> > +- crtcs:	List of references to pixelvalve scanout engines
>=20
> s/references to/phandles of/ would be more typical DT language.
>=20
> > +- hvss:		List of references to HVS video scalers
> > +- encoders:	List of references to output encoders (HDMI, SDTV)
>=20
> Would it make sense to make all those nodes child node of the vc4
> object. That way, there's no need to have these lists of objects; they
> can be automatically built up as the DT is enumerated. I know that e.g.
> the NVIDIA Tegra host1x binding works this way, and I think it may have
> been inspired by other similar cases.

Actually the host1x binding was the first of its kind. Unfortunately for
the purposes of this discussion (but fortunately otherwise) Tegra is the
odd-ball it seems. host1x is indeed a physical parent of all the devices
pertaining to the DRM driver, so the DT description is accurate from a
hardware point of view while at the same time giving us a top-level
device that we can bind against.

Now for most other cases it seems like the central piece that they are
missing is this top-level device, hence why the "virtual DRM subsystem
device" is instantiated. I tried to argue in the past that it wasn't a
proper description and proposed alternatives, but I was always pretty
much the only one with this viewpoint, so my comments ended up being
ignored.

Technically there is nothing that would prevent other drivers from doing
without the lists of phandles. On Tegra, again this might be special for
this particular hardware, we've never had a need to describe these kinds
of relationships. Each display controller can essentially drive each of
the outputs, which we deal with elegantly by setting the .possible_crtcs
mask of the encoders.

Also, to pull together all devices that are needed to make up the DRM
device, we use a list of compatible strings in the driver to find these
devices. Then as each of them registers with the host1x bus we wait for
the subdevice list to become empty and ->probe() the component host1x
device.

Note that while this predates component/master, this is all very similar
in principle (Russell and I did have some discussions about this back at
the time, but I'm not sure how much, if anything, he took as inspiration
=66rom the host1x infrastructure). After component/master was merged I did
try to convert Tegra DRM to use it. Things looked pretty good, but ended
up not working because each componentized device must have a unique
master device. This poses a problem because on Tegra we needed the top-
level (i.e. master) device to be shared among multiple drivers.

I posted patches at some point to try and fix remedy the situation but
wasn't able to elicit any reactions, and since I had something that was
working did not pursue this any further.

Thierry

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV3ahRAAoJEN0jrNd/PrOhjQ0P+gPpB0Xtf0ufAkL8Huqh3pAZ
bdDW7W2I8yXh6QPBa3QQ7Ig+hrLA0XnLI5U2vCm4FeXK+ElBVOqXtSMRjjBo1PoQ
zvjGQwsNwtLII3c0ESOastNy1VaXLmfRMHIV3U1ktyMjGzPzAebxljeBkbC6znSt
mMFnuI0Tgq/Ot6Vs0aZHEZsBgzNEPQe2hOrshvBtdEx4GmR/E/T0xehjeDQDjbv7
cHDQsfI7+6ADa/etptJF4f5alX4H/PrAM/cVt3XFdiJIvSM/+Gu3PgjxqslW+xvG
sLlTP2kyHi9JLcuGflBpHG/WBXXZyOMJiR41DCmG5PtdkJFiaGobxkpt7XgLFSFR
gABcn8MgcpQRvueDzib3UnX9cnpg8qRj20DoaN6RGeuHqB23XzJje6qY9NVSHs47
u6vCO1bbhjsBntbe7cmlStIERm56WcjYNzdD9TpYno6oBJGlRcvXCvBTZjv6WsF0
ZWtJiTzA9lYUGnlGUTgzyda8dVzZ2v8So+JfaOFh6lwCIdgr7P2fevDKZ3E20KmF
u+TdtBLXjj5F14GTbFyYaE55WSYcAAvadI/sPk7JC74UZ44+brv/LL9Shu4uh3Ld
Up0L2WaO0p/qmdBWDsp6O1jAHaGdUbbzSd7/s4xJc+uShxVcYWHtzzv08bEyzLyr
Q7wRluKvxE7cWC3hucqF
=WOHE
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--

--===============1622969773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1622969773==--
