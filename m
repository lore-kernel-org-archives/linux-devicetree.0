From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v5 12/12] ARM: dts: sun6i: hummingbird: Enable the
 onboard WiFi module
Date: Wed, 11 Mar 2015 15:28:12 +0100
Message-ID: <20150311142812.GN5085@lukather>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-14-git-send-email-wens@csie.org>
 <20150310213218.GH5085@lukather>
 <CAGb2v66zJcBBpLZFjNyugjRzt8SppQ0VbFD+pMqVYdK4EKg-fQ@mail.gmail.com>
 <20150311085225.GK5085@lukather>
 <CAGb2v64qQVDyG69Oe_R9m_GCY4kqW13dG+soh+MeaJ4W1Xb5kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I2DZnI03i1DS0lOz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64qQVDyG69Oe_R9m_GCY4kqW13dG+soh+MeaJ4W1Xb5kQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org


--I2DZnI03i1DS0lOz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2015 at 05:08:08PM +0800, Chen-Yu Tsai wrote:
> On Wed, Mar 11, 2015 at 4:52 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Wed, Mar 11, 2015 at 11:11:49AM +0800, Chen-Yu Tsai wrote:
> >> On Wed, Mar 11, 2015 at 5:32 AM, Maxime Ripard
> >> <maxime.ripard@free-electrons.com> wrote:
> >> > On Tue, Mar 10, 2015 at 07:59:24PM +0800, Chen-Yu Tsai wrote:
> >> >> The Hummingbird A31 has an AMPAK AP6210 WiFi+Bluetooth module. The
> >> >> WiFi part is a BCM43362 IC connected to MMC1 in the A31 SoC via SDI=
O.
> >> >> The IC also takes a power enable signal via GPIO. This is supported
> >> >> with the new power sequencing bindings.
> >> >>
> >> >> The WiFi module supports out-of-band interrupt signaling via GPIO,
> >> >> but this is buggy and not enabled yet.
> >> >>
> >> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> >
> >> > There's two almost identical patches 12/12. Which one am I suppose to
> >> > apply?
> >>
> >> This one is the right one. I forgot to clear the patches after changing
> >> the description. The "buggy" part in the description is probably not
> >> needed. Hans explained that the SD resets have nothing to do with
> >> interrupt handling.
> >
> > Just to be clear, you want the last sentence to be:
> >
> > The WiFi module supports out-of-band interrupt signaling via GPIO, but
> > this is not enabled yet.
> >
> > Right?
>=20
> That's right. Thanks.

Ack. I just applied it without the buggy mention.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--I2DZnI03i1DS0lOz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVAFD8AAoJEBx+YmzsjxAgzGIQAKZjbY5SMkSzEGoMCTj2X/1G
reWi53wdlIYLRn9DuRXZSUZgrzefcIVlkhRTGiS+geSaGeUFxKHN4SZLVc3cxHul
0kcUUKGjIFok+yTFWSAgw4v4ydJNov1ITAxr8ZP5G47EeV6ujNIP7ch9eo1iHJ0F
ACfkI5g/AkcVHIOrzQfN/YdpIKv0vPrTer5SFkPDl9hrrRATIMjiJwDfWqIAMeg+
Nmbcewlv79jwGTxms19Kc++F+q3WAlv7IZoZ35FwBVbBxVZJhe5IFsd7vN0aO3E9
USdAzah8Q+fBcH7BwkC4lOX/9Ms7V0gjC28UbVbk6dAL3BkxEB7PQElVvWSbgQVs
dfzVbuiiG0Lt34f3Iaki8GVNMwXTyn83hkBEsAYBAC8tjAGIB4+a8NIvBbh0kutZ
KG0g51g1tII5dbBJzqioJHV5zuPAu0gYxfFsWCQqClwwfVwOLe6wbvEFX4yKvKkE
NZ+4x1ghBcRUBZo7aWYEAZfEy3QHqtIzU6xnbcdyIsz0YSx5DZFO0m61qp0eGeXd
bZMMs+tWA1zrm6CwkYc5MDG2G1WtgrRs1E5Qoq4hLa/P3uOa10J8hKYwrx8T/0ur
h2RvHbV+FjGPD63tUuWFrDebkU1MPbwUp/c4ck8zDNUOVci99PDNj1u4hL8ft/6s
Fhlg4CTwxdvL2O7a92C+
=rg9X
-----END PGP SIGNATURE-----

--I2DZnI03i1DS0lOz--
