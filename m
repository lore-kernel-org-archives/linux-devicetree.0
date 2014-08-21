From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 2/3] ARM: zynq: DT: Move size/address properties to dtsi
Date: Thu, 21 Aug 2014 10:42:52 +0200
Message-ID: <19edc7a7-15e8-486f-87da-04c7625b661a@BL2FFO11FD024.protection.gbl>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
 <1408550219-19825-2-git-send-email-soren.brinkmann@xilinx.com>
 <53F4C615.9060908@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="5FaQuXaMtfLtwmoNnsjfE7VhggI2N7NPf"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53F4C615.9060908@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Soren Brinkmann <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

--5FaQuXaMtfLtwmoNnsjfE7VhggI2N7NPf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08/20/2014 06:00 PM, Andreas F=C3=A4rber wrote:
> Am 20.08.2014 17:56, schrieb Soren Brinkmann:
>> Move the GEM's size and address cells properties to the common
>> dtsi file.
>>
>> Cc: Andreas F=C3=A4rber <afaerber@suse.de>
>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>> ---
>>  arch/arm/boot/dts/zynq-7000.dtsi      | 4 ++++
>>  arch/arm/boot/dts/zynq-parallella.dts | 2 --
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Applied.

Thanks,
Michal



--5FaQuXaMtfLtwmoNnsjfE7VhggI2N7NPf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlP1sQwACgkQykllyylKDCFT5wCfRlxMDuk+bvPQryPdOiSbYMFQ
QFgAni0blUUknfS1F0fDeXZqcGtbVFyn
=x7T+
-----END PGP SIGNATURE-----

--5FaQuXaMtfLtwmoNnsjfE7VhggI2N7NPf--
