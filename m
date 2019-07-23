From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Update Qualcomm SDM845 DT bindings
Date: Tue, 23 Jul 2019 07:42:46 -0700
Message-ID: <5d371ce7.1c69fb81.9650.8239@mx.google.com>
References: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org> <1563568344-1274-2-git-send-email-daidavid1@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563568344-1274-2-git-send-email-daidavid1@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, georgi.djakov@linaro.org, robh+dt@kernel.org
Cc: David Dai <daidavid1@codeaurora.org>, evgreen@google.com, ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting David Dai (2019-07-19 13:32:23)
> Redefine the Network-on-Chip devices to more accurately describe
> the interconnect topology on Qualcomm's SDM845 platform. Each
> interconnect device can communicate with different instances of the
> RPMh hardware which are described as RSCs(Resource State Coordinators).
>=20
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> ---
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,bcm-vote=
r.txt b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.txt
> new file mode 100644
> index 0000000..2cf7da2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.txt
> @@ -0,0 +1,32 @@
> +Qualcomm BCM-Voter interconnect driver binding
> +-----------------------------------------------------------
> +
> +The Bus Clock Manager (BCM) is a dedicated hardware accelerator
> +that manages shared system resources by aggregating requests
> +from multiple Resource State Coordinators (RSC). Interconnect
> +providers are able to vote for aggregated thresholds values from
> +consumers by communicating through their respective RSCs.
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +                       "qcom,sdm845-bcm-voter",
> +
> +Examples:
> +
> +apps_rsc: rsc@179c0000 {

But there isn't a reg property.

> +       label =3D "apps_rsc";

Is label required?

> +       compatible =3D "qcom,rpmh-rsc";
> +
> +       apps_bcm_voter: bcm_voter {
> +               compatible =3D "qcom,sdm845-bcm-voter";
> +       };
> +}
> +
> +disp_rsc: rsc@179d0000 {
> +       label =3D "disp_rsc";
> +       compatible =3D "qcom,rpmh-rsc";
> +
> +       disp_bcm_voter: bcm_voter {
> +               compatible =3D "qcom,sdm845-bcm-voter";
> +       };
> +}
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.t=
xt b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
> index 5c4f1d9..27f9ed9 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
> @@ -4,21 +4,43 @@ Qualcomm SDM845 Network-On-Chip interconnect driver bin=
ding
>  SDM845 interconnect providers support system bandwidth requirements thro=
ugh
>  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provide=
r is
>  able to communicate with the BCM through the Resource State Coordinator =
(RSC)
> -associated with each execution environment. Provider nodes must reside w=
ithin
> -an RPMh device node pertaining to their RSC and each provider maps to a =
single
> -RPMh resource.
> +associated with each execution environment. Provider nodes must point to=
 at
> +least one RPMh device child node pertaining to their RSC and each provid=
er
> +can map to multiple RPMh resources.
> =20
>  Required properties :
>  - compatible : shall contain only one of the following:
> -                       "qcom,sdm845-rsc-hlos"
> +                       "qcom,sdm845-aggre1_noc",
> +                       "qcom,sdm845-aggre2_noc",
> +                       "qcom,sdm845-config_noc",
> +                       "qcom,sdm845-dc_noc",
> +                       "qcom,sdm845-gladiator_noc",
> +                       "qcom,sdm845-mem_noc",
> +                       "qcom,sdm845-mmss_noc",
> +                       "qcom,sdm845-system_noc",
>  - #interconnect-cells : should contain 1
> +- reg : shall contain base register location and length
> +- qcom,bcm-voter : shall contain phandles to bcm voters
> =20
>  Examples:
> =20
> -apps_rsc: rsc {
> -       rsc_hlos: interconnect {
> -               compatible =3D "qcom,sdm845-rsc-hlos";
> -               #interconnect-cells =3D <1>;
> -       };
> +aggre1_noc: interconnect@16e0000 {
> +       compatible =3D "qcom,sdm845-aggre1_noc";
> +       reg =3D <0x16e0000 0xd080>;
> +       interconnect-cells =3D <1>;
> +       qcom,bcm-voter =3D <&apps_bcm_voter>;
>  };
> =20
> +mmss_noc: interconnect@1740000 {
> +       compatible =3D "qcom,sdm845-mmss_noc";
> +       reg =3D <0x1740000 0x1c1000>;
> +       interconnect-cells =3D <1>;
> +       qcom,bcm-voter =3D <&apps_bcm_voter>, <&disp_bcm_voter>;
> +};
> +
> +mem_noc: interconnect@1380000 {
> +       compatible =3D "qcom,sdm845-mem_noc";
> +       reg =3D <0 0x1380000 0 0x27200>;
> +       #interconnect-cells =3D <1>;
> +       qcom,bcm-voter =3D <&apps_bcm_voter>, <&disp_bcm_voter>;
> +};

How does a consumer target a particular RSC? For example, how can
display decide to use the disp_bcm_voter node from mem_noc here? Maybe
you can add that consumer to the example?
