From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc: Add global clock controller driver for
 QCS404
Date: Tue, 16 Oct 2018 15:17:57 -0700
Message-ID: <153972827704.5275.5606344004932442164@swboyd.mtv.corp.google.com>
References: <20181010145138.17185-1-vkoul@kernel.org>
 <20181010145138.17185-3-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010145138.17185-3-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Shefali Jain <shefjain@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Anu Ramanathan <anur@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2018-10-10 07:51:38)
> From: Shefali Jain <shefjain@codeaurora.org>
> =

> Add the clocks supported in global clock controller which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
> =

> Signed-off-by: Shefali Jain <shefjain@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Co-developed-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> [bamse, vkoul: rebase and tidyup for upstream]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next with some minor cosmetic touches.
