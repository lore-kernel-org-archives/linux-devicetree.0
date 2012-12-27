From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V2 1/2] regulator: tps51632: add register property for
 regmap
Date: Thu, 27 Dec 2012 17:32:33 +0000
Message-ID: <20121227173233.GI5005@opensource.wolfsonmicro.com>
References: <1356447960-6084-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlxN1C6awaFNesUv"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1356447960-6084-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, lrg@ti.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--UlxN1C6awaFNesUv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 25, 2012 at 08:35:59PM +0530, Laxman Dewangan wrote:
> All TPS51632 registers are not readable/writable and
> non-volatiles.

Applied both, thanks, but you might wish to consider...

> +static bool is_read_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case 0x08 ... 0x0F:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}

...using the new table based stuff for the access checks, at least this
one seems to map on nicely.

--UlxN1C6awaFNesUv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ3IYfAAoJELSic+t+oim9i1YP/0MWECJRiBQq4pBJ/mNCbesb
yjHlCxe3r9Jq2lCNK6QSKkfL/TYbPHpiDRDU1dJdPrMykBSeRhyLBCdeOE5d25EY
TLIh/PBXSX5c23UVXhczusOvnFR/D2ypS+u00JmODpimFftEFH2oWCWtRb3XIrv+
wgzGvxWq3iCm5b+yuC0cq+f5WJJGOTXlDxXlcU1qFB5uNa0Pa4fqUagY96/ZHiez
Vo0MOQsctXlfEh0p/hkvf++Kpl0KxeqWFc/KdAJmRGQ3VTjqEBdPIi6HnsWjA1xn
xVp9zQ1ku09tgvVB0m/ruwnNdCHZCF6XPIb4XaUWjvtLfwSOOaKNi0N4P52KwNM6
k8xgc+qZvt37mBmUVV2kXtf/77NhbMHtThzxuSwKmWirpzXPBLmxopnqTamkq3Ge
QuhjqXs2W6e1arl1tRbcHJxwS7084AUbPJhuXpT1i0Qd9REpQEk90fblVg6DeL3x
4SH6RnkdIMAnquLwoRAwXmL9XxaY/08b2M9BoTcEdGv9KYudKHv+dgOYc19snm/I
yU+Gl60chNA1RJElRYfv8gbabGKzPq+ewqvyBZNOx8GQazhwGlmzRp1S+ybco8FA
mebcCKSu86bpN2XxdEZ5xPJ2Vei544kLYUj/SjmOoMJSQ4qRR8BB21Yfbmq4UKAe
m2v/w/5tAQhYxReRzw2k
=meFw
-----END PGP SIGNATURE-----

--UlxN1C6awaFNesUv--
