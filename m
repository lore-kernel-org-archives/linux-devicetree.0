From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCHv7 1/6] arm64: dts: qcom: sdm845: Add Coresight support
Date: Fri, 8 Feb 2019 14:20:39 +0000
Message-ID: <81dc97e6-2640-d600-9373-30518ed59792@arm.com>
References: <cover.1548981329.git.saiprakash.ranjan@codeaurora.org>
 <b672119cd1ffb5cba9da27ab5974fd5978e55b31.1548981329.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b672119cd1ffb5cba9da27ab5974fd5978e55b31.1548981329.git.saiprakash.ranjan@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: saiprakash.ranjan@codeaurora.org, robh+dt@kernel.org, mathieu.poirier@linaro.org, mike.leach@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, andy.gross@linaro.org, david.brown@linaro.org, vivek.gautam@codeaurora.org, jhugo@codeaurora.org, dianders@chromium.org, sboyd@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, mark.rutland@arm.com, marc.w.gonzalez@free.fr
Cc: rnayak@codeaurora.org, sibis@codeaurora.org, tingwei@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 01/02/2019 00:53, Sai Prakash Ranjan wrote:
> Add coresight components found on Qualcomm SDM845 SoC.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> ---
> For testing, all dependent patches are in below tree:
>   * https://github.com/saiprakash-ranjan/linux/tree/coresight-next
> 
> - Depends on AOSS QMP side channel patches by Bjorn Andersson [1] - [4].
> - AMBA bus pclk change [5].
> - Also depends on patch ("arm64: dts: qcom: sdm845: Increase address
>    and size cells for soc") [6].
> 
> [1] https://lore.kernel.org/lkml/20190131003933.11436-5-bjorn.andersson@linaro.org/
> [2] https://lore.kernel.org/lkml/20190131003933.11436-6-bjorn.andersson@linaro.org/
> [3] https://lore.kernel.org/lkml/20190131003933.11436-7-bjorn.andersson@linaro.org/
> [4] https://lore.kernel.org/lkml/20190131003933.11436-10-bjorn.andersson@linaro.org/
> [5] https://lore.kernel.org/lkml/20190131020141.28352-1-bjorn.andersson@linaro.org/
> [6] https://lore.kernel.org/lkml/20190117042940.25487-2-bjorn.andersson@linaro.org/
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 434 +++++++++++++++++++++++++++
>   1 file changed, 434 insertions(+)
> 

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
