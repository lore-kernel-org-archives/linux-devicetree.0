From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] regulator: support for regulator match by
 regulator-compatible
Date: Tue, 19 Jun 2012 10:32:11 +0100
Message-ID: <20120619093211.GB3974@opensource.wolfsonmicro.com>
References: <1340085087-6608-1-git-send-email-ldewangan@nvidia.com>
 <1340085087-6608-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AdjLlRqdF7kYRNze"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1340085087-6608-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, swarren@wwwdotorg.org, sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--AdjLlRqdF7kYRNze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 19, 2012 at 11:21:26AM +0530, Laxman Dewangan wrote:
> Add API to match the chip regulator's id by the
> property of "regulator-compatible" on regulator node.

We shouldn't have two different methods for doing this, we should
standardise this over all regulator drivers (or at the very least those
using the existing framework code) - having the old framework in place
will at best be confusing for authors of new drivers.  We either need to
make it clear which framework to use or (ideally) remove the old
framework.

--AdjLlRqdF7kYRNze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP4EcUAAoJEBus8iNuMP3ddBgQAIP/CSU4PJMaAxsE0lqevXYc
FlbpUTkl1Go4U2zO5RLyaOtsfTfNOHeoPWDxM758tg2Mb07Eh6++o4VpLQk+F8te
YBYRFGSw/IMrT0+OsPtBhLXWKobnvpznkQkEWvQoOwm+pXHarM5to7UqhCbgdzRB
FMOXqbQZlNU6a9Xdql+X4XkLD74nvYSip86Pnxs7hAlAiYpBA/LpzzOaxQeUnsz0
wTbSnLXu5orv2q5EYMhpobavgUij3FbACK5cBMisZr8aMDAPMeARAU98kPdD3tlS
oxgwSUsrN3WYMw74oxV6DbXa7eq7YrvoOnTEf09TdIc3OSasnGyQ1tlD2jU5GP45
35N4o7nO3jQ8eGVcK+v2expPQbc6vTh2byyt/z+uASO5rqqA04hDacma5o/H2XCd
wllHUw/n7+DpSHgoLVmRENbrRma5np2IPkryZ3w8W+g41/+2GAjFSWpisPY5+Rq3
Tg6efWOCmQgddovDHOYVd6+3rh1B5vd3bbDbYvE6D4omrDps8fxDdDSaza4+tuUE
4XCwkMfZ+nlmK9QPqYB5smFhDsQirR1CISamrp3lgWLPf+cKGZrbIkOOPmtZATOI
iFRPo3nVxXiTUyG3OPXU/QtvJ21Q2mAVMKnSDQApZPwRRnr61C4avbgj0wv2oPST
v40Gq2hv2sRcM9niOqkL
=mK79
-----END PGP SIGNATURE-----

--AdjLlRqdF7kYRNze--
