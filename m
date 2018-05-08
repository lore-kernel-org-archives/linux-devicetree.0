From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v7 3/3] clk: qcom: Add Global Clock controller (GCC) driver for
 SDM845
Date: Mon, 07 May 2018 18:14:43 -0700
Message-ID: <152574208368.138124.673130853127341411@swboyd.mtv.corp.google.com>
References: <1525690220-26525-1-git-send-email-anischal@codeaurora.org>
 <1525690220-26525-4-git-send-email-anischal@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525690220-26525-4-git-send-email-anischal@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Amit Nischal <anischal@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Amit Nischal (2018-05-07 03:50:20)
> From: Taniya Das <tdas@codeaurora.org>
> =

> Add support for the global clock controller found on SDM845
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
> =

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> ---

Applied to clk-next
