From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V2 2/2] spi: dual and quad support(device tree)
Date: Fri, 30 Aug 2013 23:23:23 +0100
Message-ID: <20130830222323.GC18608@sirena.org.uk>
References: <1377564603-4030-1-git-send-email-wangyuhang2014@gmail.com>
 <1377564603-4030-2-git-send-email-wangyuhang2014@gmail.com>
 <52210E14.8020006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1618938750173729867=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <52210E14.8020006@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com, sourav.poddar@ti.com, wangyuhang <wangyuhang2014@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============1618938750173729867==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GZVR6ND4mMseVXL/"
Content-Disposition: inline


--GZVR6ND4mMseVXL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 30, 2013 at 03:26:44PM -0600, Stephen Warren wrote:

> I would suggest the property names

> spi-tx-num-wires, spi-rx-num-wires

> or:

> spi-tx-bus-width, spi-rx-bus-width (this option from Tomasz Figa on IRC)

> Those name alone self-document their purpose much more clearly to me.

These both seem like good suggestions.

--GZVR6ND4mMseVXL/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSIRtXAAoJELSic+t+oim9MoMQAJWrxW5nY2H6AjqrcmmpKFit
wOE23V6DwWLzbVGrDzsUKm0Q5j5sVv5cxsTFP1eSyKpxo8tJUTw5cWOOFJwyjdOK
YrzNVwtDBeIdxGPLzDpcDDeHvSQRzuhBODX1IsOk955r8erlHrnZ7nwOg1mi9Vyn
3RYY2+wmj70n0/HKLQCyGMq8LEy32fVatmAv6RGE47vuoeQQerjxTic2uTUIr/8R
WHD2UkaK+jVRwiGvnL/281NnqsatJ0Hfm52U1osLQjqwO4me1ERxK1hTX3FFBtCY
0+9kI2wNNTOZFpQqJSoaLSorbohmCOi5wIFsKYwhpq9j/axlT16qnsq8FKvldu/b
XqtA1eclgeOSYG0tXrlhS+1bT5lr33mJsFZXe1hEAN7YM29r2NKY2yly2JJEqaXL
giBj8nBOD21BWUEJazBzYUA3RaVworwVth4IX8wHZ8imI1/UeKWgF2bK5Vgwc6qB
NiHx8oaKetFH8rXAv4RSQGVoEsit8EpFGf/s69KmUrJB2DJyDCwBzwp761Bd5HOv
zLP55xNNw9O0M+VGvdb1twaQMqBOaWFc/x5nOpMk0J1mA8rOLDNIt7AtOEOocbJx
Ws9SO2DFEK0ZO4uiXi1D/0ObCpeN5/0aOYS9MYxf953Fn9BB4qruNDhSE37KX/x0
23/spaa1IlDzdb1CsNK+
=cV0A
-----END PGP SIGNATURE-----

--GZVR6ND4mMseVXL/--


--===============1618938750173729867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1618938750173729867==--
