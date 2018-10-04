From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Re-add "syscon" compatible
Date: Thu, 4 Oct 2018 17:02:37 +0200
Message-ID: <20181004150237.hsvytl6iycow5xyo@flea>
References: <20180917152857.162662-1-andre.przywara@arm.com>
 <CAGb2v643=V_3DbLeEyXEavSQJsW2KdknpZZLfw4QwCjhfdmVsA@mail.gmail.com>
 <20180921153522.0413c280@donnerap.Emea.Arm.com>
 <20180921151625.wkaypyueyi2pguur@flea>
 <20180924112230.73e3009b@donnerap.Emea.Arm.com>
 <20180926095202.tdibor3x7fsn6afz@flea>
 <22014c5e-fee0-d4c6-bc6c-cd30c8545292@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7538791947842879316=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <22014c5e-fee0-d4c6-bc6c-cd30c8545292@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?utf-8?B?QW5kcsOp?= Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, devicetree <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.xyz>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org


--===============7538791947842879316==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="habiwgrdypple55s"
Content-Disposition: inline


--habiwgrdypple55s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 01, 2018 at 01:55:19AM +0100, Andr=E9 Przywara wrote:
> >> So I am sorry if those things frustrate you (which I can understand
> >> very well), but I believe fixing the DT in a proper way is
> >> much more user friendly in the long term (actually this issue was
> >> brought forward by a user[1]).
> >=20
> > Given the current state of the industry, I don't really see how the DT
> > can allow you to do what you are trying to achieve.
>=20
> I am not sure I do understand what you mean with "industry"? If you are
> thinking about the SoC vendor or board vendors to push this endeavor and
> create stable bindings and DTs from the beginning: I see that this won't
> work with the prevalent attitude across many vendors today.

This is what I meant.

> But in our case we (as the community) drive the DTs and the bindings
> anyway, and we decided to mostly ignore Allwinner's DT effort - for good
> reasons. So we can - given consensus on the goals and approach - make
> this possible and don't need to rely on any company or "industry".

Actually, I think this is part of the reason. We like our DT bindings
so much that we are ready to spend monthes debating on it, while with
ACPI (or the DT from the older days, from what I understood) you're
stuck with whatever comes with the board. Whether one likes it or not
doesn't matter. And then you can use whatever kernel with it.

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--habiwgrdypple55s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlu2K40ACgkQ0rTAlCFN
r3RrYg/9EVjmFhy/2UAxQX2a6PKIBNmgKYpnT+ddWMceyyEeXrbQ8Xw5EuyKJVTv
iXZHyU1brdcpPVqsf6CeHG0HQuKkMcSWU/uZuCBNzCvdFAkM3fLtkaZeKjNZ9fOx
FKz0i76KO+IS9mwakngd8S3SpTUyEtDdfRwBvMGBhwmCxAaG8NgvtqIiDuMitq2w
SBpcYL7xo6EDQhnOcA+cE6LyeYqspsuA6bx8id4sQTTNxa7+9cvk+ESxe1Er7Db7
9sx2bD6kjZpjc9JHD/gNYPce/KzQz9AxpWUuYGzkrMg+dAgt27xq5aXNGyNp+Q8b
QwEyh9NbiifU+30cFMTmzor6yB/+WywlSXq5JmpaIBz5LX3AHwOLci1kT07tBqdN
wQ7rHfDhIeP/AIMDnlMJSWLUAkpEPN6TipioqUVXBDGc/trvHRTabSFAsE4QROqX
U0ac69gz0x5Rst27XP7YAY56YHEuDHJprQo2MVz1IvCDXvBnMbOVCRjlduCjNzhl
PizDwBnIYg1wX4Gsizm0WRov4UqPffBRcQpbyZzVyDzznpBwcvET6xqcyz65oMEh
vSHIol+iKQsRotxQ145s0566MX0jcDZW87aqDr77E4VOQh2i2VCkXjXSv3d/sNOD
Dl+l3b1C7PTmDH4lqc6NvIxjoIfmdRXt4NzC6ghrqch1ifgG3vI=
=Hif9
-----END PGP SIGNATURE-----

--habiwgrdypple55s--


--===============7538791947842879316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7538791947842879316==--
