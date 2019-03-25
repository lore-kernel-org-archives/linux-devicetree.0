Return-Path: <vkoul@kernel.org>
Date: Mon, 25 Mar 2019 13:58:33 +0530
From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcs404: Enable blsp1_uart3 for
 qcs404-evb
Message-ID: <20190325082833.GP5348@vkoul-mobl>
References: <20190324163209.17312-1-vkoul@kernel.org>
 <20190324163209.17312-5-vkoul@kernel.org>
 <20190324165517.GH27005@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190324165517.GH27005@builder>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Abhinav Asati <asatiabhi@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On 24-03-19, 09:55, Bjorn Andersson wrote:
> On Sun 24 Mar 09:32 PDT 2019, Vinod Koul wrote:
> 
> > From: Shawn Guo <shawn.guo@linaro.org>
> > 
> > It defines pinctrl settings for blsp1_uart3 in board level dts and
> > enable the device by toggling 'status'.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > Signed-off-by: Abhinav Asati <asatiabhi@codeaurora.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> How about a review of this patch instead?
> 
> https://lore.kernel.org/lkml/20190305070823.11845-1-bjorn.andersson@linaro.org/

Done lgtm..

-- 
~Vinod
