From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 0/8] ASoC: sunxi: Add support for audio codec in
 A23/H3 SoCs
Date: Sun, 8 Jan 2017 22:56:36 +0100
Message-ID: <20170108215636.v3swmhetvzzce4r2@lukather>
References: <20161125123442.28410-1-wens@csie.org>
 <CAGb2v65mo2g90QX6DMpw4dN4=fjccP2kp-NAbUPBzXYTtF8kMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1316223069636193654=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v65mo2g90QX6DMpw4dN4=fjccP2kp-NAbUPBzXYTtF8kMg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1316223069636193654==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bro5salbxhtzstyb"
Content-Disposition: inline


--bro5salbxhtzstyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 08, 2017 at 03:00:40AM +0800, Chen-Yu Tsai wrote:
> Hi Maxime,
>=20
> On Fri, Nov 25, 2016 at 8:34 PM, Chen-Yu Tsai <wens@csie.org> wrote:
> > Hi everyone,
> >
> > This is v2 of my Allwinner A23 and H3 audio codec support series.
> >
> > Changes since v1:
> >
> >   - Use DEFINE_RES_MEM for the analog path controls block resources.
> >   - Added Rob's ack.
> >
> > This series adds support for the audio codec found in Allwinner A23 and
> > H3 SoCs. The design and data paths are similar to the audio codec found
> > in earlier SoCs such as the A31. The analog audio paths are symmetrical
> > with left/right channels and down-mix selectors for mono differential
> > output.
> >
> > What deviates from previous SoCs is that the analog path controls have
> > been moved to a separate control bus, accessed through a message box
> > like register interface in the PRCM block. This necessitates writing
> > a separate component driver for it, which is then tied into the sound
> > card as an ASoC auxiliary device.
> >
> > Patch 1 adds the analog path controls block to the sun6i-prcm driver as
> > a sub-device, for the A23. The H3 currently does not use the PRCM drive=
r.
> >
> > Patch 2 adds PCM and card support for the A23 codec to the sun4i-codec
> > driver.
> >
> > Patch 3 adds a device node for the analog path controls block to the A23
> > dtsi.
> >
> > Patch 4 adds a device node for the audio codec, and the phandle for the
> > analog path controls block to the A23 dtsi.
> >
> > Patch 5 enables the audio codec for the A23 Q8 tablets. On these tablets
> > the headphone output is driven in DC coupled, or "direct drive", mode.
> >
> > Patch 6 adds PCM and card support for the H3 codec to the sun4i-codec
> > driver.
> >
> > Patch 7 adds device nodes for the audio codec and analog path controls
> > block to the H3 dtsi.
> >
> > Patch 8 enables the audio codec on the Orange Pi PC. The audio output
> > jack on the board is tied to the line out pins on the SoC.
>=20
> All the driver bits are in. Can you pick up the dts patches?

I just did.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bro5salbxhtzstyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYcrWQAAoJEBx+YmzsjxAgdhwQALwJa6IrqnZhqdMVHhvHW6UQ
3ylcFrMGXdtVB3XG9u6R1nDq3WQw87ld9MKFunblQnf4oKGnKdz1f0rYKbgsoX3k
EBRwsijMn6HUiT9tevyu6A1V7p5/CCJ/vsedTkl1LcRNFLQE7zOYWCuG9/RjFWYK
VtKJ8Iqx5xsGH/b/gf1hB+9QPnzP0aOcrzrybzyAdCBVTX62DnDikgQiDvBSB6Zy
7zfMgWg5ChEQAY/s6VoIENlL5VtdHftsZKA1eq7aN6Q//gGEOLkNRl/dJwbJXACo
a16E2bqAGga/cMp1jFzH28iEkqhkbiEX8Jn24yJ73IfM8rsyX3Y+14HYw0b1BZDb
iWH1bWahx8jzZPreddl0Kr0FFuuQr/tjZfcGiMXuKE2tVopyGAk1JMT1U/5uWlO+
OLmxZIeVCjYItfT7W8WaPiWJdepHZnATDT96sfzfd647vCsGn3VZB6Kl1DO++1hq
33e1AScqG+LR4aOOVNpRNilG7f9phyjtaXFm9sXY45QGZ77hGOY4PZgbOqYdIdtQ
8CWBGveD75sBS/DxEJhXiDRIwaI0nDUwZmfLVrPzmI5cpFL/1IDXDIiuNC66taOJ
rMr3Kg+6a7g3bVuJHGXzam8oAff4MgUu+ZLTmHhyDis1+RHaihA7wWSnnRLmJSmM
CYMpbKCaka4N7PPHd+7a
=t2vy
-----END PGP SIGNATURE-----

--bro5salbxhtzstyb--


--===============1316223069636193654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1316223069636193654==--
