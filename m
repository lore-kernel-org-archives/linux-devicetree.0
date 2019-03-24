Return-Path: <SRS0=xKYj=R3=linaro.org=bjorn.andersson@kernel.org>
Date: Sun, 24 Mar 2019 10:01:55 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: qcs404: ethernet and other updates
Message-ID: <20190324170155.GJ27005@builder>
References: <20190324163209.17312-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190324163209.17312-1-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun 24 Mar 09:32 PDT 2019, Vinod Koul wrote:

> This series adds ethernet nodes, fixes DMA settings, fixes regulator
> voltages and lastly adds spmi regulators for QCS404 platform
> 

Thanks Vinod, happy to see these on the list.

I picked up patches 1, 2, 3 and 6.

Regards,
Bjorn

> Bjorn Andersson (1):
>   arm64: dts: qcom: qcs404: Fix voltages for s5 and l3
> 
> Jorge Ramirez-Ortiz (1):
>   arm64: dts: qcom: pms405: add spmi regulators
> 
> Khasim Syed Mohammed (1):
>   arm64: dts: qcom: qcs404: Remove default setting of
>     controlled-remotely for BAM DMA
> 
> Shawn Guo (1):
>   arm64: dts: qcom: qcs404: Enable blsp1_uart3 for qcs404-evb
> 
> Vinod Koul (2):
>   arm64: dts: qcom: qcs404: Add Ethernet node
>   arm64: dts: qcom: qcs404: Enable ethernet for EVB-4000
> 
>  arch/arm64/boot/dts/qcom/pms405.dtsi         | 20 +++++
>  arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts | 82 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi     | 24 +++++-
>  arch/arm64/boot/dts/qcom/qcs404.dtsi         | 23 +++++-
>  4 files changed, 144 insertions(+), 5 deletions(-)
> 
> -- 
> 2.20.1
> 
