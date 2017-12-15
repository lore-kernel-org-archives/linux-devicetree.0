From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 04/11] dt-bindings: clock: qcom: add remaining clocks
 for IPQ8074
Date: Fri, 15 Dec 2017 17:09:45 -0600
Message-ID: <20171215230945.fysottb7eqtabc5c@rob-hp-laptop>
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
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 13, 2017 at 07:55:35PM +0530, Abhishek Sahu wrote:
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
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h | 180 +++++++++++++++++++++++++++
>  1 file changed, 180 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

