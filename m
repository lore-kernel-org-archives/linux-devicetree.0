From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 05/11] mfd: devicetree: bindings: Add Qualcomm SMD
 based RPM DT binding
Date: Tue, 7 Jul 2015 13:16:09 +0100
Message-ID: <20150707121609.GZ3182@x1>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1435355419-23602-6-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435355419-23602-6-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: bjorn@kryo.se
Cc: Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

=46AO Mark and DT chaps,

> From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
>=20
> Add binding documentation for the Qualcomm Resource Power Manager (RP=
M)
> using shared memory (Qualcomm SMD) as transport mechanism. This is fo=
und
> in 8974 and newer based devices.
>=20
> The binding currently describes the rpm itself and the regulator
> subnodes.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>  .../devicetree/bindings/mfd/qcom-rpm-smd.txt       | 117 +++++++++++=
++++++++++
>  include/dt-bindings/mfd/qcom-smd-rpm.h             |  28 +++++
>  2 files changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom-rpm-sm=
d.txt
>  create mode 100644 include/dt-bindings/mfd/qcom-smd-rpm.h
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt b=
/Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt
> new file mode 100644
> index 0000000..e27f5c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom-rpm-smd.txt
> @@ -0,0 +1,117 @@
> +Qualcomm Resource Power Manager (RPM) over SMD
> +
> +This driver is used to interface with the Resource Power Manager (RP=
M) found in
> +various Qualcomm platforms. The RPM allows each component in the sys=
tem to vote
> +for state of the system resources, such as clocks, regulators and bu=
s
> +frequencies.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,rpm-msm8974"
> +
> +- qcom,smd-channels:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: Shared Memory channel used for communication with the R=
PM

This is going to require a DT Ack.

Also, I don't see it being used anywhere.

> +=3D SUBDEVICES
> +
> +The RPM exposes resources to its subnodes. The below bindings specif=
y the set
> +of valid subnodes that can operate on these resources.
> +
> +=3D=3D Regulators
> +
> +Regulator nodes are identified by their compatible:
> +
> +- compatible:
> +	Usage: required
> +	Value type: <string>
> +	Definition: must be one of:
> +		    "qcom,rpm-pm8841-regulators"
> +		    "qcom,rpm-pm8941-regulators"
> +
> +- vdd_s1-supply:
> +- vdd_s2-supply:
> +- vdd_s3-supply:
> +- vdd_s4-supply:
> +- vdd_s5-supply:
> +- vdd_s6-supply:
> +- vdd_s7-supply:
> +- vdd_s8-supply:
> +	Usage: optional (pm8841 only)
> +	Value type: <phandle>
> +	Definition: reference to regulator supplying the input pin, as
> +		    described in the data sheet
> +
> +- vdd_s1-supply:
> +- vdd_s2-supply:
> +- vdd_s3-supply:
> +- vdd_l1_l3-supply:
> +- vdd_l2_lvs1_2_3-supply:
> +- vdd_l4_l11-supply:
> +- vdd_l5_l7-supply:
> +- vdd_l6_l12_l14_l15-supply:
> +- vdd_l8_l16_l18_l19-supply:
> +- vdd_l9_l10_l17_l22-supply:
> +- vdd_l13_l20_l23_l24-supply:
> +- vdd_l21-supply:
> +- vin_5vs-supply:
> +	Usage: optional (pm8941 only)
> +	Value type: <phandle>
> +	Definition: reference to regulator supplying the input pin, as
> +		    described in the data sheet
> +
> +The regulator node houses sub-nodes for each regulator within the de=
vice. Each
> +sub-node is identified using the node's name, with valid values list=
ed for each
> +of the pmics below.
> +
> +pm8841:
> +	s1, s2, s3, s4, s5, s6, s7, s8
> +
> +pm8941:
> +	s1, s2, s3, s4, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, =
l13,
> +	l14, l15, l16, l17, l18, l19, l20, l21, l22, l23, l24, lvs1, lvs2,
> +	lvs3, 5vs1, 5vs2
> +
> +The content of each sub-node is defined by the standard binding for =
regulators -
> +see regulator.txt.

s-regulator.txt-../regulator/regulator.txt-

> +
> +=3D EXAMPLE
> +
> +	smd {
> +		compatible =3D "qcom,smd";

Is an SMD (Shared Memory Device?) real hardware?

> +		rpm {
> +			interrupts =3D <0 168 1>;
> +			qcom,ipc =3D <&apcs 8 0>;
> +			qcom,smd-edge =3D <15>;

The child node won't probe without a compatible string.  Shouldn't
"qcom,rpm-msm8974" be in here instead?

> +			rpm_requests {

This node appears to be undocumented.

Does it represent real h/w?

> +				compatible =3D "qcom,rpm-msm8974";
> +				qcom,smd-channels =3D "rpm_requests";
> +
> +				pm8941-regulators {
> +					compatible =3D "qcom,rpm-pm8941-regulators";
> +					vdd_l13_l20_l23_l24-supply =3D <&pm8941_boost>;

I'd like Mark to glance at this.

> +					pm8941_s3: s3 {
> +						regulator-min-microvolt =3D <1800000>;
> +						regulator-max-microvolt =3D <1800000>;

Aren't these fixed regulators?

> +					};
> +
> +					pm8941_boost: s4 {
> +						regulator-min-microvolt =3D <5000000>;
> +						regulator-max-microvolt =3D <5000000>;
> +					};
> +
> +					pm8941_l20: l20 {
> +						regulator-min-microvolt =3D <2950000>;
> +						regulator-max-microvolt =3D <2950000>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> diff --git a/include/dt-bindings/mfd/qcom-smd-rpm.h b/include/dt-bind=
ings/mfd/qcom-smd-rpm.h
> new file mode 100644
> index 0000000..890ca52
> --- /dev/null
> +++ b/include/dt-bindings/mfd/qcom-smd-rpm.h
> @@ -0,0 +1,28 @@
> +/*
> + * This header provides constants for the Qualcomm RPM bindings.
> + */
> +
> +#ifndef _DT_BINDINGS_MFD_QCOM_SMD_RPM_H
> +#define _DT_BINDINGS_MFD_QCOM_SMD_RPM_H
> +
> +/*
> + * Constants used for addressing resources in the RPM.
> + */
> +#define QCOM_SMD_RPM_BUS_CLK	0x316b6c63
> +#define QCOM_SMD_RPM_BUS_MASTER	0x73616d62
> +#define QCOM_SMD_RPM_BUS_SLAVE	0x766c7362
> +#define QCOM_SMD_RPM_CLK_BUF_A	0x616B6C63
> +#define QCOM_SMD_RPM_LDOA	0x616f646c
> +#define QCOM_SMD_RPM_LDOB	0x626F646C
> +#define QCOM_SMD_RPM_MEM_CLK	0x326b6c63
> +#define QCOM_SMD_RPM_MISC_CLK	0x306b6c63
> +#define QCOM_SMD_RPM_NCPA	0x6170636E
> +#define QCOM_SMD_RPM_NCPB	0x6270636E
> +#define QCOM_SMD_RPM_OCMEM_PWR	0x706d636f
> +#define QCOM_SMD_RPM_QPIC_CLK	0x63697071
> +#define QCOM_SMD_RPM_SMPA	0x61706d73
> +#define QCOM_SMD_RPM_SMPB	0x62706d73
> +#define QCOM_SMD_RPM_SPDM	0x63707362
> +#define QCOM_SMD_RPM_VSA	0x00617376
> +
> +#endif

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
