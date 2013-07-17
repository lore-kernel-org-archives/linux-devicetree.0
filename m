From: Mark Brown <broonie@kernel.org>
Subject: Re: [patch v2] spi/xilinx: signedness issue checking
 platform_get_irq()
Date: Wed, 17 Jul 2013 18:20:30 +0100
Message-ID: <20130717172030.GW22506@sirena.org.uk>
References: <20130717150538.GT22506@sirena.org.uk>
 <20130717153448.GA963@elgon.mountain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rTHIjeKG9uUlSyhr"
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130717153448.GA963@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-spi@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--rTHIjeKG9uUlSyhr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 17, 2013 at 06:34:48PM +0300, Dan Carpenter wrote:
> In xilinx_spi_probe() we use xspi->irq to store negative error codes so
> it has to be signed.  We weren't going to use the upper bit any way so
> this is fine.

Applied, thanks.

--rTHIjeKG9uUlSyhr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR5tJbAAoJELSic+t+oim90vwP/1CH/ZrKb01iUQCqXGsvPCAv
nno3xY+lIuNPzf84Q3h8c2kBn1fZvpgL1IXAhs4DGxjoP/2IZqR+gYzsG7wWZN18
ev86Uv+x3gzbK0pJ0gh17wAMr5DtL5tLFyCPnkndAZ0Wwfl1SXn6RQ6gd7WcKNE4
S+YDG/VhNoN6wV+NDqKNNV5QUxztzjk4yvm1HGQatAk2pXyH89SdEpAtd9j3Wt8U
n8hWlCACtD1JZ8xdX82pVORdRfQ45nEDPqNLNskpqsnIp/PXdp7Yjedtr0Pm2EG1
f2Rv/DJ7kH9VDvn2fOKaJrScJKSxOz0jhyEmm/hGyQNKHfgDpJbDBNLvLFhyXcgO
HFeaWR1xmQ4xp9qgR73kuOpAoi1FwrrIpq5wy9Mp4FbvKIOhTwg9JVYMb/a04CUL
YOHWpClLNodV6CkFgPXjNH1FbkzE/hudVUq9Z4CJnRkEV+fUNoitlKsV8AMfR82A
DKGLiTwg49ZT5pm3zrOR/DV7f3eVJlaPv8zEu8Oy2dHjHaRfsuiYCtkw9YelDj4I
yVQ8+m3JaMGH9MWhphQgHevO10LWYQcL0ZY24uj7cMBGEmudLU768mEvpCi3qnZN
+B/WExrXJ6+KqCoZqWT4U+R3okixBO++3vkBdptLjXGGrnVLJ72DgMwOfZwJ1xOL
sZVYJ0R8CS96URlCUMMf
=LzuP
-----END PGP SIGNATURE-----

--rTHIjeKG9uUlSyhr--
