From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: Add Lenovo Miix 630
Date: Fri, 12 Apr 2019 11:01:42 -0700
Message-ID: <20190412180142.GZ1843@tuxbook-pro>
References: <20190411205144.43557-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190411205144.43557-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 11 Apr 13:51 PDT 2019, Jeffrey Hugo wrote:
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-clam.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clam.dtsi
[..]
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;

Did you double check that you actually need these? (Iirc boot testing is
enough)

> +
> +	touchpad: touchpad {
> +		config {
> +			pins = "gpio123";
> +			bias-pull-up;           /* pull up */
> +		};
> +	};
> +};
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
[..]
> +/ {
> +	model = "Lenovo Miix 630";
> +	compatible = "qcom,msm8998-clam";

compatible = "lenovo,miix-630", "qcom,msm8998";

> +
> +	/* bootloader doesn't understand DT, so no qcom,board-id */

You can omit this comment, as I don't think people will miss these
non-standard properties.

Regards,
Bjorn
