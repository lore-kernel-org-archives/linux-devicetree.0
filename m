From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/4] ARM: DT: apq8064: add rpm support
Date: Mon, 29 Sep 2014 15:17:57 -0700
Message-ID: <5429DA95.80505@codeaurora.org>
References: <1411982044-7873-1-git-send-email-srinivas.kandagatla@linaro.org> <1411982092-7922-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1411982092-7922-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Cc: broonie@kernel.org, lee.jones@linaro.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arm@kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@sonymobile.com
List-Id: devicetree@vger.kernel.org

On 09/29/14 02:14, Srinivas Kandagatla wrote:
> @@ -246,6 +247,24 @@
>  			#reset-cells = <1>;
>  		};
>  
> +		apcs: syscon@2011000 {
> +			compatible = "syscon";
> +			reg = <0x2011000 0x1000>;
> +		};

This is actually a clock controller block that hw designers decided was
good place to shove the ipc bits (because there's room!). Can we call it

                l2cc: clock-controller@2011000 {
                        compatible = "syscon";
                        reg = <0x2011000 0x1000>;
                };

Eventually I'll add the specific krait compatible when we merge krait
clock support:

                l2cc: clock-controller@2011000 {
                        compatible = "qcom,kpss-gcc", "syscon";
                        reg = <0x2011000 0x1000>;
                        clock-output-names = "acpu_l2_aux";
                };

> +
> +		rpm@108000 {
> +			compatible	= "qcom,rpm-apq8064";
> +			reg		= <0x108000 0x1000>;
> +			qcom,ipc = <&apcs 0x8 2>;

There are actually 3 ipc bits. I guess if we ever have to use the other
two we'll extend this binding to have the other bits specified some
other way?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
