From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: Export clk_alpha_pll_configure()
Date: Tue, 16 Oct 2018 15:09:50 -0700
Message-ID: <153972779059.5275.4898649780099987389@swboyd.mtv.corp.google.com>
References: <20181010145138.17185-1-vkoul@kernel.org>
 <20181010145138.17185-2-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010145138.17185-2-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Shefali Jain <shefjain@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vinod Koul <vkoul@kernel.org>, Anu Ramanathan <anur@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2018-10-10 07:51:37)
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> =

> This is used by the QCS404 GCC driver, export it to allow that driver to
> be compiled as a module..
> =

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Applied to clk-next
