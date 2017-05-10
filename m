From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: Re: [PATCH v3] arm: dts: sun7i-a20-bananapi: name the GPIO lines
Date: Wed, 10 May 2017 06:47:58 +0200
Message-ID: <17553199-cc74-96ae-bc75-5e91b866ccd1@rempel-privat.de>
References: <1494048638-24365-1-git-send-email-linux@rempel-privat.de>
 <20170509202725.e2tkry7dmsgx7se5@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uqWsLDpF7bxRIs8TN7kxweMAjJmgRnx3U"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170509202725.e2tkry7dmsgx7se5@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uqWsLDpF7bxRIs8TN7kxweMAjJmgRnx3U
Content-Type: multipart/mixed; boundary="UwlDB5iUD3Wr2wuqeDdM6GVaqhduOpb7B";
 protected-headers="v1"
From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>,
 devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Message-ID: <17553199-cc74-96ae-bc75-5e91b866ccd1-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: Re: [PATCH v3] arm: dts: sun7i-a20-bananapi: name the GPIO lines
References: <1494048638-24365-1-git-send-email-linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
 <20170509202725.e2tkry7dmsgx7se5@lukather>
In-Reply-To: <20170509202725.e2tkry7dmsgx7se5@lukather>

--UwlDB5iUD3Wr2wuqeDdM6GVaqhduOpb7B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 09.05.2017 um 22:27 schrieb Maxime Ripard:
> Hi Oleksij,
>=20
> It looks much better, thanks!
>=20
> On Sat, May 06, 2017 at 07:30:38AM +0200, Oleksij Rempel wrote:
>> This names the GPIO lines on the Banana Pi board in accordance with
>> the A20_Banana_Pi v1.4 Specification.
>>
>> This will make these line names reflect through to user space
>> so that they can easily be identified and used with the new
>> character device ABI.
>>
>> Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
>> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>=20
> Usually, it's better here if you put a change log with the things that
> changed from one version to another.
>=20
> You probably remember all of the comments that were made on the
> previous version of that patch, but I don't ;)

ok.

>=20
>>  arch/arm/boot/dts/sun7i-a20-bananapi.dts | 51 +++++++++++++++++++++++=
+++++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/=
dts/sun7i-a20-bananapi.dts
>> index 91f2e5f..6b326b3 100644
>> --- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
>> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
>> @@ -178,6 +178,57 @@
>>  };
>> =20
>>  &pio {
>> +	gpio-line-names =3D
>> +		/* PA */
>> +		"ERXD3", "ERXD2", "ERXD1", "ERXD0", "ETXD3",
>> +			"ETXD2", "ETXD1", "ETXD0",
>> +		"ERXCK", "ERXERR", "ERXDV", "EMDC", "EMDIO",
>> +			"ETXEN", "ETXCK", "ECRS",
>> +		"ECOL", "ETXERR", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		/* PB */
>> +		"PMU-SCK", "PMU-SDA", "", "", "", "", "", "",
>> +		"", "USB0-DRV", "", "", "", "", "", "",
>> +		"", "", "", "", "SCL", "SDA", "", "",
>=20
> I'm not sure how it's called in the schematics / documentation, but
> having a way to get which bus it's from would be helpful (like you did
> for the PMIC I2C bus).

I use only names provided by schematics. Using something different IMO
makes no sense and confusing.

>> +		"", "", "", "", "", "", "", "",
>> +		/* PC */
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		/* PD */
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		/* PE */
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		/* PF */
>> +		"SD0-D1", "SD0-D0", "SD0-CLK", "SD0-CMD", "SD0-D3",
>> +			"SD0-D2", "", "",
>=20
> Why did you change the wrapping and indentation on those two lines?

i use 8 entry per line to keep counting easier. If line is too wide, i
wrap it with changed indentation.

>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		/* PG */
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		"", "", "", "", "", "", "", "",
>> +		/* PH */
>> +		"TXD0", "RXD0", "IO-1", "PH3", "USB0-IDDET", "PH5", "", "",
>=20
> What are PH3 and PH5 used for on the board? Can't we provide a more
> explicit name?

Only names used by schematic :) If we will use something different users
will hate us even more.

I can image to use some kind of combination of connector name and pin
name. For example: "JP1-RXD0", or some thing like this.

> Thanks!
> Maxime
>=20


--=20
Regards,
Oleksij


--UwlDB5iUD3Wr2wuqeDdM6GVaqhduOpb7B--

--uqWsLDpF7bxRIs8TN7kxweMAjJmgRnx3U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF4EAREIAAYFAlkSm4MACgkQHwImuRkmbWl13AD5ARNRNQRG7/NrNMLbvkDcKbU5
4oigR4pFeK+B7sTI9lIA/087YnUBq7d1jZRFLg7m7u3gpwnzZB30iE+GA/yBM7ZO
=MIa3
-----END PGP SIGNATURE-----

--uqWsLDpF7bxRIs8TN7kxweMAjJmgRnx3U--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
