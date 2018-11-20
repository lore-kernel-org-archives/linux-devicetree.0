From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: pm8998: Use ADC temperature to
 temp-alarm node
Date: Tue, 20 Nov 2018 10:21:33 -0800
Message-ID: <20181120182133.GR22824@google.com>
References: <20180927212253.177200-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180927212253.177200-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 02:22:53PM -0700, Matthias Kaehlcke wrote:
> The temperature information from the temp-alarm block itself is very
> coarse ("temperature is above/below trip points"). Provide the driver
> with the die temperature channel of the ADC on the PMIC for more precise
> readings.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> - based on agross/for-next (7a002fe0179c "Merge branch
>   'defconfig-for-4.20' into all-for-4.20-redo"))
> - depends on e13d757279bb ("iio: adc: Add QCOM SPMI PMIC5 ADC driver")
>   from IIO pull request:
>   git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git tags/iio-for-4.20a
> - to work properly https://patchwork.kernel.org/patch/10594491/ is
>   needed
> ---
>  arch/arm64/boot/dts/qcom/pm8998.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> index 048f19fa0150..fab5a826fb01 100644
> --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> @@ -58,6 +58,8 @@
>  			compatible = "qcom,spmi-temp-alarm";
>  			reg = <0x2400>;
>  			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
> +			io-channels = <&pm8998_adc ADC5_DIE_TEMP>;
> +			io-channel-names = "thermal";
>  			#thermal-sensor-cells = <0>;
>  		};
>  

I think this should be ready to land in for-next now that "arm64: dts:
qcom: pm8998: Add die temperature channel node to the ADC"
(a789fd0bab57) has been added.

Cheers

Matthias
