From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 05/11] clk: =?utf-8?Q?qcom?=
 =?utf-8?Q?=3A_ipq8074=3A_add_remaining_PLL=E2=80=99s?=
Date: Thu, 21 Dec 2017 16:23:58 -0800
Message-ID: <20171222002358.GM7997@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
 <1513175142-3702-6-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513175142-3702-6-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/13, Abhishek Sahu wrote:
> - GPLL2, GPLL4 and GPLL6 are general PLL clocks and parent
>   for all core peripherals.
> - UBI PLL is mainly used by NSS (Network Switching System).
>   IPQ8074 has 2 instances of NSS UBI cores and UBI PLL will
>   be used to control the core frequency.
> - NSS Crypto PLL is mainly used by NSS Crypto Engine which
>   supports the multiple cryptographic algorithm used in
>   Ethernet.
> - IPQ8074 frequency plan does not require change in PLL post
>   dividers so marked the same as read-only.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
