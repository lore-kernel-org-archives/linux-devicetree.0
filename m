From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v11 9/9] arm64: dts: qcom: msm8916: Add debug unit
Date: Tue, 23 May 2017 10:31:38 -0600
Message-ID: <CANLsYkwkJkNCvf42hyQv6Fnkn1Ab-OAbPuJhLskKu=q4ReMEDg@mail.gmail.com>
References: <1495548980-30432-1-git-send-email-leo.yan@linaro.org> <1495548980-30432-10-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1495548980-30432-10-git-send-email-leo.yan@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 23 May 2017 at 08:16, Leo Yan <leo.yan@linaro.org> wrote:
> Add debug unit on Qualcomm msm8916 based platforms, including the
> DragonBoard 410c board.
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Andy and David,

Would you mind taking a look a this when you have a minute?  If it's
fine with you we can make this go through my tree with the rest of the
driver.

Regards,
Mathieu


> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index ab30939..17691ab 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1116,6 +1116,38 @@
>                         };
>                 };
>
> +               debug@850000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0x850000 0x1000>;
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&CPU0>;
> +               };
> +
> +               debug@852000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0x852000 0x1000>;
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&CPU1>;
> +               };
> +
> +               debug@854000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0x854000 0x1000>;
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&CPU2>;
> +               };
> +
> +               debug@856000 {
> +                       compatible = "arm,coresight-cpu-debug","arm,primecell";
> +                       reg = <0x856000 0x1000>;
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +                       cpu = <&CPU3>;
> +               };
> +
>                 etm@85c000 {
>                         compatible = "arm,coresight-etm4x", "arm,primecell";
>                         reg = <0x85c000 0x1000>;
> --
> 2.7.4
>
