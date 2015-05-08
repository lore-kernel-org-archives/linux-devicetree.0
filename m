From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add msm8916 CoreSight components
Date: Fri, 8 May 2015 21:17:12 +0300
Message-ID: <B19B6A91-0CF2-428B-8CAC-FFEDD5D3D094@linaro.org>
References: <1431012969-16338-1-git-send-email-ivan.ivanov@linaro.org> <1431012969-16338-3-git-send-email-ivan.ivanov@linaro.org> <CANLsYkzNXBH0d6v1Ny_JwpW6NcKr9v0oAi9K3YfipwDgHWfMMA@mail.gmail.com> <1431092877.21307.18.camel@linaro.org> <20150508180052.GD11680@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150508180052.GD11680@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Kumar Gala <galak@codeaurora.org>, Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


> On May 8, 2015, at 9:00 PM, Mark Rutland <mark.rutland@arm.com> wrote=
:
>=20
> On Fri, May 08, 2015 at 02:47:57PM +0100, Ivan T. Ivanov wrote:
>>=20
>> On Fri, 2015-05-08 at 07:38 -0600, Mathieu Poirier wrote:
>>> On 7 May 2015 at 09:36, Ivan T. Ivanov ivanov@linaro.org> wrote:
>>>> Add initial set of CoreSight components found on Qualcomm's 8x16 c=
hipset.
>>>>=20
>>>>=20
>>>> +       replicator@824000 {
>>>> +               compatible =3D "qcom,coresight-replicator", "arm,p=
rimecell";
>>>=20
>>> Shouldn't it be "qcom,coresight-replicator1x" ?
>>>=20
>>=20
>>=20
>>=20
>> True, I still wonder, why we have to have this compatible string?=20
>> Drivers are probed by amba_id and "arm,primecell", after all.
>=20
> The compatible string tells you both the device _and_ the format of t=
he
> other properties, because it tells you which binding applies.
>=20
> So the compatible string should be present regardless, as
> "arm,primecell" does not define the majority of the properties you ne=
ed
> for the replicator node.

Mmm, only if vendors don=E2=80=99t bother to update version information
fused to revision id registers, which happens. And this could=20
be workaround by "arm,primecell-periphid=E2=80=9D, no?

Regards,
Ivan--
To unsubscribe from this list: send the line "unsubscribe linux-kernel"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/
