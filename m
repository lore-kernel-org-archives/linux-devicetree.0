From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: at91/dt: sam9263: Fix typo: ac91_clk -> ac97_clk
Date: Wed, 10 Dec 2014 11:04:33 +0100
Message-ID: <54881AB1.3040609@atmel.com>
References: <1417789016-20001-1-git-send-email-alexanders83@web.de> <2676241.BfXNcaGQ7Q@kongar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2676241.BfXNcaGQ7Q@kongar>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 05/12/2014 16:00, Alexander Stein a =E9crit :
> On Friday 05 December 2014, 15:16:55 wrote Alexander Stein:
>> That clock should be called ac97_clk.
>>
>> Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/at91sam9263.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/=
at91sam9263.dtsi
>> index 7989756..5ed2810 100644
>> --- a/arch/arm/boot/dts/at91sam9263.dtsi
>> +++ b/arch/arm/boot/dts/at91sam9263.dtsi
>> @@ -294,7 +294,7 @@
>>  						reg =3D <17>;
>>  					};
>> =20
>> -					ac91_clk: ac97_clk {
>> +					ac97_clk: ac97_clk {
>>  						#clock-cells =3D <0>;
>>  						reg =3D <18>;
>>  					};
>>
>=20
> Please ignore those 2 patches for now. I made a mistake during local =
rebase.

Well at least this one (1/2) is valid and applies on my new
at91-3.20-dt. So I take it for now: tell me if you feel otherwise.

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Bye,


> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
