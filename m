From: Amit Kucheria <amit.kucheria@verdurent.com>
Subject: Re: [PATCH 14/15] arm: dts: qcom: Add missing OPP properties for CPUs
Date: Wed, 18 Jul 2018 15:52:26 +0530
Message-ID: <CAHLCerN1Oxz3t53gxvK83A8jQswsPitgm_NjQ4CWB8V02R_LnQ@mail.gmail.com>
References: <cover.1527244200.git.viresh.kumar@linaro.org> <9f9cc23d1fd17503c9056d62f7757fb9c412d1f9.1527244201.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f9cc23d1fd17503c9056d62f7757fb9c412d1f9.1527244201.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: arm@kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 25, 2018 at 4:02 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> The OPP properties, like "operating-points", should either be present
> for all the CPUs of a cluster or none. If these are present only for a
> subset of CPUs of a cluster then things will start falling apart as soon
> as the CPUs are brought online in a different order. For example, this
> will happen because the operating system looks for such properties in
> the CPU node it is trying to bring up, so that it can create an OPP
> table.
>
> Add such missing properties.
>
> Fix other missing property (clock latency) as well to make it all
> work.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

FWIW,
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index b25daf368012..8c202b359270 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -75,6 +75,14 @@
>                         reg = <0x1>;
>                         clocks = <&gcc GCC_APPS_CLK_SRC>;
>                         clock-frequency = <0>;
> +                       operating-points = <
> +                               /* kHz  uV (fixed) */
> +                               48000   1100000
> +                               200000  1100000
> +                               500000  1100000
> +                               666000  1100000
> +                       >;
> +                       clock-latency = <256000>;
>                 };
>
>                 cpu@2 {
> @@ -86,6 +94,14 @@
>                         reg = <0x2>;
>                         clocks = <&gcc GCC_APPS_CLK_SRC>;
>                         clock-frequency = <0>;
> +                       operating-points = <
> +                               /* kHz  uV (fixed) */
> +                               48000   1100000
> +                               200000  1100000
> +                               500000  1100000
> +                               666000  1100000
> +                       >;
> +                       clock-latency = <256000>;
>                 };
>
>                 cpu@3 {
> @@ -97,6 +113,14 @@
>                         reg = <0x3>;
>                         clocks = <&gcc GCC_APPS_CLK_SRC>;
>                         clock-frequency = <0>;
> +                       operating-points = <
> +                               /* kHz  uV (fixed) */
> +                               48000   1100000
> +                               200000  1100000
> +                               500000  1100000
> +                               666000  1100000
> +                       >;
> +                       clock-latency = <256000>;
>                 };
>         };
>
> --
> 2.15.0.194.g9af6a3dea062
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
