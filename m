From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: sdm845: Fix DMA allocations for
 devices with IOMMU
Date: Fri, 18 Jan 2019 13:05:31 +0000
Message-ID: <7e662602-73dd-2ac6-4e49-ce92f1d157d2@linaro.org>
References: <20190117042940.25487-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117042940.25487-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 17/01/2019 04:29, Bjorn Andersson wrote:
> These patches extends the size cells of the soc bus and define the dma-ranges,
> so that DMA allocations for devices with IOMMU attached will get valid IOVAs.
> 
> Changes since v3:
> - Split patch in two
> - Rewrote commit message from scratch
> 
> Bjorn Andersson (2):
>    arm64: dts: qcom: sdm845: Increase address and size cells for soc
>    arm64: dts: qcom: sdm845: Extend ranges and describe DMA space
> 
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 301 ++++++++++++++-------------
>   1 file changed, 151 insertions(+), 150 deletions(-)
> 

Thanks for the fix, finally managed to get both fastrpc and ufs working 
together with iommu!


Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
