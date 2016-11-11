From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v9 2/3] clk: qcom: Add support for RPM Clocks
Date: Thu, 10 Nov 2016 16:48:18 -0800
Message-ID: <20161111004818.GB5177@codeaurora.org>
References: <20161102155658.32203-1-georgi.djakov@linaro.org>
 <20161102155658.32203-3-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161102155658.32203-3-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/02, Georgi Djakov wrote:
> This adds initial support for clocks controlled by the Resource
> Power Manager (RPM) processor on some Qualcomm SoCs, which use
> the qcom_rpm driver to communicate with RPM.
> Such platforms are apq8064 and msm8960.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

Applied to clk-qcom-rpm and merged into clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
