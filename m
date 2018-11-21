From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] clk: qcom: Support 'protected-clocks' property
Date: Wed, 21 Nov 2018 01:00:23 -0800
Message-ID: <154279082358.88331.12065362627893713159@swboyd.mtv.corp.google.com>
References: <20181105194011.43770-1-swboyd@chromium.org>
 <20181105194011.43770-3-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105194011.43770-3-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2018-11-05 11:40:11)
> Certain firmware configurations "protect" clks and cause the entire
> system to reboot when a non-secure OS such as Linux tries to read or
> write protected clk registers. But other firmware configurations allow
> reading or writing the same registers, and they may actually require
> that the OS use the otherwise locked down clks. Support the
> 'protected-clocks' property by never registering these protected clks
> with the common clk framework. This way, when firmware is protecting
> these clks we won't have the chance to ever read or write these
> registers and take down the entire system.
> =

> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied to clk-next
