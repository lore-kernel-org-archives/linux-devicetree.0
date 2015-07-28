From: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v1 4/7] ARM: dts: apq8064: Add MDP support
Date: Tue, 28 Jul 2015 14:30:25 -0400
Message-ID: <CAF6AEGtz8o_spTLd_4kUoOrExrpSkqkvqRWSd3Fh3Zd79Kjuwg@mail.gmail.com>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1438088049-17479-1-git-send-email-srinivas.kandagatla@linaro.org>
	<55B7BC79.1060504@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55B7BC79.1060504@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Andy Gross <agross@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 28, 2015 at 1:31 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Hi,
>
> Am 28.07.2015 um 14:54 schrieb Srinivas Kandagatla:
>> From: Rob Clark <robdclark@gmail.com>
>>
>> This patch adds MDP node to APQ8064 dt.
>>
>> Signed-off-by: Rob Clark <robdclark@gmail.com>
>> [Srinivas Kandagatla] : updated with new style rpm regulators
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>  arch/arm/boot/dts/qcom-apq8064.dtsi | 87 ++++++++++++++++++++++++++=
+++++++++++
>>  1 file changed, 87 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts=
/qcom-apq8064.dtsi
>> index cba4ccb..7d2cc45 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
>> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> [...]
>> +             gpu: qcom,adreno-3xx@4300000 {
>> +                     compatible =3D "qcom,adreno-3xx";
>
> I thought that wildcards were forbidden in compatible strings? Then t=
his
> should be replaced by the real number, with a fallback to the first
> compatible one.

That would at least result in a big number of different compatibles,
esp. when you consider patchlevels of the different gpu's, which in
some cases needs to be known (esp. to userspace).. ie. a320.0 is not
the same thing as a320.2.  And the "real numbers" themselves are
confusing as a result of meddling by marketeers.. (ie. a305 vs a305b
vs a306.. which actually map to 305.x, 306.x and 307.x).  The current
scheme is easy to figure out how to setup the dt nodes, ie. easy to
know a3xx vs a4xx, and then copy the chipid property from downstream
dt, and everything works.

The current scheme groups by major gpu revision (ie. things where
basically all the registers change, ie. a3xx/a4xx/a5xx) with using
chipid and a few if statements here and there (kernel and userspace)
to deal with the intra-generation differences.  (The chipid is
something which in theory should be read out of a version register,
but seems that cannot be trusted.)

Not to mention that a3xx/a4xx/etc is how userspace code in mesa is part=
itioned.

BR,
-R

> And can't we just name the node qcom,adreno without version suffix?
>
> Regards,
> Andreas
>
>> +                     reg =3D <0x04300000 0x20000>;
>> +                     reg-names =3D "kgsl_3d0_reg_memory";
>> +                     interrupts =3D <GIC_SPI 80 0>;
>> +                     interrupt-names =3D "kgsl_3d0_irq";
>> +                     clock-names =3D
>> +                         "core_clk",
>> +                         "iface_clk",
>> +                         "mem_clk",
>> +                         "mem_iface_clk";
>> +                     clocks =3D
>> +                         <&mmcc GFX3D_CLK>,
>> +                         <&mmcc GFX3D_AHB_CLK>,
>> +                         <&mmcc GFX3D_AXI_CLK>,
>> +                         <&mmcc MMSS_IMEM_AHB_CLK>;
>> +                     qcom,chipid =3D <0x03020002>;
>> +                     qcom,gpu-pwrlevels {
>> +                             compatible =3D "qcom,gpu-pwrlevels";
>> +                             qcom,gpu-pwrlevel@0 {
>> +                                     qcom,gpu-freq =3D <450000000>;
>> +                             };
>> +                             qcom,gpu-pwrlevel@1 {
>> +                                     qcom,gpu-freq =3D <27000000>;
>> +                             };
>> +                     };
>> +             };
>> +
>> +             mdp: qcom,mdp@5100000 {
>> +                     compatible =3D "qcom,mdp";
>> +                     reg =3D <0x05100000 0xf0000>;
>> +                     interrupts =3D <GIC_SPI 75 0>;
>> +                     connectors =3D <&hdmi>;
>> +                     gpus =3D <&gpu>;
>> +                     clock-names =3D
>> +                         "core_clk",
>> +                         "iface_clk",
>> +                         "lut_clk",
>> +                         "src_clk",
>> +                         "hdmi_clk",
>> +                         "mdp_clk",
>> +                         "mdp_axi_clk";
>> +                     clocks =3D
>> +                         <&mmcc MDP_CLK>,
>> +                         <&mmcc MDP_AHB_CLK>,
>> +                         <&mmcc MDP_LUT_CLK>,
>> +                         <&mmcc TV_SRC>,
>> +                         <&mmcc HDMI_TV_CLK>,
>> +                         <&mmcc MDP_TV_CLK>,
>> +                         <&mmcc MDP_AXI_CLK>;
>> +             };
>>       };
>>  };
>
> --
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Felix Imend=C3=B6rffer, Jane Smithard, Dilip Upmanyu, Graham Nort=
on; HRB
> 21284 (AG N=C3=BCrnberg)
