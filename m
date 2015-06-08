From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: dw-hdmi: support optional supply
 regulators
Date: Mon, 8 Jun 2015 16:02:58 +0200
Message-ID: <20150608140256.GA10354@ulmo.nvidia.com>
References: <4184159.j0iXe39dFB@phil> <2619686.csNBBFyt8W@phil>
 <20150605110159.GA16254@ulmo.nvidia.com>
 <23123577.mOoqGCAPdL@diego>
 <20150605231058.GQ7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0229893817=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150605231058.GQ7557@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@chromium.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0229893817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 06, 2015 at 12:10:58AM +0100, Russell King - ARM Linux wrote:
> On Fri, Jun 05, 2015 at 02:16:40PM +0200, Heiko St=C3=BCbner wrote:
> > Hi Thierry
> >=20
> > Am Freitag, 5. Juni 2015, 13:02:01 schrieb Thierry Reding:
> > > If this is specific to the Rockchip implementation, shouldn't this go
> > > into Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt? It
> > > could then simply go into the Rockchip DRM tree.
> >=20
> > actually, we determined that the supply names are universal to the IP
> > (both in imx and rockchip and probably more if there are more users
> > out there). Just Russell requested that we don't pollute the generic
> > code until necessary, as it looks like the supply of those is somehow
> > handled internally on the imx.
>=20
> Why do you think it's universal?
>=20
> Let's start from the beginning, before we create something that's not
> representative of the hardware.
>=20
> dw_hdmi actually drives two pieces of hardware - the HDMI transmitter,
> and a separate hardware block, the HDMI phy.
>=20
> There are at least two possible HDMI phys referenced in the iMX
> documentation - there is one called HEAC which doesn't appear in iMX
> devices afaik, and the one which does, which is a 3D phy.

I'm not sure I understand correctly. Are these PHYs exchangeable? Does
the DesignWare IP provide them or could they be provided separately? I
see register definitions for a "source" PHY and a "master" PHY, where
the latter seems to be an I2C controller rather than a PHY. Perhaps it
is used to communicate with an external PHY?

Can somebody give me a quick summary (or point me to documentation) on
how this works?

> The 3D phy top level IO diagram does have VPH and VP power supplies,
> but it also has VP_FILT0, VP_FILT1, VP_FILT2, VP_FILT3 and GD labelled
> up as "Power supply signals".  Where they connect to in the rest of the
> system - or whether they are connected - is undocumented.
>=20
> The HDMI transmitter itself is not documented what it's supplies
> actually are.
>=20
> So, what we currently have in DT for dw_hdmi is something which doesn't
> _quite_ reflect the hardware right now, and to go adding VP and VPH
> supplies to the generic binding is wrong - it doesn't follow the
> hardware structure detailed in the iMX documentation I have.
>=20
> As the Rockchip documentation is not available, I can't comment whether
> it would be current proposal is appropriate for Rockchip or not, which
> is why I haven't commented on this other than saying that it's not
> appropriate to be a generic dw_hdmi binding.
>=20
> If we wanted to model this correctly, then for iMX, I would suggest
> that the HDMI phy should be modelled in DT, and _all_ the six VP*
> supplies are modelled - and we should assume that "GD" is a "power
> good" signal, though we don't know that for certain.

Perhaps VP_FILT* are sourced from the same supply as VP, so maybe we
don't have to care at the DT level?

> What we also don't know on iMX6 is what voltages any of these are
> supplied with.

A rather common nuisance with these licensed IP blocks is that some of
the details may be hidden in SoC glue, resulting in the interface being
different on each SoC. Given all of the above it sounds like i.MX could
have some internal glue to supply VP and VPH and there'd be no sensible
way to represent them in DT.

> So, as we don't have much certainty here, and we know that adding it
> to what is the HDMI transmitter would be wrong, I'd suggest not
> modelling it in a generic way at present.

Does DesignWare by any chance offer documentation about the IP? If not I
agree that the safest thing to do for now would be to make this Rockchip
specific. If it should prove to be generic after all (in which case i.MX
would seem to provide SoC glue to supply them) we can still promote the
supplies to be generic. They'd need to be optional to handle the i.MX,
though. Or perhaps a dummy regulator could be referenced, representing
the SoC-internal supply to the block. Maybe there even is a (SoC-
specific) way to control this internal regulator?

Thierry

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVdaCNAAoJEN0jrNd/PrOhhYsQAKu44ZyKz9O5waSog9eOTUUV
1mmV68UdyFfUhJRvkXovQ+eaBlCmKKeG3gv/4lRyFENuqhAi4aYoAbhVelH/Yerd
3mhzb4HSLHZTioVf24qNbbw71nVwrlbpqfzp8QzSFoecEUVnN0MI4aQvqw7mTbom
PLWvl/NevTlbOh+QVt6KlukLRyPJA1T3R2QreZZdu0HtKMgLKuFqOFfMxQlE7n4I
wtW6qBwJqKxSLGtD8hyqQFgr1BJoIC/5oybAQ7eByWnzovCSR0RJB+LJNhlrs7qw
CNbCk3aDeWnmX9wGqyPdMHr0IkAwby7k4mb4ytW2YDt8luSHCdJvlpKe84k4XJBj
BxEzAQVwBIzH4ab49/SCHhQkzyx/LsMn78cUwvj/H4TlFo89Gb2ZN7A7iOCZbXss
NDJ2P9A9u3qdreaHmQTgrx1wE7QC8AWjPv9NWFfGDR5F8TcWVK0eaNXGkowCsObG
I/5CJR94iTNhuDbu+isSUUIZGXqYfPaceff6WKwmVMykLKRo1iO1WlV0sVcUQU+G
scdSaPjYN+HuK3wJBYD5nwqgN97jiJteMU5/cd01UBYmWunYZUUkUj7rPy64PZbh
b22wSlqTWE7vbU8wmXVkJpFWxASwayNk+P/Anj3OfhvKJw8mVi866GuTvb1gmF/6
3qythnLMgLFRi52yHRZA
=pncT
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

--===============0229893817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0229893817==--
