From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
 compatibility string
Date: Tue, 21 May 2019 22:04:49 +0100
Message-ID: <20190521210449.GB1580@sirena.org.uk>
References: <20190516104046.23830-1-kuldeep.singh@nxp.com>
 <20190516104046.23830-2-kuldeep.singh@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6727787723434198018=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190516104046.23830-2-kuldeep.singh@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kuldeep Singh <kuldeep.singh@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Ashish Kumar <ashish.kumar@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============6727787723434198018==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2019 at 10:39:45AM +0000, Kuldeep Singh wrote:
> There are 2 version of QSPI-IP, according to which it can be big endian
> or little endian. There are some other minor changes as well.
> The big endian version uses driver compatible fsl,ls1021a-qspi and little
> endian version uses fsl,ls10280a-qspi

This doesn't apply against current code, please check and resend.

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzkZ/AACgkQJNaLcl1U
h9Dcggf/a5SCEOq1f8Uztg6sAxsCy+2TMZDAfoiuy9SH76QY+e6nHxdy+DrXkwPC
RGL2sLSSC9pbd1BqabLJn4+ivFrbs3FN6pG06RXTw8s9bm/jPC80df67eNaLt6Fq
Omyq0iYTAw3KMz3TyhdzmBeCS5T44EG+39ofRW5O2xms+mkXNPB7D5a8UjTj9OXr
vLoM4lx0yWLiMZ1KMZ0pc4/A9O3JXpamPmUn6+sYlVkW9680sM5ve1nzC3x9my0v
f4rFFjcJe/cFZ5PxkRMSeDeyJQTHRk3tWGnMBl81zKY0r+5x2Qfe/xg7tFHBNr7S
z6yi+WirwaH7QY8lCWCfWu9EFdwBSg==
=Titl
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--


--===============6727787723434198018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6727787723434198018==--
