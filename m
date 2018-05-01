From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add video clock controller driver for SDM845
Date: Tue, 01 May 2018 14:41:17 -0700
Message-ID: <152521087780.138124.7623601052057968460@swboyd.mtv.corp.google.com>
References: <1524576771-31096-1-git-send-email-anischal@codeaurora.org>
 <1524576771-31096-3-git-send-email-anischal@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524576771-31096-3-git-send-email-anischal@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Amit Nischal <anischal@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Amit Nischal (2018-04-24 06:32:51)
> Add support for the video clock controller found on SDM845
> based devices. This would allow video drivers to probe and
> control their clocks.
> 
> Signed-off-by: Amit Nischal <anischal@codeaurora.org>

Driver looks small and good. Only concern is that there aren't resets
defined, but the binding says there are resets. Will you add them?

I'm going to wait for the respin on the dts binding anyway.
