From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: Add msm8916 CoreSight components
Date: Mon, 18 May 2015 13:52:40 -0500
Message-ID: <7F8B0480-06A8-4381-90C8-3F2A35F14FCD@codeaurora.org>
References: <1431333119-13626-1-git-send-email-ivan.ivanov@linaro.org> <CANLsYkyKrtyMicsNs2CDd4=GfrQJOPJkAqSUiTB=5hRs3+d=tQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLsYkyKrtyMicsNs2CDd4=GfrQJOPJkAqSUiTB=5hRs3+d=tQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> On May 11, 2015, at 2:21 PM, Mathieu Poirier <mathieu.poirier@linaro.=
org> wrote:
>=20
> On 11 May 2015 at 02:31, Ivan T. Ivanov <ivan.ivanov@linaro.org> wrot=
e:
>> Add initial set of CoreSight components found on Qualcomm's 8x16 chi=
pset.
>>=20
>> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
>> ---
>>=20
>> Changes since v2 [1]:
>> * Added "1x" to "qcom,coresight-replicator" compatible string, to ma=
tch what
>>  devicetree bindings documentations says.
>>=20
>> [1] http://www.spinics.net/lists/devicetree/msg77768.html
>>=20
>> arch/arm64/boot/dts/qcom/msm8916-coresight.dtsi | 254 ++++++++++++++=
++++++++++
>> 1 file changed, 254 insertions(+)
>> create mode 100644 arch/arm64/boot/dts/qcom/msm8916-coresight.dtsi
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/msm8916-coresight.dtsi b/arch/=
arm64/boot/dts/qcom/msm8916-coresight.dtsi
>> new file mode 100644
>> index 0000000..900f1f4
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8916-coresight.dtsi
>> @@ -0,0 +1,254 @@
>> +/*
>> + * Copyright (c) 2013 - 2015, The Linux Foundation. All rights rese=
rved.
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
nd
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +&soc {
>> +
>> +       tpiu@820000 {
>> +               compatible =3D "arm,coresight-tpiu", "arm,primecell"=
;
>> +               reg =3D <0x820000 0x1000>;
>> +
>> +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A=
_CLK>;
>> +               clock-names =3D "apb_pclk", "atclk";
>> +
>> +               port {
>> +                       tpiu_in: endpoint {
>> +                               slave-mode;
>> +                               remote-endpoint =3D <&replicator_out=
1>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       funnel@821000 {
>> +               compatible =3D "arm,coresight-funnel", "arm,primecel=
l";
>> +               reg =3D <0x821000 0x1000>;
>> +
>> +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A=
_CLK>;
>> +               clock-names =3D "apb_pclk", "atclk";
>> +
>> +               ports {
>> +                       #address-cells =3D <1>;
>> +                       #size-cells =3D <0>;
>> +
>> +                       /*
>> +                        * Not described input ports:
>> +                        * 0 - connected to Resource and Power Mange=
r CPU ETM
>> +                        * 1 - not-connected
>> +                        * 2 - connected to Modem CPU ETM
>> +                        * 3 - not-connected
>> +                        * 5 - not-connected
>> +                        * 6 - connected trought funnel to Wireless =
CPU ETM
>> +                        * 7 - connected to STM component
>> +                        */
>> +                       port@4 {
>> +                               reg =3D <4>;
>> +                               funnel0_in4: endpoint {
>> +                                       slave-mode;
>> +                                       remote-endpoint =3D <&funnel=
1_out>;
>> +                               };
>> +                       };
>> +                       port@8 {
>> +                               reg =3D <0>;
>> +                               funnel0_out: endpoint {
>> +                                       remote-endpoint =3D <&etf_in=
>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>> +       replicator@824000 {
>> +               compatible =3D "qcom,coresight-replicator1x", "arm,p=
rimecell";
>> +               reg =3D <0x824000 0x1000>;
>> +
>> +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A=
_CLK>;
>> +               clock-names =3D "apb_pclk", "atclk";
>> +
>> +               ports {
>> +                       #address-cells =3D <1>;
>> +                       #size-cells =3D <0>;
>> +
>> +                       port@0 {
>> +                               reg =3D <0>;
>> +                               replicator_out0: endpoint {
>> +                                       remote-endpoint =3D <&etr_in=
>;
>> +                               };
>> +                       };
>> +                       port@1 {
>> +                               reg =3D <1>;
>> +                               replicator_out1: endpoint {
>> +                                       remote-endpoint =3D <&tpiu_i=
n>;
>> +                               };
>> +                       };
>> +                       port@2 {
>> +                               reg =3D <0>;
>> +                               replicator_in: endpoint {
>> +                                       slave-mode;
>> +                                       remote-endpoint =3D <&etf_ou=
t>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>> +       etf@825000 {
>> +               compatible =3D "arm,coresight-tmc", "arm,primecell";
>> +               reg =3D <0x825000 0x1000>;
>> +
>> +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A=
_CLK>;
>> +               clock-names =3D "apb_pclk", "atclk";
>> +
>> +               ports {
>> +                       #address-cells =3D <1>;
>> +                       #size-cells =3D <0>;
>> +
>> +                       port@0 {
>> +                               reg =3D <0>;
>> +                               etf_out: endpoint {
>> +                                       slave-mode;
>> +                                       remote-endpoint =3D <&funnel=
0_out>;
>> +                               };
>> +                       };
>> +                       port@1 {
>> +                               reg =3D <0>;
>> +                               etf_in: endpoint {
>> +                                       remote-endpoint =3D <&replic=
ator_in>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>> +       etr@826000 {
>> +               compatible =3D "arm,coresight-tmc", "arm,primecell";
>> +               reg =3D <0x826000 0x1000>;
>> +
>> +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A=
_CLK>;
>> +               clock-names =3D "apb_pclk", "atclk";
>> +
>> +               port {
>> +                       etr_in: endpoint {
>> +                               slave-mode;
>> +                               remote-endpoint =3D <&replicator_out=
0>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       funnel@841000 { /* APSS funnel only 4 inputs are used */
>> +               compatible =3D "arm,coresight-funnel", "arm,primecel=
l";
>> +               reg =3D <0x841000 0x1000>;
>> +
>> +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A=
_CLK>;
>> +               clock-names =3D "apb_pclk", "atclk";
>> +
>> +               ports {
>> +                       #address-cells =3D <1>;
>> +                       #size-cells =3D <0>;
>> +
>> +                       port@0 {
>> +                               reg =3D <0>;
>> +                               funnel1_in0: endpoint {
>> +                                       slave-mode;
>> +                                       remote-endpoint =3D <&etm0_o=
ut>;
>> +                               };
>> +                       };
>> +                       port@1 {
>> +                               reg =3D <1>;
>> +                               funnel1_in1: endpoint {
>> +                                       slave-mode;
>> +                                       remote-endpoint =3D <&etm1_o=
ut>;
>> +                               };
>> +                       };
>> +                       port@2 {
>> +                               reg =3D <2>;
>> +                               funnel1_in2: endpoint {
>> +                                       slave-mode;
>> +                                       remote-endpoint =3D <&etm2_o=
ut>;
>> +                               };
>> +                       };
>> +                       port@3 {
>> +                               reg =3D <3>;
>> +                               funnel1_in3: endpoint {
>> +                                       slave-mode;
>> +                                       remote-endpoint =3D <&etm3_o=
ut>;
>> +                               };
>> +                       };
>> +                       port@4 {
>> +                               reg =3D <0>;
>> +                               funnel1_out: endpoint {
>> +                                       remote-endpoint =3D <&funnel=
0_in4>;
>> +                               };
>> +                       };
>> +               };
>> +       };
>> +
>> +       etm@85c000 {
>> +               compatible =3D "arm,coresight-etm4x", "arm,primecell=
";
>> +               reg =3D <0x85c000 0x1000>;
>> +
>> +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A=
_CLK>;
>> +               clock-names =3D "apb_pclk", "atclk";
>> +
>> +               cpu =3D <&CPU0>;
>> +
>> +               port {
>> +                       etm0_out: endpoint {
>> +                               remote-endpoint =3D <&funnel1_in0>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       etm@85d000 {
>> +               compatible =3D "arm,coresight-etm4x", "arm,primecell=
";
>> +               reg =3D <0x85d000 0x1000>;
>> +
>> +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A=
_CLK>;
>> +               clock-names =3D "apb_pclk", "atclk";
>> +
>> +               cpu =3D <&CPU1>;
>> +
>> +               port {
>> +                       etm1_out: endpoint {
>> +                               remote-endpoint =3D <&funnel1_in1>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       etm@85e000 {
>> +               compatible =3D "arm,coresight-etm4x", "arm,primecell=
";
>> +               reg =3D <0x85e000 0x1000>;
>> +
>> +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A=
_CLK>;
>> +               clock-names =3D "apb_pclk", "atclk";
>> +
>> +               cpu =3D <&CPU2>;
>> +
>> +               port {
>> +                       etm2_out: endpoint {
>> +                               remote-endpoint =3D <&funnel1_in2>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       etm@85f000 {
>> +               compatible =3D "arm,coresight-etm4x", "arm,primecell=
";
>> +               reg =3D <0x85f000 0x1000>;
>> +
>> +               clocks =3D <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A=
_CLK>;
>> +               clock-names =3D "apb_pclk", "atclk";
>> +
>> +               cpu =3D <&CPU3>;
>> +
>> +               port {
>> +                       etm3_out: endpoint {
>> +                               remote-endpoint =3D <&funnel1_in3>;
>> +                       };
>> +               };
>> +       };
>> +};
>> --
>> 1.9.1
>>=20
>=20
> Kumar, I'm happy with this DT specification for Coresight.  Since I'm
> taking the driver it would likely make more sense for this to go
> through my tree.  Could you please have a look and give me your ack?

It looks ok, however I don=E2=80=99t see us including this file anywher=
e, so that=E2=80=99s my only concern.

- k
--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
