From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 1/2] ARM: zynq: Remove bogus value from 'bias-disable'
 property
Date: Wed, 28 Jan 2015 15:21:19 +0100
Message-ID: <ce6e56872ab744a49612ef9bca07c73d@BN1AFFO11FD005.protection.gbl>
References: <1422301796-22888-1-git-send-email-soren.brinkmann@xilinx.com>
 <54C6DDE8.3000905@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1752180519077223602=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <54C6DDE8.3000905@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

--===============1752180519077223602==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Of3Md1kDMWwojpwvIlFLKVqWoDU8k6HtX"

--Of3Md1kDMWwojpwvIlFLKVqWoDU8k6HtX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/27/2015 01:38 AM, Andreas F=C3=A4rber wrote:
> Am 26.01.2015 um 20:49 schrieb Soren Brinkmann:
>> In one pinctrl node, a 'bias-disable' property is erroneously assigned=
 a
>> value.
>>
>> Fixes: ARM: zynq: DT: Add pinctrl information
>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>=20
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>=20
> Andreas
>=20

Applied both.

Thanks,
Michal


--Of3Md1kDMWwojpwvIlFLKVqWoDU8k6HtX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlTI8GMACgkQykllyylKDCHOvgCfbuar5AsiJInFpFDpFKWmS2/o
ao0AoIrnqImPrQk7T3HaPUuvPq6lfq7p
=ufXe
-----END PGP SIGNATURE-----

--Of3Md1kDMWwojpwvIlFLKVqWoDU8k6HtX--


--===============1752180519077223602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1752180519077223602==--
