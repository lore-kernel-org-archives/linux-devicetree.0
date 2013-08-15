From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: Add PTN3460 bridge driver
Date: Thu, 15 Aug 2013 22:42:08 +0200
Message-ID: <20130815204207.GA24507@ulmo>
References: <1376513258-25703-1-git-send-email-seanpaul@chromium.org>
 <1376513258-25703-3-git-send-email-seanpaul@chromium.org>
 <20130815152812.GF16951@ulmo>
 <CAOw6vbLukpMkDHivB54uMnMvmRU6=qq2hodgE9Jxj5oSpjQHxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOw6vbLukpMkDHivB54uMnMvmRU6=qq2hodgE9Jxj5oSpjQHxQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, robdclark@gmail.com, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-Id: devicetree@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2013 at 03:32:58PM -0400, Sean Paul wrote:
> On Thu, Aug 15, 2013 at 11:28 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Wed, Aug 14, 2013 at 04:47:38PM -0400, Sean Paul wrote:
> > [...]
> >> +int ptn3460_init(struct drm_device *dev, struct drm_encoder *encoder,
> >> +             struct i2c_client *client, struct device_node *node)
> > [...]
> >> +     ptn_bridge->gpio_pd_n =3D of_get_named_gpio(node, "powerdown-gpi=
o", 0);
> >
> > of_get_named_gpio() can return -EPROBE_DEFER and I wonder how you handle
> > that in the driver that uses ptn3460_init(). Since you pass in an
> > initialized drm_device, you'd need to undo all of that in case of
> > -EPROBE_DEFER. Well I guess you'd have to do that in case of any error,
> > but it makes things difficult to handle for drivers.
> >
> > For instance on Tegra we pretty much delay DRM initialization until all
> > required subdevices (there are quite a few) have been probed, so if we
> > wanted to use this function we'd have to call it after all drivers have
> > been probed because only then do we have access to a struct drm_device.
> > That will cause other problems, however, because at that point we can't
> > defer probing anymore.
> >
>=20
> I suppose I could add another init that performs the deferrable tasks
> (ptn3460_init_deferrable or something). This would be called before
> drm init has been started from one of the probe functions.
> Alternatively, I could set this up as a standalone i2c driver and do
> this stuff in the probe. Any other options?

My point was that in those cases you don't have access to the DRM device
yet since you haven't called drm_init() yet.

> Adding another init call adds yet another thing the drm driver has to
> do to use this bridge. Making the ptn driver standalone requires you
> to set things up such that drm init is dependent on ptn probe running
> successfully. I'm not sure which is more desirable.
>=20
> Practically speaking, do you expect to call drm_init before the gpio
> is available?

No, not really, but I won't know that the GPIO is available until I
actually call of_get_named_gpio_flags().

But perhaps we should cross that bridge when we get to it.

Thierry

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDT0fAAoJEN0jrNd/PrOhEhEQALN0AxVIrZeaWnQ31+fQgDII
QLunTwu3UtoT0G6UzMbG/ckFSmeTAuO7Emls6+fQrVCN53T3u4tT5bub2jJSo7mO
IwO3DskMiXpFezAjGrJjOIPMW6AkEo9ATKqC/QuIvptsIHPeGsMByfxvvXAk6/mr
ZYPihPHE9jvvTUD1TuydpiIUgQY5M2XldgGqu+d+tQLDeFq2a8JzCjOX2VooVIEN
I7qF2HGY3B5vS4kiIAhKP58PNa4zmMmg1ASQeBRJj4IEGQDX+Rvu0N25zy5PVGX6
MZNBG1GTpeb6u9/xkhL/Hk2GENl+OaNP9W/NkvDdaNFkcLAs8mDAP2oLSLPMy6Rn
bbEdZ1y5NsK4waPfMdubO6CbwrvMvardjSpPLORc5C2d8zm4Wz1HDlMjNz8hyIaw
Re9p4MjhVru6grMAW0cQPswpkxG+LvQLUM61sCO05WzQiQUYc8dcdq41/JgtIqGJ
fry92Sk71xGpmEhtGwb4SF0CKw5R39sFfEqGls0K7JInB6jeU4159JxJBSuab5Jq
Qx7S7HMyNyiXH98Sj3D++HVcALu231ztFDuxoo3O6ShgKU8pBq02x8isdaDB2MJ7
MTDvYax6QFqIJz4KJM7WNp2qR4i4GHQyvV95l/7EPw1c563FnNBkYme5v0LXUbhP
Yrw7U6a5DSvUF0n/WA3W
=A7GZ
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
