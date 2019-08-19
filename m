From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: mfd: Convert Allwinner GPADC bindings
 to a schema
Date: Mon, 19 Aug 2019 20:27:26 +0200
Message-ID: <20190819182726.7se7vexlftybsqlz@flea>
References: <20190813124744.32614-1-mripard@kernel.org>
 <CAL_Jsq+QxsxxCsaJ8GjSQhKVHnas3WqjOPnv86=-fWs143CUQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4014002962065167183=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_Jsq+QxsxxCsaJ8GjSQhKVHnas3WqjOPnv86=-fWs143CUQg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Frank Rowand <frowand.list@gmail.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org


--===============4014002962065167183==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cqozu4ph2avfiavn"
Content-Disposition: inline


--cqozu4ph2avfiavn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2019 at 03:28:01PM -0600, Rob Herring wrote:
> On Tue, Aug 13, 2019 at 6:47 AM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > From: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > The Allwinner SoCs have an embedded GPADC that is doing thermal reading as
> > well, supported in Linux, with a matching Device Tree binding.
> >
> > Now that we have the DT validation in place, let's convert the device tree
> > bindings for that controller over to a YAML schemas.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  .../iio/adc/allwinner,sun8i-a33-ths.yaml      | 43 +++++++++++
> >  .../bindings/mfd/allwinner,sun4i-a10-ts.yaml  | 76 +++++++++++++++++++
> >  .../devicetree/bindings/mfd/sun4i-gpadc.txt   | 59 --------------
> >  3 files changed, 119 insertions(+), 59 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml
> >  create mode 100644 Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thanks

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--cqozu4ph2avfiavn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVrqDgAKCRDj7w1vZxhR
xe/QAQCdjHYyPT1sbZs3doytGQ893nBVcEEfzd/iGm9+jIBxGQD/QEk4vLmUXEEu
fopc6mLQNzKp3ZMuCE3WzEnc5wQU+Qc=
=yYiT
-----END PGP SIGNATURE-----

--cqozu4ph2avfiavn--


--===============4014002962065167183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4014002962065167183==--
