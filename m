From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add msm8916 CoreSight
 components
Date: Fri, 08 May 2015 16:47:57 +0300
Message-ID: <1431092877.21307.18.camel@linaro.org>
References: <1431012969-16338-1-git-send-email-ivan.ivanov@linaro.org>
	 <1431012969-16338-3-git-send-email-ivan.ivanov@linaro.org>
	 <CANLsYkzNXBH0d6v1Ny_JwpW6NcKr9v0oAi9K3YfipwDgHWfMMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CANLsYkzNXBH0d6v1Ny_JwpW6NcKr9v0oAi9K3YfipwDgHWfMMA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Kumar Gala <galak@codeaurora.org>, Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Fri, 2015-05-08 at 07:38 -0600, Mathieu Poirier wrote:
> On 7 May 2015 at 09:36, Ivan T. Ivanov ivanov@linaro.org> wrote:
> > Add initial set of CoreSight components found on Qualcomm's 8x16 ch=
ipset.
> >=20
> >=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0replicator@824000 {
> > +               compatible =3D "qcom,coresight-replicator", "arm,pr=
imecell";
>=20
> Shouldn't it be "qcom,coresight-replicator1x" ?
>=20



True, I still wonder, why we have to have this compatible string?=20
Drivers are probed by amba_id and "arm,primecell", after all.

Thanks,
Ivan
