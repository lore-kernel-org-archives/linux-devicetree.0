From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: Add YAML schemas for the
 generic NAND options
Date: Wed, 3 Apr 2019 09:35:51 +0200
Message-ID: <20190403073551.ym7nbqwcdpicwo6e@flea>
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqL9rOO8jUUVQ5MnD3GCvyyCDPsw=Kd=va3X-rAF60Wkzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5210425458190382073=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqL9rOO8jUUVQ5MnD3GCvyyCDPsw=Kd=va3X-rAF60Wkzg@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>, MTD Maling List <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============5210425458190382073==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7jrsntgdy4khsrgx"
Content-Disposition: inline


--7jrsntgdy4khsrgx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Tue, Apr 02, 2019 at 08:20:58PM -0500, Rob Herring wrote:
> > +      nand-ecc-strength:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
>
> While I wished this worked, these 2 have to be under 'allOf'.
> Unfortunately, this will also silently pass validation in json-schema.

Unfortunately, I'm not sure I fully get how the ref system is supposed
to work yet. Can you elaborate a bit on why we should put the ref and
whatever constraint we have in an allOf?

Should we do the same in a separate schema that would reference
another entire schema (like the second patch does with the first
one)?

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--7jrsntgdy4khsrgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKRiVwAKCRDj7w1vZxhR
xRftAP4gOwOHrQ42gDtK4z/l2QP1qkrHcR+4gv4h2w9jqy3upwEAxHJsybyBI6rp
+JNw/3x4TYPZfGVK2ilH9eycRhV9WwA=
=6tkC
-----END PGP SIGNATURE-----

--7jrsntgdy4khsrgx--


--===============5210425458190382073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5210425458190382073==--
