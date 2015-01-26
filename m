From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: at91: sama5d4: dts: change the nand compatible
 string
Date: Mon, 26 Jan 2015 16:07:36 +0100
Message-ID: <54C65838.4020707@atmel.com>
References: <1421656387-12538-2-git-send-email-josh.wu@atmel.com> <1421923305-10088-1-git-send-email-josh.wu@atmel.com> <54C0D872.6010005@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C0D872.6010005-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 22/01/2015 12:01, Nicolas Ferre a =E9crit :
> Le 22/01/2015 11:41, Josh Wu a =E9crit :
>> As we introduce a new "atmel,sama5d4-nand" compatible string for sam=
a5d4,
>> so we need to apply it for sama5d4 chip.
>>
>> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>=20
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>=20
> Brian,
> I suppose that it makes sense to keep this patch with the previous on=
e.
> So, can you take it in your tree?
>=20
> Otherwise, it can take the at91 -> arm-soc route.

Bryan,

I take it with me right now and try to send it to arm-soc for 3.20.

Best regards,


>> ---
>>
>> Changes in v2:
>> - still keep the old rm9200 nand compatible string for compatible ol=
d driver.
>>
>>  arch/arm/boot/dts/sama5d4.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama=
5d4.dtsi
>> index 1b0f30c..e40b1da 100644
>> --- a/arch/arm/boot/dts/sama5d4.dtsi
>> +++ b/arch/arm/boot/dts/sama5d4.dtsi
>> @@ -267,7 +267,7 @@
>>  		};
>> =20
>>  		nand0: nand@80000000 {
>> -			compatible =3D "atmel,at91rm9200-nand";
>> +			compatible =3D "atmel,sama5d4-nand", "atmel,at91rm9200-nand";
>>  			#address-cells =3D <1>;
>>  			#size-cells =3D <1>;
>>  			ranges;
>>
>=20
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
