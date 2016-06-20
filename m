From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: sun8i: Add Parrot Board DTS
Date: Mon, 20 Jun 2016 20:35:43 +0200
Message-ID: <20160620183543.GM26668@lukather>
References: <1465812931-22824-1-git-send-email-quentin.schulz@free-electrons.com>
 <1465812931-22824-2-git-send-email-quentin.schulz@free-electrons.com>
 <CAGb2v64jduBijEXzsKbOpSvLd9YHwO=qpSyPSDuYtMPg8wfKzA@mail.gmail.com>
 <575FFFBE.5090107@free-electrons.com>
 <CAGb2v67JGG35odB7kEAoF0kGes=KRGoREOSTc_GM0B4A+8cKWg@mail.gmail.com>
 <20160620154452.GL26668@lukather>
 <CAGb2v66_iUMd5V=9Np4Kqqv+yqq2HbjoPhC3Z6cpHFrMzkddvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HVCoas+krw6dou6l"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66_iUMd5V=9Np4Kqqv+yqq2HbjoPhC3Z6cpHFrMzkddvw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Quentin Schulz <quentin.schulz@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux@armlinux.org.uk, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Hans De Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org


--HVCoas+krw6dou6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2016 at 12:30:25AM +0800, Chen-Yu Tsai wrote:
> >> >>> +&reg_aldo1 {
> >> >>> +       regulator-always-on;
> >> >>> +       regulator-min-microvolt =3D <3000000>;
> >> >>> +       regulator-max-microvolt =3D <3000000>;
> >> >>> +       regulator-name =3D "aldo1";
> >> >>
> >> >> What is this for exactly? Would turning it off render the system in=
operable?
> >> >> How was it referenced in the fex file?
> >> >>
> >> >> If this is for WiFi I/O VCC, then you should specify it in mmc1 with
> >> >> vqmmc-supply.
> >> >>
> >> >
> >> > In the fex, aldo1 is one of the three power inputs for the WiFi (the
> >> > others being dldo1 and dldo2) and in the schematics it is linked to
> >> > both VCC-USB and VCC-IO-WIFI.
> >> >
> >> > I tried to turn it off and, indeed, the system becomes inoperable.
> >> >
> >> > I'll add vqmmc-supply in mmc1 with aldo1 regulator. However, I am
> >> > wondering what to put in vmmc-supply for mmc1 since the WiFi module =
has
> >> > three power inputs: dldo1, dldo2 and aldo1. In the fex, they are
> >> > referenced as, respectively, module_power1, module_power2 and
> >> > module_power3 and in the schematics dldo1 and dldo2 are named VCC-WI=
FI
> >> > while aldo1 is used for VCC-IO-WIFI (if it can help in any way).
> >> >
> >> > VCC-WIFI is connected to pin VBAT of the Broadcom AP6212 WiFi chip.
> >> > VCC-IO-WIFI is connected to pin VDDIO of the chip.
> >>
> >> VCC-IO-WIFI is vqmmc, and VCC-WIFI is vmmc.
> >
> > Isn't vmmc supposed to be always powered at 3.3v, and vqmmc the one
> > used to drop to 1.8V with the UHS cards?
>=20
> For eMMC, vmmc and vqmmc correspond to the pins on the eMMC chip.
> vmmc provides power to the internals, while vqmmc provides power to the
> I/O buffers on both sides. With SD this is a bit less clear. IIUC the SD
> card itself supplies I/O voltage, dropping it to 1.8V if necessary, from
> VDD (vmmc). vqmmc only affects the host side, and whatever external pull-=
ups
> that might exist.

Ok.

> > In which case, VCC-IO-WIFI is vmmc, and VCC-WIFI is just one of the
> > wifi chip power rail, to be handled by a power sequence.
>=20
> For the WiFi chip, there is a separate IO-VCC rail, which is VCC-IO-WIFI.
> This, from what I understand of the datasheet, is for I/O signaling, and
> thus vqmmc. VCC-WIFI is what powers the chip, which is what vmmc is.

Ok. but there's still the issue of the two regulators that needs to be
kept in sync. Before, that, I'd rather stice to not tying them to the
MMC bus, and putting a comment on top.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--HVCoas+krw6dou6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXaDd/AAoJEBx+YmzsjxAgD8sP/0eBZor6/qRy3x7cJvNOvbyX
TyGxcetPNiY4X1nGcEdli+GFHBsaeWr/0X/RSJCaUtt4lNWmlKtdTfkpoKQ3hpEL
Ua9WBGX+RdCePbwY46OKbSND5r+tKQQVhPieJqtRGqhGL9RyWKuEKhwH3giWttCq
xBVIcWjzWtwF8pUYA7kcRXMntWgj/htQqbABB7tiw866UVES2LDaNyoKkvxrcDv+
9bv4k6ZPsIMHGj71hmwDLzyJ+ychKyOTDP4KGV0ufxzSxcMtbeYaFpqvfdaAQfgN
uT/hHkOHKlYQdNEHWT8p4nYnAx5xx5c7CyrfIfAUXfUKPQR51W99Wv+5Ydk5vQ0W
Prrh4I8BN/5ZFnGfr3k0ESpNT8kG5vFV8+RdsY1LB62tKseEojacq4tFem4Sy8PW
+Z3QcaOqOJpBKS4ZPJO03AnabUqq2d2ttKPIXXIbiMMZFFNanr3N+W+XedbePe8P
bBQW8v18yTKus7uSrO2g6A/M8qonqHbLOCMU2+EBAexsncR3A9cd8uVjpe9qGral
3P0wzvgk/WxedpMlm0OjYU3GHWKQ7zc1gl8sjx/747mXtc0865qCh8/cS7UmZejs
EbuZbWZx4y5S8vVqm8ia/eOIoH8gi/fh9aLyzcCfyJNbqLTqmGGOq5KltFniMUtL
G9+g9MdQCJMfyX0G84jz
=3XyW
-----END PGP SIGNATURE-----

--HVCoas+krw6dou6l--
