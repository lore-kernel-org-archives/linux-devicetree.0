From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 0/7] sunxi: Add DT representation for the MBUS controller
Date: Mon, 9 Apr 2018 11:22:29 +0200
Message-ID: <20180409092229.ljcnsqgv7wh2s4op@flea>
References: <cover.54a07919b9d7fe8d7c90e9f4929648013e641cff.1522761929.git-series.maxime.ripard@bootlin.com>
 <CAL_Jsq+cURC780ivftY1v3P59g5UKAHwb48raXXB6huQ2KBvuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0204046295=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_Jsq+cURC780ivftY1v3P59g5UKAHwb48raXXB6huQ2KBvuQ@mail.gmail.com>
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


--===============0204046295==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mtks4cbg7sp7nzzj"
Content-Disposition: inline


--mtks4cbg7sp7nzzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, Apr 03, 2018 at 11:03:30AM -0500, Rob Herring wrote:
> On Tue, Apr 3, 2018 at 8:29 AM, Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> > Hi,
> >
> > We've had for quite some time to hack around in our drivers to take into
> > account the fact that our DMA accesses are not done through the parent
> > node, but through another bus with a different mapping than the CPU for=
 the
> > RAM (0 instead of 0x40000000 for most SoCs).
> >
> > After some discussion after the submission of a camera device suffering=
 of
> > the same hacks, I've decided to put together a serie that introduce a
> > property called dma-parent that allows to express the DMA relationship
> > between a master and its bus, even if they are not direct parents in th=
e DT.
>=20
> Reading thru v6 of the camera driver, it seems like having
> intermediate buses would solve the problem in your case?

I guess it would yes, but I guess it wouldn't model the hardware
properly since this seems to be really a bus only meant to do DMA, and
you're not accessing the registers of the device through that bus.

And as far as I know, the DT implies that the topology is the one of
the "control" side of the devices.

We'll also need eventually to have retrieve the MBUS endpoints ID to
be able to support perf and PM QoS properly.

> As Arnd mentioned in that thread, something new needs to address all
> the deficiencies with dma-ranges and describing DMA bus topologies.
> This doesn't address the needs of describing bus interconnects.
> There's been some efforts by the QCom folks with an interconnect
> binding. They've mostly punted (for now at least) to not describing
> the whole interconnect in DT and keeping the details in a driver.

Is it that patch serie? https://lkml.org/lkml/2018/3/9/856

> On the flip side, this does mirror the established pattern used by
> interrupts, so maybe it's okay on it's own. I'll wait for others to
> comment.

We'll see how it turns out then :)

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--mtks4cbg7sp7nzzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrLMNQACgkQ0rTAlCFN
r3TWOg/+PITSKgs5/CLaLWjLNhVxrJfRvenPqV62WWUZNr0uf7oGE3wlUbo1UhEM
8+IdKo3FecHX8y9ioYyxqPX/McGLj79loFsFRKAUmBlxajBDraSH4EuUmfAXt0sy
qVMV8tPbDypG0em8Y02wtTKOKPXC6exkYeoK9WIdWIEh/7s3FoWekAn31mGA8gjX
CrnVEEVH47IzPca1ZkpbR7W13K8AFkCAcSMhbDV/CbYSQDzsNJ8ClLN0ZGruiym7
QeopbLES61pEYZHjDawnsimp26TClh+e+dYxlivLA+3BC6dPSAFzlLoZHMESDGg9
xEUX9R542oV9v59VhstUFoTq0vuFd4g/53aM2rP72X16DLCQNZcOY6dw19v+f8VN
+7WwH42uoMozJKGGVErSVZ24U7jD47CV9ogNNtD05khym3sPw6mbRcznv5u7VtVB
avodcqp5iP9IotJnOTXHlQkczZPvI21YPyN8LFeSM7ndLeHVhulOqilLP3Ngwe/8
F3QTabVvfDmu105w2igCekw2vAh2CMXa1K9h3dd7oOnNIUjDrvtoAx6OHw7AwGuS
2hF226SZ/IizqZLKD6so3h9kBMbvvtOFs/STbe0EOAOyoXqbdi9ShTX9KdZAO1SZ
RwBQYp5MnafteyV1sENlBVhn06+4htMKEt7IuHMnc6w47/0VMb8=
=J/c3
-----END PGP SIGNATURE-----

--mtks4cbg7sp7nzzj--

--===============0204046295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0204046295==--
