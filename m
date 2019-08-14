From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 01/22] arm64: dts: qcom: sm8150: add base dts file
Date: Wed, 14 Aug 2019 10:50:26 -0700
Message-ID: <20190814175026.GF6167@minitux>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-2-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814125012.8700-2-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 14 Aug 05:49 PDT 2019, Vinod Koul wrote:
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
[..]
> +	soc: soc@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;

I'm expecting that we'll run into the same problems as we saw on 845
when bringing in the smmu nodes, so please make the cells 2 - and ranges
should likely be the same 36 bits.

Regards,
Bjorn
