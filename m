From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 0/8] arm64: dts: qcom: sm8150: Add SM8150 DTS
Date: Wed, 21 Aug 2019 16:04:37 -0700
Message-ID: <20190821230437.GC1892@tuxbook-pro>
References: <20190821184239.12364-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821184239.12364-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 21 Aug 11:42 PDT 2019, Vinod Koul wrote:

> This series adds DTS for SM8150, PMIC PM8150, PM8150B, PM8150L and
> the MTP for SM8150.
> 

Applied, with Amit's acks.

> Changes in v4:
>  - Update the address and size cell to 2 and extend ranges and describe DMA
>    space
>  - Fix node location of spmi per sorted address
>  - Add Niklas's review tags
> 
> Changes in v3:
>  - Fix copyright comment style to Linux kernel style
>  - Make property values all hex or decimal
>  - Fix patch titles and logs and make them consistent
>  - Fix line breaks
> 
> Changes in v2:
>  - Squash patches
>  - Fix comments given by Stephen namely, lowercase for hex numbers,
>    making rpmhcc have xo_board as parent, rename pon controller to
>    power-on controller, make pmic nodes as disabled etc.
>  - removed the dependency on clk defines and use raw numbers
> 
> Vinod Koul (8):
>   arm64: dts: qcom: sm8150: Add base dts file
>   arm64: dts: qcom: pm8150: Add base dts file
>   arm64: dts: qcom: pm8150b: Add base dts file
>   arm64: dts: qcom: pm8150l: Add base dts file
>   arm64: dts: qcom: sm8150-mtp: Add base dts file
>   arm64: dts: qcom: sm8150-mtp: Add regulators
>   arm64: dts: qcom: sm8150: Add reserved-memory regions
>   arm64: dts: qcom: sm8150: Add apps shared nodes
> 
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/pm8150.dtsi    |  97 +++++
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi   |  86 +++++
>  arch/arm64/boot/dts/qcom/pm8150l.dtsi   |  80 ++++
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 375 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 482 ++++++++++++++++++++++++
>  6 files changed, 1121 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150b.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8150l.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8150-mtp.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8150.dtsi
> 
> -- 
> 2.20.1
> 
