From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sama5d4: add labels for watchdog and
 pinctrl nodes
Date: Mon, 25 Jan 2016 14:35:35 +0100
Message-ID: <56A624A7.30403@atmel.com>
References: <1453293337-16078-1-git-send-email-LW@KARO-electronics.de>
 <1453293337-16078-3-git-send-email-LW@KARO-electronics.de>
 <20160125111936.GC4027@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160125111936.GC4027-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Lothar_Wa=c3=9fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 25/01/2016 12:19, Alexandre Belloni a =E9crit :
> Hi,
>=20
> On 20/01/2016 at 13:35:36 +0100, Lothar Wa=DFmann wrote :
>=20
> Ditto, this needs a commit message.
>=20
>> Signed-off-by: Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
>=20
> Else,
>=20
> Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

I agree with this:
Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Thanks, bye.


>> ---
>>  arch/arm/boot/dts/sama5d4.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama=
5d4.dtsi
>> index 6c0dc89..fb40014 100644
>> --- a/arch/arm/boot/dts/sama5d4.dtsi
>> +++ b/arch/arm/boot/dts/sama5d4.dtsi
>> @@ -1299,7 +1299,7 @@
>>  				clocks =3D <&h32ck>;
>>  			};
>> =20
>> -			watchdog@fc068640 {
>> +			watchdog: watchdog@fc068640 {
>>  				compatible =3D "atmel,sama5d4-wdt";
>>  				reg =3D <0xfc068640 0x10>;
>>  				clocks =3D <&clk32k>;
>> @@ -1351,7 +1351,7 @@
>>  			};
>> =20
>> =20
>> -			pinctrl@fc06a000 {
>> +			pinctrl: pinctrl@fc06a000 {
>>  				#address-cells =3D <1>;
>>  				#size-cells =3D <1>;
>>  				compatible =3D "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pi=
nctrl", "simple-bus";
>> --=20
>> 2.1.4
>>
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
