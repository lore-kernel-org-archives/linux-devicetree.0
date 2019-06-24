From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCHv3 21/23] arm64: dts: qcom: qcs404: Add tsens controller
Date: Mon, 24 Jun 2019 16:29:19 +0530
Message-ID: <CAHLCerMr30LWt3QcoYVF9gyHjkmO5acTDV-39N6ZO22feYi9=Q@mail.gmail.com>
References: <cover.1553086065.git.amit.kucheria@linaro.org> <9108372823aba9288b98b1c8a003c21b578d1e13.1553086065.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9108372823aba9288b98b1c8a003c21b578d1e13.1553086065.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, David Brown <david.brown@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 6:50 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> qcs404 has a single TSENS IP block with 10 sensors. The calibration data
> is stored in an eeprom (qfprom) that is accessed through the nvmem
> framework. We add the qfprom node to allow the tsens sensors to be
> calibrated correctly.
>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Hi Bjorn,

Could you please pick this patch and patch 22 in this series if you
have no other review comments? I can resend these separately if
required.

The driver (drivers/thermal/qcom/tsens-v1.c) was merged and only these
DT changes are pending.

Regards,
Amit


> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index e8fd26633d57..7881792980b8 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -259,6 +259,16 @@
>                         reg = <0x00060000 0x6000>;
>                 };
>
> +               qfprom: qfprom@a4000 {
> +                       compatible = "qcom,qfprom";
> +                       reg = <0x000a4000 0x1000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       tsens_caldata: caldata@d0 {
> +                               reg = <0x1f8 0x14>;
> +                       };
> +               };
> +
>                 rng: rng@e3000 {
>                         compatible = "qcom,prng-ee";
>                         reg = <0x000e3000 0x1000>;
> @@ -266,6 +276,16 @@
>                         clock-names = "core";
>                 };
>
> +               tsens: thermal-sensor@4a9000 {
> +                       compatible = "qcom,qcs404-tsens", "qcom,tsens-v1";
> +                       reg = <0x004a9000 0x1000>, /* TM */
> +                             <0x004a8000 0x1000>; /* SROT */
> +                       nvmem-cells = <&tsens_caldata>;
> +                       nvmem-cell-names = "calib";
> +                       #qcom,sensors = <10>;
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
>                 tlmm: pinctrl@1000000 {
>                         compatible = "qcom,qcs404-pinctrl";
>                         reg = <0x01000000 0x200000>,
> --
> 2.17.1
>
