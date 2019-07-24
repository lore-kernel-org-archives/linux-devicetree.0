From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Update Qualcomm SDM845 DT bindings
Date: Wed, 24 Jul 2019 07:18:16 -0700
Message-ID: <5d3868a9.1c69fb81.876aa.ac30@mx.google.com>
References: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org> <1563568344-1274-2-git-send-email-daidavid1@codeaurora.org> <5d371ce7.1c69fb81.9650.8239@mx.google.com> <8c181f08-559b-5d77-a617-65cfd3d5da55@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8c181f08-559b-5d77-a617-65cfd3d5da55@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Dai <daidavid1@codeaurora.org>, bjorn.andersson@linaro.org, georgi.djakov@linaro.org, robh+dt@kernel.org
Cc: evgreen@google.com, ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting David Dai (2019-07-23 14:48:42)
> On 7/23/2019 7:42 AM, Stephen Boyd wrote:
> > Quoting David Dai (2019-07-19 13:32:23)
> >> +- compatible : shall contain only one of the following:
> >> +                       "qcom,sdm845-bcm-voter",
> >> +
> >> +Examples:
> >> +
> >> +apps_rsc: rsc@179c0000 {
> > But there isn't a reg property.
> I'll change this to the generic example with just apps_rsc: rsc {
> >
> >> +       label =3D "apps_rsc";
> > Is label required?

Any answer?

> >
> >> +       compatible =3D "qcom,rpmh-rsc";
> >> +
> >> +       apps_bcm_voter: bcm_voter {
> >> +               compatible =3D "qcom,sdm845-bcm-voter";
> >> +       };
> >> +}
> >> +
> >> +disp_rsc: rsc@179d0000 {
> >> +       label =3D "disp_rsc";
> >> +       compatible =3D "qcom,rpmh-rsc";
> >> +
> >> +       disp_bcm_voter: bcm_voter {
> >> +               compatible =3D "qcom,sdm845-bcm-voter";
> >> +       };
> >> +}
> >> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sdm84=
5.txt b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
> >> index 5c4f1d9..27f9ed9 100644
> >> --- a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
> >> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
[...]
> >> +
> >> +mem_noc: interconnect@1380000 {
> >> +       compatible =3D "qcom,sdm845-mem_noc";
> >> +       reg =3D <0 0x1380000 0 0x27200>;
> >> +       #interconnect-cells =3D <1>;
> >> +       qcom,bcm-voter =3D <&apps_bcm_voter>, <&disp_bcm_voter>;
> >> +};
> > How does a consumer target a particular RSC? For example, how can
> > display decide to use the disp_bcm_voter node from mem_noc here? Maybe
> > you can add that consumer to the example?
>=20
> I was thinking that the association between the bcm voters and the icc=20
> nodes would be handled by the interconnect provider, and that there=20
> would be a set of display specific icc nodes with their own unique IDs=20
> that the consumers could reference. I will mention this as part of the=20
> description and provide an example.
>=20
> Ex: interconnects =3D <&mmss_noc MASTER_MDP0_DISP &mem_noc SLAVE_EBI_DISP=
>;
>=20

It looks backwards to me. Don't the consumers want to consume a
particular RSC, i.e. apps or display RSC, so they can choose where to
put the bcm vote and then those RSCs want to find MMIO registers for
mmss_noc or mem_noc that they have to write to tune something else like
QoS? If the MMIO space is the provider then I'm lost how it can
differentiate between the RSCs that may be targetting the particular
NoC.=20

Maybe I've just completely missed something and this is all decided
already. If so, sorry, I'm just trying to understand.
