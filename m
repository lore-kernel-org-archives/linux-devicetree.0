Return-Path: <SRS0=AJXF=TY=bootlin.com=maxime.ripard@kernel.org>
Date: Fri, 24 May 2019 16:14:06 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] dt-bindings: Add vendor prefix for Espressif
Message-ID: <20190524141406.z4spzgn2c3e7tjz6@flea>
References: <20190523081415.29870-1-maxime.ripard@bootlin.com>
 <CAL_JsqKLVkM6ygAmLsgF+rxAOxdiqBP2i+J1wLNfDeYrPd2JcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w6cie5rt4c5dkiyl"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKLVkM6ygAmLsgF+rxAOxdiqBP2i+J1wLNfDeYrPd2JcA@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--w6cie5rt4c5dkiyl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Thu, May 23, 2019 at 09:57:22AM -0500, Rob Herring wrote:
> On Thu, May 23, 2019 at 3:14 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Add Espressif Systems DT vendor prefix. That prefix has been used for quite
> > some time for WiFi chips, but has never been documented.
>
> Just 1 of about 100...

Indeed, it turns out that we have much more undocumented prefixes in
the board compatibles....

How do you want to handle this, should we work gradually to support
all the prefixes, or should I send one patch fixing all of the
warnings on my DTs at once?

> Here's a script to generate a schema for compatible string checks. Not
> yet sure what to do with it or how to integrate it in.
>
> #!/bin/sh
>
> vnd_file="Documentation/devicetree/bindings/vendor-prefixes.yaml"
>
> vendor_pattern="$(sed -n -e 's/.*\^\([-a-zA-Z0-9]*\),.*/
> \1\|\\/p' ${vnd_file})"
>
> cat << EOF
> # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> %YAML 1.2
> ---
> \$id: http://devicetree.org/schemas/compatible-vendor-prefixes.yaml#
> \$schema: http://devicetree.org/meta-schemas/base.yaml#
>
> title: Devicetree Vendor Prefix Registry
>
> maintainers:
>   - Rob Herring <robh@kernel.org>
>
> select: true
>
> properties:
>   compatible:
>     maxItems: 32
>     items:
>       if:
>         allOf:
>           - pattern: ","
>           - not: { pattern: "^usb[0-9a-f]+," }
>       then:
>         pattern: "^(\\
> ${vendor_pattern}
>           ),"
>
> EOF

It turned out pretty useful, but yeah, it's not super easy to merge
anywhere in the kernel tree. Maybe you could put it in the tools
directory, with a wrapper that would run make dtbs_check, plus a nice
grep to only report the vendors missing it could find for the current
configuration?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--w6cie5rt4c5dkiyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOf8LgAKCRDj7w1vZxhR
xaklAQDDipo/ZAO8ne1KemzWtsrftq4e1h40AL7WabRTipYFZQEA2OrERF2CFJSu
Ton0rmXzW+0Hy1zvpXPr78d3h7ZDYg4=
=PVPC
-----END PGP SIGNATURE-----

--w6cie5rt4c5dkiyl--
