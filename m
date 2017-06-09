From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: update STM32 timers clock names
Date: Fri, 9 Jun 2017 09:43:42 +0200
Message-ID: <CA+M3ks4z46rPmjBt=pfJQBBjr5Hr7Oj4P=tv5wjo9WB_Ca_vsA@mail.gmail.com>
References: <1496993874-9870-1-git-send-email-fabrice.gasnier@st.com> <1496993874-9870-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496993874-9870-3-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2017-06-09 9:37 GMT+02:00 Fabrice Gasnier <fabrice.gasnier@st.com>:
> Clock name has been updated during driver/DT binding review:
> https://lkml.org/lkml/2016/12/13/718
> Update DT binding doc to reflect this.
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt b/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
> index 55a653d..6abc755 100644
> --- a/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
> +++ b/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
> @@ -14,7 +14,7 @@ Example:
>                 compatible = "st,stm32-timers";
>                 reg = <0x40010000 0x400>;
>                 clocks = <&rcc 0 160>;
> -               clock-names = "clk_int";
> +               clock-names = "int";
>
>                 timer@0 {
>                         compatible = "st,stm32-timer-trigger";
> --
> 1.9.1
>
Acked-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
