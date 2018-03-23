Return-Path: <SRS0=YHXO=GN=google.com=dianders@kernel.org>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <1521836461-6515-6-git-send-email-kramasub@codeaurora.org>
References: <1521836461-6515-1-git-send-email-kramasub@codeaurora.org> <1521836461-6515-6-git-send-email-kramasub@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Mar 2018 16:38:28 -0700
Message-ID: <CAD=FV=U46kXNfV4D3=kO6+nd6NNzuBDAEHeGJ4nJdN_255Vy7Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: sdm845: Add support for an instance of
 I2C controller
Content-Type: text/plain; charset="UTF-8"
To: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On Fri, Mar 23, 2018 at 1:21 PM, Karthikeyan Ramasubramanian
<kramasub@codeaurora.org> wrote:
> +                       i2c10: i2c@a88000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0xa88000 0x4000>;
> +                               clock-names = "se";
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
> +                               pinctrl-names = "default", "sleep";
> +                               pinctrl-0 = <&qup_i2c10_default>;
> +                               pinctrl-1 = <&qup_i2c10_sleep>;
> +                               interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +                               clock-frequency = <400000>;

Please move the clock-frequency to the board file.  Not all devices on
all boards will support 400 kHz, so we should be at 100 kHz by default
and boards should explicitly say that they support 400 kHz.

Other than that things look good to me and you can add my Reviewed-by tag.

-Doug
