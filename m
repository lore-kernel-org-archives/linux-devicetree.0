From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH v3 14/16] arm64: dts: msm8916: Add gpu thermal zone
Date: Thu, 20 Sep 2018 11:59:00 -0700
Message-ID: <20180920185900.GC19253@hector.localdomain>
References: <cover.1536744310.git.amit.kucheria@linaro.org>
 <ffefc578b5cb9298e33f0ea480b3d521f34afd54.1536744310.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ffefc578b5cb9298e33f0ea480b3d521f34afd54.1536744310.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, smohanad@codeaurora.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 12, 2018 at 03:22:59PM +0530, Amit Kucheria wrote:
> Initialise the gpu thermal zone to export temperature to userspace.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index be27d8dc9e6b..62f079ae9ba3 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi

Acked-by: Andy Gross <andy.gross@linaro.org>
