From: Paul Cercueil <paul@crapouillou.net>
Subject: RE: [PATCH 3/4] memory: jz4780-nemc: Reduce size of const array
Date: Thu, 23 Aug 2018 14:52:57 +0200
Message-ID: <1535028777.27779.1@crapouillou.net>
References: <20180822172953.11281-1-paul@crapouillou.net>
        <20180822172953.11281-3-paul@crapouillou.net>
        <b8fdca29afcb48aa9ee33cc896c24e66@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b8fdca29afcb48aa9ee33cc896c24e66@AcuMS.aculab.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Laight <David.Laight@ACULAB.COM>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alex Smith <alex@alex-smith.me.uk>, "od@zcrc.me" <od@zcrc.me>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi David,

Le jeu. 23 ao=FBt 2018 =E0 12:41, David Laight <David.Laight@ACULAB.COM>=20
a =E9crit :
> From: Paul Cercueil
>>  Sent: 22 August 2018 18:30
>>  The maximum value found in that array is 15, there's no need to=20
>> store
>>  these values as uint32_t, a uint8_t is enough.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/memory/jz4780-nemc.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>>  diff --git a/drivers/memory/jz4780-nemc.c=20
>> b/drivers/memory/jz4780-nemc.c
>>  index bcf06adefc96..ef3f20e46590 100644
>>  --- a/drivers/memory/jz4780-nemc.c
>>  +++ b/drivers/memory/jz4780-nemc.c
>>  @@ -161,7 +161,7 @@ static bool jz4780_nemc_configure_bank(struct=20
>> jz4780_nemc *nemc,
>>   	 * Conversion of tBP and tAW cycle counts to values supported by=20
>> the
>>   	 * hardware (round up to the next supported value).
>>   	 */
>>  -	static const uint32_t convert_tBP_tAW[] =3D {
>>  +	static const u8 convert_tBP_tAW[] =3D {
>>   		0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
>>=20
>>   		/* 11 - 12 -> 12 cycles */
>>  @@ -232,7 +232,7 @@ static bool jz4780_nemc_configure_bank(struct=20
>> jz4780_nemc *nemc,
>>   			return false;
>>   		}
>>=20
>>  -		smcr |=3D convert_tBP_tAW[cycles] << NEMC_SMCR_TBP_SHIFT;
>>  +		smcr |=3D (u32)convert_tBP_tAW[cycles] << NEMC_SMCR_TBP_SHIFT;
>=20
> You don't need the cast here.

OK, I will remove them in V2.

>=20
> 	David
>=20
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,=20
> MK1 1PT, UK
> Registration No: 1397386 (Wales)
>=20
=
