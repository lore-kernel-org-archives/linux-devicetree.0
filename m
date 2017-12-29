From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v11 4/6] clk: qcom: Add regmap mux-div clocks support
Date: Thu, 28 Dec 2017 16:01:12 -0800
Message-ID: <20171229000112.GA7997@codeaurora.org>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171205154701.27730-5-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171205154701.27730-5-georgi.djakov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, mturquette@baylibre.com, robh@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/05, Georgi Djakov wrote:
> Add support for hardware that can switch both parent clock and divider
> at the same time. This avoids generating intermediate frequencies from
> either the old parent clock and new divider or new parent clock and
> old divider combinations.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
