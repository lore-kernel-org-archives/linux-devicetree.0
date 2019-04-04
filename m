From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 4/5] nvmem: sunxi-sid: add new reg_read func
Date: Thu, 4 Apr 2019 13:05:08 +0200
Message-ID: <20190404110508.rbk3z5urndtiqbmq@flea>
References: <20190402154514.11284-1-tiny.windzz@gmail.com>
 <20190402154514.11284-5-tiny.windzz@gmail.com>
 <7dc60dd9-3bbb-f215-4554-a0051c0cfbfd@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ny7tgfpxvwmv6vfd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7dc60dd9-3bbb-f215-4554-a0051c0cfbfd@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Yangtao Li <tiny.windzz@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ny7tgfpxvwmv6vfd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 04, 2019 at 11:59:44AM +0100, Srinivas Kandagatla wrote:
>
>
> On 02/04/2019 16:45, Yangtao Li wrote:
> > Because there was an endianness issue. It seems that reg_read
> > function which the nvmem the driver currently exposes is wrong.
> > So add the new read function, the new function is used when the
> > native_endian flag is set.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
>
> This patch and 5/5 does not apply cleanly on nvmem-next.
> Also I would need an ack from Maxime to be able to apply it.

Chen-Yu has mostly been taking care of this recently, so I'd like his
feedback on this.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ny7tgfpxvwmv6vfd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKXk5AAKCRDj7w1vZxhR
xTuEAQDJYNsyUIVjp1/OIKiaTRqefwV1Kzo8JrfqXvqyq3DWnQD9GRUbaA8kkh5q
19AYo+3YuKFkWdfrbe2rIgGkpRfMyAo=
=d7g+
-----END PGP SIGNATURE-----

--ny7tgfpxvwmv6vfd--
