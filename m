From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v3 11/16] arm: dts: msm8974: thermal: Add "qcom,sensors"
 property
Date: Thu, 20 Sep 2018 11:58:15 -0700
Message-ID: <20180920185815.GA19253@hector.localdomain>
References: <cover.1536744310.git.amit.kucheria@linaro.org>
 <98b41f976cbedd0e93d7988f0b3cd3ae8b911414.1536744310.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <98b41f976cbedd0e93d7988f0b3cd3ae8b911414.1536744310.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, smohanad@codeaurora.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 12, 2018 at 03:22:56PM +0530, Amit Kucheria wrote:
> This new property allows the number of sensors to be configured from DT
> instead of being hardcoded in platform data. Use it.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 56dbbf788d15..3c4b81c29798 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi

Acked-by: Andy Gross <andy.gross@linaro.org>
