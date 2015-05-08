From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add msm8916 CoreSight components
Date: Fri, 8 May 2015 19:00:53 +0100
Message-ID: <20150508180052.GD11680@leverpostej>
References: <1431012969-16338-1-git-send-email-ivan.ivanov@linaro.org>
 <1431012969-16338-3-git-send-email-ivan.ivanov@linaro.org>
 <CANLsYkzNXBH0d6v1Ny_JwpW6NcKr9v0oAi9K3YfipwDgHWfMMA@mail.gmail.com>
 <1431092877.21307.18.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1431092877.21307.18.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Kumar Gala <galak@codeaurora.org>, Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 08, 2015 at 02:47:57PM +0100, Ivan T. Ivanov wrote:
>=20
> On Fri, 2015-05-08 at 07:38 -0600, Mathieu Poirier wrote:
> > On 7 May 2015 at 09:36, Ivan T. Ivanov ivanov@linaro.org> wrote:
> > > Add initial set of CoreSight components found on Qualcomm's 8x16 =
chipset.
> > >=20
> > >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0replicator@824000 {
> > > +               compatible =3D "qcom,coresight-replicator", "arm,=
primecell";
> >=20
> > Shouldn't it be "qcom,coresight-replicator1x" ?
> >=20
>=20
>=20
>=20
> True, I still wonder, why we have to have this compatible string?=20
> Drivers are probed by amba_id and "arm,primecell", after all.

The compatible string tells you both the device _and_ the format of the
other properties, because it tells you which binding applies.

So the compatible string should be present regardless, as
"arm,primecell" does not define the majority of the properties you need
for the replicator node.

Thanks,
Mark.
