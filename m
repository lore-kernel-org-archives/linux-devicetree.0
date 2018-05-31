From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 0/7] sunxi: Add DT representation for the MBUS controller
Date: Thu, 31 May 2018 14:52:27 +0200
Message-ID: <20180531125227.6c4k5glyvvqrf7fo@flea.home>
References: <cover.54a07919b9d7fe8d7c90e9f4929648013e641cff.1522761929.git-series.maxime.ripard@bootlin.com>
 <CAL_Jsq+cURC780ivftY1v3P59g5UKAHwb48raXXB6huQ2KBvuQ@mail.gmail.com>
 <20180409092229.ljcnsqgv7wh2s4op@flea>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1521625459=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180409092229.ljcnsqgv7wh2s4op@flea>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Yong Deng <yong.deng@magewell.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1521625459==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qjs6tgge4xg5dwmj"
Content-Disposition: inline


--qjs6tgge4xg5dwmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 09, 2018 at 11:22:29AM +0200, Maxime Ripard wrote:
> Hi Rob,
>=20
> On Tue, Apr 03, 2018 at 11:03:30AM -0500, Rob Herring wrote:
> > On Tue, Apr 3, 2018 at 8:29 AM, Maxime Ripard <maxime.ripard@bootlin.co=
m> wrote:
> > > Hi,
> > >
> > > We've had for quite some time to hack around in our drivers to take i=
nto
> > > account the fact that our DMA accesses are not done through the parent
> > > node, but through another bus with a different mapping than the CPU f=
or the
> > > RAM (0 instead of 0x40000000 for most SoCs).
> > >
> > > After some discussion after the submission of a camera device sufferi=
ng of
> > > the same hacks, I've decided to put together a serie that introduce a
> > > property called dma-parent that allows to express the DMA relationship
> > > between a master and its bus, even if they are not direct parents in =
the DT.
> >=20
> > Reading thru v6 of the camera driver, it seems like having
> > intermediate buses would solve the problem in your case?
>=20
> I guess it would yes, but I guess it wouldn't model the hardware
> properly since this seems to be really a bus only meant to do DMA, and
> you're not accessing the registers of the device through that bus.
>=20
> And as far as I know, the DT implies that the topology is the one of
> the "control" side of the devices.
>=20
> We'll also need eventually to have retrieve the MBUS endpoints ID to
> be able to support perf and PM QoS properly.
>=20
> > As Arnd mentioned in that thread, something new needs to address all
> > the deficiencies with dma-ranges and describing DMA bus topologies.
> > This doesn't address the needs of describing bus interconnects.
> > There's been some efforts by the QCom folks with an interconnect
> > binding. They've mostly punted (for now at least) to not describing
> > the whole interconnect in DT and keeping the details in a driver.
>=20
> Is it that patch serie? https://lkml.org/lkml/2018/3/9/856
>=20
> > On the flip side, this does mirror the established pattern used by
> > interrupts, so maybe it's okay on it's own. I'll wait for others to
> > comment.
>=20
> We'll see how it turns out then :)

Ping?

How should we move forward on this?

Maxime


--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--qjs6tgge4xg5dwmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsP8AgACgkQ0rTAlCFN
r3STIA/6ArSg8MsHYDYK8k6YLs9VK5rpghao0HU+hZMJzFgiKV3j7H/wGdV2l5fK
3k5fxnXGSsMam5zcOE1MJ74LOi1+7Xh0KLasWiVcMawio/igelYcj0mzdbpTazVP
VNh/r4X2TIq17bhdRmpWOBb9nBSmod/NnUpeU4gutnZ6+XvVTTQrOQA9MKoiUh9u
J4DYlTGsVDRxn0mATNWVlbF7HeBB8+Xm76co5IM0i375mK+W9q9zh7d6E4uRkqxV
a+UJ/ym0EodVRJU5yiZ8eRcmoNB6sczUUDzThLlLWa5bIdIfGGH+bgWCSLSEASrr
l9MmxPz/I1wZQQnH5K8a66XJFfQvwj09h3XVNSzKTAEWo9/dXBCu/G6aExDy0en8
BowmSRaGf9VBhNlX/yB/zjcVNzuul3IcDSrmMIQ7Vw4m5yJOuqxTWAP4ojdLHQ5X
UbvMv9321rMHcL7z80oscSwSj9lO0VipIGtYZkZ3c0RivTqSlk1eP8DMgUaXsuBi
yNOxkddadShpeC2TScakiBTy6w7O2dnJ/Rvn3DYQSwTF84oI+V3vaCvzvRTfKvno
ntgrwVWFPCI3Q5sm4SDHq4PLJrcb4WmXrXuXe+2OWHehf4YikStpC6NvSmwD7RR4
C8UXixadehk02qGNfi+KNzfYYO5vHUVxqN4oGUr711a/TaTfJDo=
=E4nN
-----END PGP SIGNATURE-----

--qjs6tgge4xg5dwmj--

--===============1521625459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1521625459==--
