From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 2/2] clk: qcom: Add graphics clock controller driver for SDM845
Date: Tue, 27 Nov 2018 16:54:41 -0800
Message-ID: <154336648116.88331.16808374347322634205@swboyd.mtv.corp.google.com>
References: <1543120569-14444-1-git-send-email-tdas@codeaurora.org>
 <1543120569-14444-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543120569-14444-3-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Amit Nischal <anischal@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-11-24 20:36:08)
> From: Amit Nischal <anischal@codeaurora.org>
> =

> Add support for the graphics clock controller found on SDM845
> based devices. This would allow graphics drivers to probe and
> control their clocks.
> =

> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next + a small cleanup to simplify probe return path.
