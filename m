From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [patch -next] spi: spi-xilinx: cleanup a check in
 xilinx_spi_txrx_bufs()
Date: Mon, 10 Jun 2013 10:28:43 +0100
Message-ID: <20130610092843.GI31367@sirena.org.uk>
References: <20130609130728.GA1442@debian>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1017301230118672225=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130609130728.GA1442@debian>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1017301230118672225==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZpIpfaUOZjvUmAM7"
Content-Disposition: inline


--ZpIpfaUOZjvUmAM7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 09, 2013 at 04:07:28PM +0300, Dan Carpenter wrote:
> '!' has higher precedence than comparisons so the original condition
> is equivalent to "if (xspi->remaining_bytes == 0)".  This makes the
> static checkers complain.

Applied, thanks.

--ZpIpfaUOZjvUmAM7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRtZxIAAoJELSic+t+oim9P+UP/2SPhZZmKPlKg3IevWj4bfOJ
AfRIo2A39FcyJUlf/IhRK9saU7an9Ubl+owCjmou42bTiXVqXSwwYRmvCqoKsa78
RPpV2hnVRN6a3JWnRNSicqwNIe0raQYITvv/lQDG9b0uW1AaYZuvjmrPJ/e36y1k
K2ocuF87UXkyGDYha+Be+I7Zml2zUJthMT1b8oPbm9P7SWvno9CnevxZyV44/+60
Yttap6qDkr+Ek3aOssrKx0zfWnP6QqaNaA06JTlrWYTaH4yzX25Ol/o0RfNBWJpM
g0YEtqMpaIHubk83yM+vXCiSD+jZ8BaHYfDRt3bnPHKp/1g7PgGppcpDmhse0bGl
ngzLUoKC7B8wwyyCwcdI6DEyyxepvRaOvuYFyFL0S666Dqu7ghnqcIb0SOiIH4am
zl3J925eN2EFhpxCskLXCCzvNHLTB8nI0S9dYClMJFTu8YFFMslJxWtbF781bflA
Yh3+1ayjCykfDqWpYx31XmsKY5V7w/ZFIHw3Ys8rYx2CkAktyeyObNmU7xr5xIty
PunajXPGL8ccfQw7c6zbFDjfTCooPZWxaPLg9K59Fy0CwcAY/GT2Cd1svexKnZpY
9UXiqqDzcQ05J2IaoKDRAkOrm4OB6DteyQFciYBcHyEQiPGcChbtQOd7wa1mm5au
jK9Tzkn1D+284JQRamAS
=WyYT
-----END PGP SIGNATURE-----

--ZpIpfaUOZjvUmAM7--

--===============1017301230118672225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1017301230118672225==--
