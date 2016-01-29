From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 1/2] regulator: act8945a: add regulator driver for
 ACT8945A
Date: Fri, 29 Jan 2016 13:03:37 +0100
Message-ID: <20160129120337.GS4130@sirena.org.uk>
References: <1453863463-30515-1-git-send-email-wenyou.yang@atmel.com>
 <1453863463-30515-2-git-send-email-wenyou.yang@atmel.com>
 <20160129001603.GM4130@sirena.org.uk>
 <B256D81BAE5131468A838E5D7A243641D63FBF8B@penmbx01>
 <20160129113518.GQ4130@sirena.org.uk>
 <CABxcv=kNKmgRytxB5ppawrAvC-GDRhV4T_UUGvpHgKp9+BsUmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1462382587272111873=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABxcv=kNKmgRytxB5ppawrAvC-GDRhV4T_UUGvpHgKp9+BsUmQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Ferre,
 Nicolas" <Nicolas.FERRE@atmel.com>, Liam Girdwood <lgirdwood@gmail.com>, "Yang,
 Wenyou" <Wenyou.Yang@atmel.com>, Peter Korsgaard <jacmet@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============1462382587272111873==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="flpRHSNNLnUanxKW"
Content-Disposition: inline


--flpRHSNNLnUanxKW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 29, 2016 at 08:50:19AM -0300, Javier Martinez Canillas wrote:

> Then he should remove the .of_compatible from the MFD cell definition.

Yes, obviously.

--flpRHSNNLnUanxKW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWq1UEAAoJECTWi3JdVIfQa+wH/j/EQ8hiDsporV11PMJS5xNl
bKsSr6uxSVTBJr7DzGzov4rkb/L8E6j9XVSO8Rs9mJSS4s8gdh5edMpAdAWkwR2r
35bcAEvwryZBRGo73sw3lKvIc/wasJa90xMbdnFbHq6RZ5vSAwMPMKbNuJphV+LH
SrETGozU4/5MYRzF2F4X6E9/BahM3Eww8A/9ROkjesrYRkWdE6F2PvScodMYHl/M
7gb2LfkqxvW7AKlEkPuQQXcVkz3C+7BqzvrULNjEkt4b4HxdLXNxEmIE+ZAXXfTX
9ynC/xBj6XdVp96Qwymo39odD2ka9TM/m2oGO3BkvG5YmuURMKxH7r6ZXOmJvEc=
=B7Ii
-----END PGP SIGNATURE-----

--flpRHSNNLnUanxKW--


--===============1462382587272111873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1462382587272111873==--
