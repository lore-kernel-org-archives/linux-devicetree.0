From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] mtd: spi-nor: add dt support for Everspin MRAMs
Date: Tue, 17 Jan 2017 16:49:34 +0100
Message-ID: <CACna6rz_g+N2rs=O-QRAka_BVMiMXhmC+O5KgeZJFmCe8bf1jQ@mail.gmail.com>
References: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
 <20170117110338.10756-1-u.kleine-koenig@pengutronix.de> <CACna6rwSZH8697px46KitcsFTROhqAQa2Cm2-RCTH=L_5nQFYg@mail.gmail.com>
 <82a0b0f7-a94b-70b5-1a5e-e5c04943a684@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <82a0b0f7-a94b-70b5-1a5e-e5c04943a684-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Masahiko Iwamoto <iwamoto-sK/J6oeM9AhgKrQr38906+qrae++aQT8@public.gmane.org>, Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17 January 2017 at 14:57, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wr=
ote:
> Le 17/01/2017 =C3=A0 14:16, Rafa=C5=82 Mi=C5=82ecki a =C3=A9crit :
>> On 17 January 2017 at 12:03, Uwe Kleine-K=C3=B6nig
>> <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>>> The MR25 family doesn't support JEDEC, so they need explicit mentioning
>>> in the list of supported spi IDs. This makes it possible to add these
>>> using for example:
>>>
>>>         compatible =3D "everspin,mr25h40";
>>
>> (...)
>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/=
Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> index 2c91c03e7eb0..3e920ec5c4d3 100644
>>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> @@ -14,6 +14,8 @@ Required properties:
>>>                   at25df641
>>>                   at26df081a
>>>                   mr25h256
>>> +                 mr25h10
>>> +                 mr25h40
>>>                   mx25l4005a
>>>                   mx25l1606e
>>>                   mx25l6405d
>>
>> Uh, this is getting a never-ending-story...
>> If these chipsets don't support JEDEC, should we keep them in jedec,spi-=
nor.txt?
>>
>
> Maybe not but I think the new compatible strings should be documented
> somewhere. Currently jedec,spi-nor.txt already documents all the
> "m25p*-nonjedec" memories. So maybe just renaming the jedec,spi-nor.txt
> file into spi-nor.txt or mtd,spi-nor.txt could be a solution. Otherwise, =
we
> can let it as is. I have no idea of what would be the best solution.
>
> To be honest, I don't always fully understand the DT policy/philosophy an=
d
> its requirements. I just thought when a new property or a new value is
> introduced it has to be documented.
> Generally speaking, when DT is involved in some series of patches, it oft=
en
> generates many discussions about the proper way to do thinks and about
> choosing the best between many technically functional solutions.
>
> If you think jedec,spi-nor.txt is not suited to document the new value fo=
r
> the compatible string, why not, I perfectly understand your point.
>
> I don't mind choosing another way. I just want to be sure that, if not al=
l,
> most of people agree on that solution and if possible, it is compliant wi=
th
> DT policy so everybody is happy and works together.
> That's why I involve DT people, even if it's a small detail, so they can
> advise us.
>
> Anyway, at some point we have to take a decision to carry on thinks.
> So actually, I would like to avoid a never-ending story :)

Sounds OK to me, I'm not DT expert though ;)

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
