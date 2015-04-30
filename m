From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add msm8916 CoreSight components
Date: Thu, 30 Apr 2015 12:24:34 +0300
Message-ID: <1430385874.2400.13.camel@linaro.org>
References: <1430310000-10867-1-git-send-email-ivan.ivanov@linaro.org>
	 <1430310000-10867-3-git-send-email-ivan.ivanov@linaro.org>
	 <CANLsYkxE9xieUW+OMgb4LbnJHRdCtTM=uzcwPzC6bs4x4pP3MA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLsYkxE9xieUW+OMgb4LbnJHRdCtTM=uzcwPzC6bs4x4pP3MA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Kumar Gala <galak@codeaurora.org>, Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wed, 2015-04-29 at 10:49 -0600, Mathieu Poirier wrote:
> On 29 April 2015 at 06:20, Ivan T. Ivanov ivanov@linaro.org> wrote:


> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0funnel@821000 {
> > +               compatible =3D "arm,coresight-funnel", "arm,primece=
ll";
> > +               reg =3D <0x821000 0x1000>;
> > +
> > +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_=
A_CLK>;
> > +               clock-names =3D "apb_pclk", "atclk";
> > +
> > +               ports {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
port@4 {
> > +                               reg =3D <4>;
> > +                               funnel0_in4: endpoint {
> > +                                       slave-mode;
> > +                                       remote-endpoint =3D <&funne=
l1_out>;
> > +                               };
> > +                       };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
port@8 {
> > +                               reg =3D <0>;
> > +                               funnel0_out: endpoint {
> > +                                       remote-endpoint =3D <&etf_i=
n>;
> > +                               };
> > +                       };
>=20
> Please add a comment indicating what the other ports are connected to=
=2E
>=20
> > +               };
> > +       };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0replicator@824000 {
> > +               compatible =3D "qcom,coresight-replicator", "arm,pr=
imecell";
> > +               reg =3D <0x824000 0x1000>;
> > +
> > +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_=
A_CLK>;
> > +               clock-names =3D "apb_pclk", "atclk";
> > +
> > +               ports {
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
port@0 {
> > +                               reg =3D <0>;
> > +                               replicator_out0: endpoint {
> > +                                       remote-endpoint =3D <&etr_i=
n>;
> > +                               };
> > +                       };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
port@1 {
> > +                               reg =3D <1>;
> > +                               replicator_out1: endpoint {
> > +                                       remote-endpoint =3D <&tpiu_=
in>;
> > +                               };
> > +                       };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
port@2 {
> > +                               reg =3D <0>;
> > +                               replicator_in: endpoint {
> > +                                       slave-mode;
> > +                                       remote-endpoint =3D <&etf_o=
ut>;
> > +                               };
> > +                       };
>=20
> Same comment as with the funnel component.

Sorry, but what do you mean here?

Regards,
Ivan
