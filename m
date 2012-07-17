From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH REBASE] regulator: tps65910: set input_supply on desc
 unconditionally
Date: Tue, 17 Jul 2012 11:08:04 +0100
Message-ID: <20120717100804.GA4477@opensource.wolfsonmicro.com>
References: <1342505046-8176-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1342505046-8176-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: lrg@ti.com, rob.herring@calxeda.com, swarren@wwwdotorg.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 17, 2012 at 11:34:06AM +0530, Laxman Dewangan wrote:
> Set the supply_name in the regulator descriptor unconditionally
> and make this parameter as required parameter in the device
> node for successfully registration of the regulator.

Applied, thanks.

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQBTl9AAoJEBus8iNuMP3doTcP/ReEpR1pUtioM3ZuIA92kz6l
Beg+oBUXTaM9gqrtzFdyfIMJgET2oShbc5SVGHR6qAYOraiF70GY0q9udJUNT6GA
Z5xmG9/4P19v8o9Y+VQ6qrPn/jmHCCppLi6n9Cy2mW/SFDZofzhyJD+aMycYcKC9
eKqpfY4TAnjlvpUZMw8tnte0ppOyvm5H3UXuaHzNmFvfdURavQpDV1OeqGuI6sDy
rBDckYACsz7hEUqhE1s8M12wLhaU/gIRurJGZzbsBIT7QgWfUPpNElpUXDTRwI77
mIeptnrEDSkP7Vxg8ITcsXa48kGzAh6ePFLD6GwiowUySWuhAz+MFU0rjb0h8PhC
ajiVOl8ZCKXFmhsC+2tzLKbe9eMN5fcDQRphZOi84jyHFXMiTGFD4NP6H7WHW0+x
yi9nuOg3YTPTqEEGiwmhiRXp+iBNZvreA1XsRnHgPBluyt57RemvVWsqrG6nMMEe
9EO6OcUFe3+etyEnr/xcjbbq0OVFplJI/LzURO/G97rAPulIE7XHYHsiqEFvyz/O
wUwsJ+VE0OM5YZ2QU0mnReMh6G1n03IBSOYUYgDgVVUJv7GDvggAbCqKWfYir6Io
gDyS7t56uyrUnjE8jBiSWVkK868LejZIaE4X4KPMXXQpNc7WAmRw+QBF1lIO22xI
TzTXWRDUGcRl5QGMSpQ+
=FEQ9
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
