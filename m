From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: watchdog: Add YAML schemas for the
 generic watchdog bindings
Date: Wed, 21 Aug 2019 16:33:17 +0200
Message-ID: <20190821143317.dkahpwjvgrtqtx4d@flea>
References: <20190819182039.24892-1-mripard@kernel.org>
 <ada53037-898f-7b8c-8a96-b80414563fa7@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3o66cqpsjmmmmqh3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ada53037-898f-7b8c-8a96-b80414563fa7@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: wim@linux-watchdog.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--3o66cqpsjmmmmqh3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

On Tue, Aug 20, 2019 at 08:54:53AM -0700, Guenter Roeck wrote:
> On 8/19/19 11:20 AM, Maxime Ripard wrote:
> > From: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > The watchdogs have a bunch of generic properties that are needed in a
> > device tree. Add a YAML schemas for those.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> What is the target subsystem for this series ? You didn't copy the watchdog
> mailing list, so I assume it won't be the watchdog subsystem.

Sorry for that :/

It can either go through the DT or watchdog tree. I'll resend it and
let you and Rob figure it out :)

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--3o66cqpsjmmmmqh3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV1WLQAKCRDj7w1vZxhR
xV7MAP9eNJQeheprjz1a/+LmmPM8s1A06SHcgrdDWaIdjrnr9AEA3opx310odS8e
IIcinBLkTGCtVyqZQn99Bq1LeOvEPgA=
=W2rw
-----END PGP SIGNATURE-----

--3o66cqpsjmmmmqh3--
