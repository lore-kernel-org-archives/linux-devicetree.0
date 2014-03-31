From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH RFC 3/3] nand: pl353: Add driver for arm pl353 smc nand
 interface
Date: Mon, 31 Mar 2014 15:24:37 +0200
Message-ID: <53396C95.3030005@monstr.eu>
References: <1395944467-26291-1-git-send-email-punnaia@xilinx.com>
 <04cb5d02-db4c-4a4c-ba3c-3a5958e42324@VA3EHSMHS036.ehs.local>
 <533963AE.30405@monstr.eu>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0880592605911669741=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <533963AE.30405@monstr.eu>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: monstr@monstr.eu
Cc: mark.rutland@arm.com, jussi.kivilinna@iki.fi, linux-doc@vger.kernel.org, artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, arnd@arndb.de, michal.simek@xilinx.com, ezequiel.garcia@free-electrons.com, grant.likely@linaro.org, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, joern@logfs.org, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, robh+dt@kernel.org, acourbot@nvidia.com, pekon@ti.com, kalluripunnaiahchoudary@gmail.com, kpc528@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, rob@landley.net, galak@codeaurora.org, ivan.khoronzhuk@ti.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0880592605911669741==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="dCCb1NKaXCFEPGQLGGSoDEgcdQvE3KB73"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dCCb1NKaXCFEPGQLGGSoDEgcdQvE3KB73
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 03/31/2014 02:46 PM, Michal Simek wrote:
> On 03/27/2014 07:21 PM, Punnaiah Choudary Kalluri wrote:
>> Add driver for arm pl353 static memory controller nand interface.
>> This controller is used in xilinx zynq soc for interfacing the nand
>> flash memory.
>>
>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>> ---
>>  drivers/mtd/nand/Kconfig      |    8 +
>>  drivers/mtd/nand/Makefile     |    1 +
>>  drivers/mtd/nand/pl353_nand.c | 1122 ++++++++++++++++++++++++++++++++=
+++++++++
>>  3 files changed, 1131 insertions(+), 0 deletions(-)
>>  create mode 100644 drivers/mtd/nand/pl353_nand.c
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 90ff447..31c1d0c 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -510,4 +510,12 @@ config MTD_NAND_XWAY
>>  	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is =
attached
>>  	  to the External Bus Unit (EBU).
>> =20
>> +config MTD_NAND_PL353
>> +	tristate "ARM Pl353 NAND flash driver"
>> +	depends on MTD_NAND && ARM
>> +	select PL353_SMC
>=20
> Here should be probably depends on PL353_SMC.
> I just found it.

Just to be accurate.
When MEMORY=3Dn with select PL353_SMC you are not able select PL353_SMC
and compile it.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--dCCb1NKaXCFEPGQLGGSoDEgcdQvE3KB73
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlM5bJUACgkQykllyylKDCF0qQCcDmHw949CMV8efFU+LmmhfcUv
qWQAoJJeFYO+0Cc6OIOpYAO7E5Mfwus1
=1YW9
-----END PGP SIGNATURE-----

--dCCb1NKaXCFEPGQLGGSoDEgcdQvE3KB73--


--===============0880592605911669741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0880592605911669741==--
