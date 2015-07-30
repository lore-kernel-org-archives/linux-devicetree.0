From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v2 2/2] ARM: at91: sama5/dt: update rstc to correct compatible
 string
Date: Thu, 30 Jul 2015 18:45:42 +0200
Message-ID: <55BA54B6.2080802@atmel.com>
References: <1437384726-24927-1-git-send-email-josh.wu@atmel.com> <1437384726-24927-2-git-send-email-josh.wu@atmel.com> <55ACEB9B.70901@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55ACEB9B.70901@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Wu <josh.wu@atmel.com>, linux-arm-kernel@lists.infradead.org, Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Le 20/07/2015 14:37, Nicolas Ferre a =E9crit :
> Le 20/07/2015 11:32, Josh Wu a =E9crit :
>> They'll use "atmel,sama5d3-rstc" for reset function.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
>=20
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
>=20
> And we'll have to synchronize with the other patches. The best way to
> deal with that can be to take both of them with us through arm-soc.
>=20
> Sebastian,
>=20
> 1/ as you weren't in the CC list of the original patch, do you want m=
e
> to re-send the whole series?
>=20
> 2/ can we take these driver's changes with use through the arm-soc gi=
t
> tree so that we can manage the synchronization better?

Okay, so to ease synchronization, I take this one with me through
arm-soc and add the old compatibility string as a fallback =3D> the new=
er
will be used when merged...

Thanks, bye.


> Thanks, bye,
>=20
>> ---
>>
>> Changes in v2: None
>>
>>  arch/arm/boot/dts/sama5d3.dtsi | 2 +-
>>  arch/arm/boot/dts/sama5d4.dtsi | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama=
5d3.dtsi
>> index 9e2444b..280255b 100644
>> --- a/arch/arm/boot/dts/sama5d3.dtsi
>> +++ b/arch/arm/boot/dts/sama5d3.dtsi
>> @@ -1259,7 +1259,7 @@
>>  			};
>> =20
>>  			rstc@fffffe00 {
>> -				compatible =3D "atmel,at91sam9g45-rstc";
>> +				compatible =3D "atmel,sama5d3-rstc";
>>  				reg =3D <0xfffffe00 0x10>;
>>  			};
>> =20
>> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama=
5d4.dtsi
>> index 3ee22ee..481196c 100644
>> --- a/arch/arm/boot/dts/sama5d4.dtsi
>> +++ b/arch/arm/boot/dts/sama5d4.dtsi
>> @@ -1277,7 +1277,7 @@
>>  			};
>> =20
>>  			rstc@fc068600 {
>> -				compatible =3D "atmel,at91sam9g45-rstc";
>> +				compatible =3D "atmel,sama5d3-rstc";
>>  				reg =3D <0xfc068600 0x10>;
>>  			};
>> =20
>>
>=20
>=20


--=20
Nicolas Ferre
