From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: Re: [PATCH] arm64: dts: mt8183: Add node for the Mali GPU
Date: Fri, 13 Sep 2019 14:17:29 -0400
Message-ID: <20190913181729.GB3115@kevin>
References: <20190905081546.42716-1-drinkcat@chromium.org>
 <CAL_JsqJCO2G90TTT9Mpy4kjVKQyXWw4aXEEnbRp_SE8X=EGc5g@mail.gmail.com>
 <CANMq1KCTPdFhJG1SLf-i+-557Yx-1WLzWCHu3tT_5Q2BF+JgdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANMq1KCTPdFhJG1SLf-i+-557Yx-1WLzWCHu3tT_5Q2BF+JgdQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nick Fan <nick.fan@mediatek.com>, Boris Brezillon <boris.brezillon@collabora.com>
List-Id: devicetree@vger.kernel.org


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > > The binding we use with out-of-tree Mali drivers includes more
> > > clocks, I assume this would be required eventually if we have an
> > > in-tree driver:
> >
> > We have an in-tree driver...
>=20
> Right but AFAICT it does not support Bifrost GPU (yet?).

By the time MT8183 shows up in more concrete devices, it will, certainly
in kernel-space and likely in userspace as well. At present, the DDK can
be modified to run on top of the in-tree Mali drivers, i.e. "Bifrost on
mainline linux-next (+ page table/compatible patches), with blob
userspace".

While the open userspace isn't ready here quite yet, I would definitely
encourage upstream kernel for ChromeOS, since then there's no need to
maintain the out-of-tree GPU driver.

---

More immediately, per Rob's review, it's important that the bindings
accepted upstream work with the in-tree Bifrost driver. Conceptually,
once Mesa supports Bifrost, if I install Debian on a MT8183 board,
everything should just work. I shouldn't need MT-specific changes / need
to change names for the DT. Regardless of which kernel driver you end up
using, minimally sharing the DT is good for everyone :-)

-Alyssa

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl173TQACgkQ/v5QWgr1
WA2KFBAAnQIHm2aIeWt2mYq9onM7XNfSCCxZzYCsLXaE1LiylCZdcDanV4VaF+B3
f+jIbfoeoHcnqlhNYRNiI93L0dl3YdmKHBJsPkxNg+ziQu/alZQbsYFNB07LBsuk
2dxKissYufkSfdcc4UFEBDYq6LQlLF0XmXr5G7oNazC29e73h6Jpn8lrIlKrKo+v
5SE/KJs7ua1sfKkj6As8LOh2VFqCv+NZ7XPjI+qUQDoSfXgoO2DTsLu79lhInxRr
pdC8YKeypMlEGRuDgXt9Ee1zi0lk0OroJ+9uELf1G67V/JlpSOOI1go00HhC4Tll
I8LeczfwD2ujVnJ1kpENyQAmqEY/b6lNPIQJm0MvLFh59Hk9hjl8j1WlH9+yKMNH
rcZK1/SYeo97URXmKbfYFiwnRLXsX3p7wXjC6vtiw0xa7AcgdsfU+su4uUp8uq3V
6xCVdnowzNVjYBt8OZbOV5QWXTp0peb9VRIdCjHnrtgb55eYoQDV7Mh69Q5oG8MB
GZoD72p8ks3LI9BrTJ2QFjEsbWYj9XpvXI7AGL7YcR99QyF9hmgQF0h8Xnwz4nwD
8oYGMbECAYUT7gVNHCU9lbFkmvsgMCSTvLfMNO5nwarwgF5y8LsQITo9Bf2tLyQ/
nu3S6fy0qmIcLnwbiMG7urG8a81EtGUNJb8JBd4SLmKQAkA4NWo=
=H0a9
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
