From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCHv1 6/8] arm64: dts: qcom: msm8996: Add PSCI cpuidle low
 power states
Date: Tue, 14 May 2019 18:12:49 +0200
Message-ID: <CAHYWTt1ZiX4mC01PRwVHU7417NC2tHY-_Cd+fwn1EyY+shKW-g@mail.gmail.com>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <8648ba97d49a9f731001e4b36611be9650e37f37.1557486950.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8648ba97d49a9f731001e4b36611be9650e37f37.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 10, 2019 at 04:59:44PM +0530, Amit Kucheria wrote:
> Add device bindings for cpuidle states for cpu devices.
>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index c761269caf80..b615bcb9e351 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -95,6 +95,7 @@
>                       compatible = "qcom,kryo";
>                       reg = <0x0 0x0>;
>                       enable-method = "psci";
> +                     cpu-idle-states = <&LITTLE_CPU_PD>;
>                       next-level-cache = <&L2_0>;
>                       L2_0: l2-cache {
>                             compatible = "cache";
> @@ -107,6 +108,7 @@
>                       compatible = "qcom,kryo";
>                       reg = <0x0 0x1>;
>                       enable-method = "psci";
> +                     cpu-idle-states = <&LITTLE_CPU_PD>;
>                       next-level-cache = <&L2_0>;
>               };
>
> @@ -115,6 +117,7 @@
>                       compatible = "qcom,kryo";
>                       reg = <0x0 0x100>;
>                       enable-method = "psci";
> +                     cpu-idle-states = <&BIG_CPU_PD>;
>                       next-level-cache = <&L2_1>;
>                       L2_1: l2-cache {
>                             compatible = "cache";
> @@ -127,6 +130,7 @@
>                       compatible = "qcom,kryo";
>                       reg = <0x0 0x101>;
>                       enable-method = "psci";
> +                     cpu-idle-states = <&BIG_CPU_PD>;
>                       next-level-cache = <&L2_1>;
>               };
>
> @@ -151,6 +155,30 @@
>                               };
>                       };
>               };
> +
> +             idle-states {
> +                     entry-method="psci";

Please add a space before and after "=".

> +
> +                     LITTLE_CPU_PD: little-power-down {

In Documentation/devicetree/bindings/arm/idle-states.txt
they seem to use labels such as CPU_SLEEP_0_0 for the first
cluster and CPU_SLEEP_1_0 for the second cluster.

Please also consider my comment in patch 4/8.

> +                             compatible = "arm,idle-state";
> +                             idle-state-name = "standalone-power-collapse";
> +                             arm,psci-suspend-param = <0x00000004>;
> +                             entry-latency-us = <40>;
> +                             exit-latency-us = <40>;

Where did you get the latency values from?
Downstream seems to use qcom,latency-us = <80> for "fpc".

(Sure downstream also defines "fpc-def", but that seems to require
additional psci code/calls that doesn't exist upstream.)

> +                             min-residency-us = <300>;
> +                             local-timer-stop;

Are you sure that the local timer is stopped?
the equivalent DT property to "local-timer-stop" in downstream is
"qcom,use-broadcast-timer", and this property seems to be missing
from this node:
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8996-pm.dtsi?h=msm-4.4#n158

You could try to remove "local-timer-stop", if it is really needed,
then the system should hang without this property.


> +                     };
> +
> +                     BIG_CPU_PD: big-power-down {
> +                             compatible = "arm,idle-state";
> +                             idle-state-name = "standalone-power-collapse";
> +                             arm,psci-suspend-param = <0x00000004>;
> +                             entry-latency-us = <40>;
> +                             exit-latency-us = <40>;

Where did you get the latency values from?
Downstream seems to use qcom,latency-us = <80> for "fpc".

(Sure downstream also defines "fpc-def", but that seems to require
additional psci code/calls that doesn't exist upstream.)

> +                             min-residency-us = <300>;
> +                             local-timer-stop;

Are you sure that the local timer is stopped?
the equivalent DT property to "local-timer-stop" in downstream is
"qcom,use-broadcast-timer", and this property seems to be missing
from this node:
https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8996-pm.dtsi?h=msm-4.4#n247

You could try to remove "local-timer-stop", if it is really needed,
then the system should hang without this property.


> +                     };
> +             };
>       };
> 
>       thermal-zones {
> --
> 2.17.1
>
