From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v10 1/6] dt-bindings: sun6i-dsi: Add A64 MIPI-DSI
 compatible
Date: Mon, 14 Oct 2019 13:00:06 +0200
Message-ID: <20191014110006.b324hccd52u7fotw@gilmour>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
 <20191005141913.22020-2-jagan@amarulasolutions.com>
 <20191007093122.ixrpzvy6ynh6vuir@gilmour>
 <CAMty3ZA1azP3kkJPw6oZudcSQksF6i+STeW=oOh65cfHsj0QrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1623716452=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAMty3ZA1azP3kkJPw6oZudcSQksF6i+STeW=oOh65cfHsj0QrQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============1623716452==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ictolke544mhfqmp"
Content-Disposition: inline


--ictolke544mhfqmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 13, 2019 at 10:32:18PM +0530, Jagan Teki wrote:
> On Mon, Oct 7, 2019 at 3:01 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Sat, Oct 05, 2019 at 07:49:08PM +0530, Jagan Teki wrote:
> > > The MIPI DSI controller in Allwinner A64 is similar to A33.
> > >
> > > But unlike A33, A64 doesn't have DSI_SCLK gating so it is valid
> > > to with separate compatible for A64 on the same driver.
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > >  .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml        | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > > index dafc0980c4fa..cfcc84d38084 100644
> > > --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> > > @@ -15,7 +15,9 @@ properties:
> > >    "#size-cells": true
> > >
> > >    compatible:
> > > -    const: allwinner,sun6i-a31-mipi-dsi
> > > +    enum:
> > > +      - const: allwinner,sun6i-a31-mipi-dsi
> > > +      - const: allwinner,sun50i-a64-mipi-dsi
> >
> > How did you test this? It will report an error when running the
> > validation
>
> I did follow the v9 comments [1] and forgot to do dt-doc-validate.
> will send the v11 for this patch alone, will that be okay?
>
> [1] https://patchwork.freedesktop.org/patch/307499/

There's some changes to the DTSI to do as well, so please do them,
check that the device trees are validated properly, and send a new
version.

Maxime

--ictolke544mhfqmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXaRVNgAKCRDj7w1vZxhR
xdlEAP9MkHQgcCclQKzguGiRxdmXCb+BVwkeOWiDgHEs4bDIXgD/eQbRbeTOq1NN
hIPooMFntNFWHosHxRdy9yw7y56jfg0=
=FNyg
-----END PGP SIGNATURE-----

--ictolke544mhfqmp--

--===============1623716452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1623716452==--
