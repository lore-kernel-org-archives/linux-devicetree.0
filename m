From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 1/2] regulator: act8945a: add regulator driver for
 ACT8945A
Date: Wed, 03 Feb 2016 11:45:56 +0900
Message-ID: <56B169E4.9030801@samsung.com>
References: <1453863463-30515-1-git-send-email-wenyou.yang@atmel.com>
 <1453863463-30515-2-git-send-email-wenyou.yang@atmel.com>
 <20160129001603.GM4130@sirena.org.uk>
 <B256D81BAE5131468A838E5D7A243641D63FBF8B@penmbx01>
 <20160129113518.GQ4130@sirena.org.uk> <87wpqn3t72.fsf@dell.be.48ers.dk>
 <B256D81BAE5131468A838E5D7A243641D64026A0@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <B256D81BAE5131468A838E5D7A243641D64026A0@penmbx01>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Korsgaard <jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03.02.2016 11:29, Yang, Wenyou wrote:
> Hi Peter,
>=20
>> -----Original Message-----
>> From: Peter Korsgaard [mailto:jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org] On Behalf Of Peter K=
orsgaard
>> Sent: 2016=E5=B9=B42=E6=9C=883=E6=97=A5 1:42
>> To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Yang, Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>; Liam Girdwood
>> <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Pawel Moll
>> <pawel.moll-5wv7dgnIgG8@public.gmane.org>; Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>; =
Kumar
>> Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>; Krzysztof Kozlowski
>> <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>; Javier Martinez Canillas <javier@dowhile0=
=2Eorg>;
>> Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>; Peter Korsgaard <jacmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
; Ferre,
>> Nicolas <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XQ@public.gmane.org=
org;
>> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH v4 1/2] regulator: act8945a: add regulator drive=
r for
>> ACT8945A
>>
>>>>>>> "Mark" =3D=3D Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>>
>>  > On Fri, Jan 29, 2016 at 01:20:08AM +0000, Yang, Wenyou wrote:
>>  >> > > +static const struct of_device_id act8945a_pmic_of_match[] =3D=
 {
>>  >> > > +	{ .compatible =3D "active-semi,act8945a-regulator" },
>>  >> > > +	{ },
>>  >> > > +};
>>  >> > > +MODULE_DEVICE_TABLE(of, act8945a_pmic_of_match);
>>
>>  >> > This seems mostly OK but why do we have a compatible string he=
re -
>> shouldn't  >> > the MFD be able to instantiate the regulator functio=
n without
>> needing this?
>>
>>  >> Because I got feedback from Javier for the act8945a-charger patc=
hes of this
>> MFD series,  >> He said missing the OF match table will cause the mo=
dule
>> autoloading broken.
>>
>>  >> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-Janua=
ry/398113.html
>>
>>  >> What do you think about it?
>>
>>  > If then device is not being loaded from the DT (and it shouldn't =
be, the  > device
>> looks like it should be instantiated directly by the MFD as it  > ca=
n't exist
>> separately to that MFD) an OF table will do nothing.
>>
>> To add to the confusion, the regulator part of the chip is actually =
identical to
>> act8865, so it could use the existing regulator driver / compatible,=
 except that it
>> binds to the platform bus instead of i2c.
>=20
> Thank you for your opinion.
>=20
> But I think It is better to make it a separate driver, the driver is =
simpler.=20

Do I understand correctly that you are creating a new device driver for
the same logical device (regulator block)?

By duplicating the code you are not making kernel simpler. Maybe your
new driver will be simple but still this adds a NEW driver instead of
re-using existing code.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
