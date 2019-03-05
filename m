From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Fix regulator supply names
Date: Tue, 5 Mar 2019 09:39:37 +0530
Message-ID: <20190305040937.GC2598@vkoul-mobl>
References: <20181213183200.3204-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181213183200.3204-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Dechesne <nicolas.dechesne@linaro.org>
List-Id: devicetree@vger.kernel.org

On 13-12-18, 10:32, Bjorn Andersson wrote:
> The regulator definition got their supply names cleaned up during
> upstreaming, so they no longer match the driver defined names. Update
> the supply names.
> 
> Also fill out the missing voltage of SMPS 5.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

we need to also fix sdm845 dts as well as patch up the binding doc
-- 
~Vinod
