From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] regulator: mc13xxx: Add warning of incorrect
 names of regulators
Date: Sun, 28 Apr 2013 02:10:31 +0100
Message-ID: <20130428011031.GB20197@sirena.org.uk>
References: <1367044165-6373-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1630133597166979642=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1367044165-6373-1-git-send-email-shc_work@mail.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1630133597166979642==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 27, 2013 at 10:29:24AM +0400, Alexander Shiyan wrote:
> This patch adds a warning about incorrect regulators instead of
> printing the names of non-information message about the wrong amount.

Applied both, thanks.

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRfHcEAAoJELSic+t+oim9AwwP/jBC4PGPZa0oLo2cYY8LI6jo
1L3lkdjTVlWgBeT2cojLI9LzOm/rupZlZ3kaU5tDnhRKe6WI+1YgFEelk+SWFGIf
SbxU204VPkOKA4ulJZPqvc0QD94ZWYwe9OOHE0h7sO7+0YtyaTaL44ezvqXCr9Y5
NpSeT8HZm89MtpfcyCdABrAQOfmjoZGykE4IlrWCWlIKeAskYJUR1fSPBptY9f9u
74hdGrwovip6cwm2nSZ5sHWbIiFm0s6dLDa69yadwSI3mg7XOgPG7tGH8FKQOYC/
Z1m7BW38jxwExv2+4XGLWlto1aB841TzU0i8I8nNhwE/DLZUU9kCTw4v1RrvWSDf
fMuLT7fCtl7iTzPB/9vBPHp44RkTk5QM6mCuJ5OxBeGir7Sn7S6TfcU595JMkB0U
OCajFYfxH/9ms+Cybiy3aMu1n1SWw5QkSZvXIc8uTOZzuA2wQSWJmxV24UP7sF7F
dPVRP/NPH3ugZTnM7VLGcDdUCWX6xJOzQ9EA5m0r7CaXuPg/DdEqNZrQeEVTV+Uu
iwYfORinoippIGtNkEbgfOMxGTFIeNI0/2J9Rry5ebLriNYHtpH1KdAvzlJMIeMB
qgz7bWwY/h5jK5S5+lBKexZ1Cvv+x4jDuOst3ijQ+F7lFwIWRhONngw6stAbE3Uu
r9ONcQiwnx35o9DDMnOx
=f88+
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--


--===============1630133597166979642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1630133597166979642==--
