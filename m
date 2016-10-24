From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH/RFT v2 09/17] regulator: fixed: Add over current event
Date: Mon, 24 Oct 2016 19:19:37 +0100
Message-ID: <20161024181937.GP17252@sirena.org.uk>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
 <20161024164634.4330-10-ahaslam@baylibre.com>
 <20161024175320.GO17252@sirena.org.uk>
 <CAKXjFTNZhWTZSXtLZo8EieBtAPn_J-MM+-g8yCRJiV6UBspB9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ncX6roZrNNHXnAbh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKXjFTNZhWTZSXtLZo8EieBtAPn_J-MM+-g8yCRJiV6UBspB9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Axel Haslam <ahaslam@baylibre.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, robh+dt@kernel.org, Sekhar Nori <nsekhar@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Kevin Hilman <khilman@baylibre.com>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, David Lechner <david@lechnology.com>, manjunath.goudar@linaro.org, Alexandre Bailon <abailon@baylibre.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--ncX6roZrNNHXnAbh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 24, 2016 at 08:11:40PM +0200, Axel Haslam wrote:
> On Mon, Oct 24, 2016 at 7:53 PM, Mark Brown <broonie@kernel.org> wrote:

> > does it make sense to report this as a mode, we don't report other error
> > conditions as modes but instead use REGULATOR_STATUS_ with the
> > get_status() operation?

> I used mode, because when the regulator toggles the overcurrent
> line, it means that it has entered a current limited mode, at least the
> regulator im looking at. ill change to STATUS

That's not what regulator modes are - please look at the documentation
for the defines here.  They're about the quality of regulation.

--ncX6roZrNNHXnAbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYDlC4AAoJECTWi3JdVIfQmdUH/RuucFM9xqc+08wBouDQgC8s
iSTRAq2UbaNAREQCLvxqRSeqzBISXdet55SDHo7kAhIYke8guFj9uUledjpjoIrQ
eIpoYg2YFajqB5Zpr7lDFRu8mWeJC0+xl4e9ywU9smJBBXCsQDJotNqOvpVF0PJW
eWa2mWNRLdcVCx7wvuDHFrzJ6sNp4lZkfDedMPdrfipkqMCGgpDsjLlyua2efHnI
Md4cODQBziV+g/haCl/O89Wch9pA80EOtwSRgFo9psUYSK8QGRi3zJa5sKs3gKan
xVo2KeaLuYWJRvSOlFdGK+36kKSzaXeug013Eo5AuoBMSxO2VaGGU9UVIVKouy8=
=h4df
-----END PGP SIGNATURE-----

--ncX6roZrNNHXnAbh--
