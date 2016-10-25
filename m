From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH/RFT v2 09/17] regulator: fixed: Add over current event
Date: Tue, 25 Oct 2016 15:33:04 +0100
Message-ID: <20161025143304.GW17252@sirena.org.uk>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
 <20161024164634.4330-10-ahaslam@baylibre.com>
 <20161024175320.GO17252@sirena.org.uk>
 <CAKXjFTNZhWTZSXtLZo8EieBtAPn_J-MM+-g8yCRJiV6UBspB9Q@mail.gmail.com>
 <20161024181937.GP17252@sirena.org.uk>
 <CAKXjFTOHcqRFtbXMXSTyUZ3P00eRMz1N3d62Y3NWVZJDGeScZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8EXHJdkEfksMlRxO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKXjFTOHcqRFtbXMXSTyUZ3P00eRMz1N3d62Y3NWVZJDGeScZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Haslam <ahaslam@baylibre.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, robh+dt@kernel.org, Sekhar Nori <nsekhar@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Kevin Hilman <khilman@baylibre.com>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, David Lechner <david@lechnology.com>, manjunath.goudar@linaro.org, Alexandre Bailon <abailon@baylibre.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--8EXHJdkEfksMlRxO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2016 at 02:55:48PM +0200, Axel Haslam wrote:

> To be able to use regulator to handle the overcurrent pin, i need to be a=
ble
> to somehow retrieve the over current pin state from the regulator driver.

What makes you say that, none of the existing users need this? =20

> As i was trying your suggestion, i remembered why i thought i should use
> mode instead of status: Status seems to be for internal regulator driver =
use,
> there is no regulator_get_status, function and REGULATOR_STATUS_* are def=
ined
> in driver.h and not in consumer.h as  REGULATOR_MODE_*

> Would you be ok if i allow consumers to get the status via a new
> "regulator_get_status" call?

What would they do with this information that they can't do with the
existing error notification?

--8EXHJdkEfksMlRxO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYD20fAAoJECTWi3JdVIfQslUH/RwiAIL6cJZcpSWFNfYQSifW
txIthbHCklL6vKPdwWsIkx6GCQ7HcICvpQW7/MHVtB1iCtKXm1TXAjvBVDqhdYJj
oUZnkxs1UTKnYcnNR4qy1qxRai/zPo8ioJBmX/helfiqWOBdRmnDmcyUs8hVxGNJ
mBz1qUGmebZJKiKaDjdYCllwkJN65007OONmKbELsadXA+hCN5haUsa+7X/5hOnt
dA6VVOvhFQGUkeUUS2S0c43dTt0iVDG84cJ2aqtLc1ztCbKzwTTTPv+SVCWBgNzA
fS7TE1pD4iaNzJvY0ooliRZ5IiC9m1K+ERBLWvsqQmBT9un606USuyvSzniXp8g=
=+nJb
-----END PGP SIGNATURE-----

--8EXHJdkEfksMlRxO--
