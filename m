From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: interconnect: Add a dma interconnect
 name
Date: Tue, 5 Mar 2019 16:53:37 +0100
Message-ID: <20190305155337.glfvgyddvnkv774m@flea>
References: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
 <43eeca13733faefe62f9facc25b8e88f7e593f61.1549897336.git-series.maxime.ripard@bootlin.com>
 <553c987c-da9a-1f85-fb16-4b9fe17dd14b@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0808111697=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <553c987c-da9a-1f85-fb16-4b9fe17dd14b@linaro.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Yong Deng <yong.deng@magewell.com>, Frank Rowand <frowand.list@gmail.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0808111697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cksvmpp7zr6b4jhf"
Content-Disposition: inline


--cksvmpp7zr6b4jhf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 01, 2019 at 07:48:15PM +0200, Georgi Djakov wrote:
> On 2/11/19 17:02, Maxime Ripard wrote:
> > The current DT bindings assume that the DMA will be performed by the
> > devices through their parent DT node, and rely on that assumption for t=
he
> > address translation using dma-ranges.
> >=20
> > However, some SoCs have devices that will perform DMA through another b=
us,
> > with separate address translation rules. We therefore need to express t=
hat
> > relationship, through the special interconnect name "dma".
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/interconnect/interconnect.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/interconnect/interconnec=
t.txt b/Documentation/devicetree/bindings/interconnect/interconnect.txt
> > index 5a3c575b387a..e69fc2d992c3 100644
> > --- a/Documentation/devicetree/bindings/interconnect/interconnect.txt
> > +++ b/Documentation/devicetree/bindings/interconnect/interconnect.txt
> > @@ -51,6 +51,9 @@ interconnect-names : List of interconnect path name s=
trings sorted in the same
> >  		     interconnect-names to match interconnect paths with interconnect
> >  		     specifier pairs.
> > =20
> > +                     Reserved interconnect names:
> > +                         * dma: Path from the device to the main memor=
y of the system
>=20
> Bikeshed: As it's from the device to the main memory, maybe here we can
> also denote this my calling the path dma-mem or dma-memory. For other
> paths, we are trying to mention both the source and the destination and
> maybe it would be good to be consistent although this is special one.

I'm not sure I understand what you mean. You'd like two interconnect
names, one called dma-memory, and one memory-dma?

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--cksvmpp7zr6b4jhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXH6bgQAKCRDj7w1vZxhR
xThCAQD6PHnyKDoKrnJEYd0OjuOIJThkCCKFBjXXscGqXBnrggD/eFCzZGMEyleu
iG1PCRKn4Bp6bl8xBlfk3QB8wSEBWAw=
=KfvE
-----END PGP SIGNATURE-----

--cksvmpp7zr6b4jhf--

--===============0808111697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0808111697==--
