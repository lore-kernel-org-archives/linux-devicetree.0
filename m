From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/5] mfd: arizona: Add device tree helper functions
Date: Tue, 24 Sep 2013 11:20:29 +0100
Message-ID: <20130924102029.GA3226@sirena.org.uk>
References: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <5240B464.2010903@wwwdotorg.org>
 <20130924094937.GN3635@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130924094937.GN3635@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, lee.jones@linaro.org, sameo@linux.intel.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, rob@landley.net, patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2013 at 10:49:37AM +0100, Charles Keepax wrote:

> The supply name in the driver is AVDD as is the name for the pin
> on the datasheet, if you specify it as AVDD1 in device tree the
> current driver will not load.

> This appears to have been a copy and paste error from the wm8994
> which has 2 AVDD supplies and I believe these docs were based
> on. I would prefer to update the documentation to match what the
> driver already expects rather than the other way around.

I suspect it's due to an error in an old version of one of the
datasheets.

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQWdqAAoJELSic+t+oim9NOwP/jiUE/A/DsO9pU6AYfMbNR2j
N3GApNNDuAytwQcg5wvpG4ucKOXJHvfuCoOeMC/F6+s1GplbJVHn8xQ4cfSUP+WE
QH7eJSRPHcJL18OvR6iXrN7wKF0ah3D08tWVPSrNHK4aZkMNZLSC9+otRvxZc5qJ
tt5s5k3t/GlTQ5qbOztU2NB9V4mSZjTm0y4SrBDj1k6oh+SSC9cQvsLoY5tb9Xe2
iWCBNLECOczs9uC4FWhQFv8smJuIHwCvTTZnD71tUIHg2RSfkzq2iutQdhcIkWtl
iF0H/FJ1wOmUIlaOa1Fld9tOaSvhsCzmF8nkA5kRYC95F0P0+umt78mlN8yPpCS5
Y7ZpnQQiiFOLxZVJIVb4mQWHPTlUg0Z2hIyDB2Sh/sMISKpag2FE9AB7WPFgApqk
wGyxdZxREbZGAkS7vk9PQCp8ex5TrweL15X0h8i5Apf+gCKild1PUMwLxnKMPUhM
ch7oy7anpAcxcxbsZaYQCZzxPf0eOwku/bWsns+k74B574q7xoyWCZbNd6I2xIEi
rB9g00YRWGVjzc1qqOn2tvi0zJBPP//LUepG+eUuLQAFO5RgSOn5TPGgtAG8kBOb
rrpMtf8yHtKxFBE8DmjaEmabbLakuCPCDyjnwD0q7rAV8egRokQcrdr2U2JXCtOy
rzwh7FYSOXb75V+0ZY/X
=u9yO
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
