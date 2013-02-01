From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH 2/2] drm/exynos: Add device tree based discovery support for G2D
Date: Fri, 1 Feb 2013 21:58:05 +0900
Message-ID: <E382E0B5-2695-4293-B264-FB4C54FE4F9D@gmail.com>
References: <1359107722-9974-1-git-send-email-sachin.kamat@linaro.org> <1359107722-9974-2-git-send-email-sachin.kamat@linaro.org> <CAAQKjZNc0xFaoaqtKsLC=Evn60XA5UChtoMLAcgsWqyLNa7ejQ@mail.gmail.com> <510987B5.6090509@gmail.com> <050101cdff52$86df3a70$949daf50$%dae@samsung.com> <510B02AB.4080908@gmail.com> <0b7501ce0011$3df65180$b9e2f480$@samsung.com> <00fd01ce001b$5215a3f0$f640ebd0$%dae@samsung.com> <CAK9yfHxqqumg-oqH_Ku8Zkf8biWVknF91Su0VkWJJXjvWQ3Jhw@mail.gmail.com> <510B9EC8.6020102@samsung.com> <CAK9yfHw+aTgiLwGVJt=J9-ie4-2JAaF4Nh3n4tjcHp6w2JHamg@mail.gmail.com> <014401ce006f$c7dd1dd0$57975970$%dae@samsung.com> <CAK9yfHyEdd_nr5eqT9WZ4+J9LHczL4U5VAUEwzzjbH1H0xgjUQ@mail.gmail.com> <014501ce0072$9eca1a80$dc5e4f80$%dae@samsung.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <014501ce0072$9eca1a80$dc5e4f80$%dae@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org





2013. 2. 1. =BF=C0=C8=C4 8:52 Inki Dae <inki.dae@samsung.com> =C0=DB=BC=
=BA:

>=20
>=20
>> -----Original Message-----
>> From: linux-media-owner@vger.kernel.org [mailto:linux-media-
>> owner@vger.kernel.org] On Behalf Of Sachin Kamat
>> Sent: Friday, February 01, 2013 8:40 PM
>> To: Inki Dae
>> Cc: Sylwester Nawrocki; Kukjin Kim; Sylwester Nawrocki; linux-
>> media@vger.kernel.org; dri-devel@lists.freedesktop.org; devicetree-
>> discuss@lists.ozlabs.org; patches@linaro.org
>> Subject: Re: [PATCH 2/2] drm/exynos: Add device tree based discovery
>> support for G2D
>>=20
>> On 1 February 2013 17:02, Inki Dae <inki.dae@samsung.com> wrote:
>>>=20
>>> How about using like below?
>>>        Compatible =3D ""samsung,exynos4x12-fimg-2d" /* for Exynos42=
12,
>>> Exynos4412  */
>>> It looks odd to use "samsung,exynos4212-fimg-2d" saying that this i=
p is
>> for
>>> exynos4212 and exynos4412.
>>=20
>> AFAIK, compatible strings are not supposed to have any wildcard
> characters.
>> Compatible string should suggest the first SoC that contained this I=
P.
>> Hence IMO 4212 is OK.
>>=20

Oops, one more thing. AFAIK Exynos4210 also has fimg-2d ip. In this cas=
e, we should use "samsung,exynos4210-fimg-2d" as comparible string and =
add it to exynos4210.dtsi?
And please check if exynos4212 and 4412 SoCs have same fimg-2d ip. If i=
t's different, we might need to add ip version property or compatible s=
tring to each dtsi file to identify the ip version.

Sorry but give me your opinions.

Thanks,
Inki Dae


>=20
> Got it. Please post it again.
>=20
>>=20
>> --
>> With warm regards,
>> Sachin
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-medi=
a" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
