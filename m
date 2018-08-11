From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm8998: Add die temperature channel
 node to the ADC
Date: Fri, 10 Aug 2018 17:10:22 -0700
Message-ID: <CAD=FV=VOhqHTnxJaF5d+qLYyy=QARQq+Y8Q+Oxyyqacnnt-grQ@mail.gmail.com>
References: <20180808191339.16875-1-mka@chromium.org> <20180808191339.16875-4-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180808191339.16875-4-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Aug 8, 2018 at 12:13 PM, Matthias Kaehlcke <mka@chromium.org> wrote:
> Add a channel node for the die temperature to the ADC.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8998.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> index f70f6101bceb..499bae0afb7f 100644
> --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> @@ -20,6 +20,11 @@
>                         #size-cells = <0>;
>                         #io-channel-cells = <1>;
>                         io-channel-ranges;
> +
> +                       die-temp {
> +                               reg = <ADC5_DIE_TEMP>;
> +                               label = "die_temp";
> +                       };

Seems to match the binding.

I'm no expert, but FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
