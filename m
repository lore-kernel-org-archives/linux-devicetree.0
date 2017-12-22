From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 04/11] dt-bindings: clock: qcom: add remaining clocks
 for IPQ8074
Date: Thu, 21 Dec 2017 16:24:14 -0800
Message-ID: <20171222002414.GS7997@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
 <1513175142-3702-5-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513175142-3702-5-git-send-email-absahu@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/13, Abhishek Sahu wrote:
> This patch adds the DT bindings for following IPQ8074 clocks
> 
>  - General PLL’s, NSS UBI PLL and NSS Crypto PLL.
>  - 2 instances of PCIE, USB, SDCC.
>  - 2 NSS UBI core and common NSS clocks. NSS is network switching
>    system which accelerates the ethernet traffic. IPQ8074
>    NSS has two UBI cores. Some clocks are separate for each UBI core
>    and remaining NSS clocks are common.
>  - NSS ethernet port clocks. IPQ8074 has 6 ethernet ports and
>    each port uses different TX and RX clocks.
>  - Crypto engine clocks.
>  - General purpose clocks which comes over GPIO.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
