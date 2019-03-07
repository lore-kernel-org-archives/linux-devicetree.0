From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: interconnect: Add a dma interconnect
 name
Date: Thu, 7 Mar 2019 16:47:55 +0100
Message-ID: <20190307154755.5kgc7oh4b5bhg2fj@flea>
References: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
 <43eeca13733faefe62f9facc25b8e88f7e593f61.1549897336.git-series.maxime.ripard@bootlin.com>
 <553c987c-da9a-1f85-fb16-4b9fe17dd14b@linaro.org>
 <20190305155337.glfvgyddvnkv774m@flea>
 <0e72fbf7-b100-ddc5-3c19-32f71c37f76f@arm.com>
 <477995b0-9ac3-b6ca-f5f2-856e4af926f1@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1786291021=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <477995b0-9ac3-b6ca-f5f2-856e4af926f1@linaro.org>
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


--===============1786291021==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5pwrr5aoove3hn6w"
Content-Disposition: inline


--5pwrr5aoove3hn6w
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2019 at 05:15:20PM +0200, Georgi Djakov wrote:
> Hi,
>=20
> On 3/5/19 18:14, Robin Murphy wrote:
> > On 05/03/2019 15:53, Maxime Ripard wrote:
> >> Hi,
> >>
> >> On Fri, Mar 01, 2019 at 07:48:15PM +0200, Georgi Djakov wrote:
> >>> On 2/11/19 17:02, Maxime Ripard wrote:
> >>>> The current DT bindings assume that the DMA will be performed by the
> >>>> devices through their parent DT node, and rely on that assumption
> >>>> for the
> >>>> address translation using dma-ranges.
> >>>>
> >>>> However, some SoCs have devices that will perform DMA through
> >>>> another bus,
> >>>> with separate address translation rules. We therefore need to
> >>>> express that
> >>>> relationship, through the special interconnect name "dma".
> >>>>
> >>>> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >>>> ---
> >>>> =A0 Documentation/devicetree/bindings/interconnect/interconnect.txt |
> >>>> 3 +++
> >>>> =A0 1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git
> >>>> a/Documentation/devicetree/bindings/interconnect/interconnect.txt
> >>>> b/Documentation/devicetree/bindings/interconnect/interconnect.txt
> >>>> index 5a3c575b387a..e69fc2d992c3 100644
> >>>> --- a/Documentation/devicetree/bindings/interconnect/interconnect.txt
> >>>> +++ b/Documentation/devicetree/bindings/interconnect/interconnect.txt
> >>>> @@ -51,6 +51,9 @@ interconnect-names : List of interconnect path
> >>>> name strings sorted in the same
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interconnect-names to mat=
ch interconnect paths with
> >>>> interconnect
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 specifier pairs.
> >>>> =A0 +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Re=
served interconnect names:
> >>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 * dma: Path from the device to the main
> >>>> memory of the system
> >>>
> >>> Bikeshed: As it's from the device to the main memory, maybe here we c=
an
> >>> also denote this my calling the path dma-mem or dma-memory. For other
> >>> paths, we are trying to mention both the source and the destination a=
nd
> >>> maybe it would be good to be consistent although this is special one.
> >>
> >> I'm not sure I understand what you mean. You'd like two interconnect
> >> names, one called dma-memory, and one memory-dma?
> >=20
> > Hmm, yes, it's not like "dma" describes an actual source or destination
> > either :/
>=20
> IIUC, it's a path (bus) that a dma device use to access some memory
> (read or/and write). So i have used source-destination above more in the
> sense of initiator-target or master-slave. My suggestion was just to
> change the reserved interconnect name from "dma" to "dma-mem" or
> "dma-memory".

If dma is an issue in itself, maybe we can call it "device-memory" ?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--5pwrr5aoove3hn6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXIE9KwAKCRDj7w1vZxhR
xaLPAP97G3Gb2gq5LO0FvcRpl2j4snXLX7412+cYlkBa71I/oAD/YKCBpiqzTVGQ
C7R1CnHQKyFoNDJhh+gnvnOCUSH9cgI=
=/Ya7
-----END PGP SIGNATURE-----

--5pwrr5aoove3hn6w--

--===============1786291021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1786291021==--
