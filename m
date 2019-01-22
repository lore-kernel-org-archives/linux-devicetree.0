From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: qcom: smd: Add support for MSM8956/76 RPM clocks
Date: Mon, 21 Jan 2019 18:30:14 -0600
Message-ID: <20190122003014.GA26136@bogus>
References: <2fcdf0e9b1eef55350911984064dd94f16f1fcd8.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2fcdf0e9b1eef55350911984064dd94f16f1fcd8.camel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 12, 2019 at 04:38:58PM +0100, AngeloGioacchino Del Regno wrote:
> From 6aeefad77a2a5d47a9bd009d2d10db2a5dd153a2 Mon Sep 17 00:00:00 2001
> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> Date: Sat, 12 Jan 2019 16:31:09 +0100
> Subject: [PATCH] clk: qcom: smd: Add support for MSM8956/76 RPM clocks
> 
> Add all RPM clocks found on MSM8956/MSM8976 SoCs.
> 
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> ---
>  .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +

Separate patch preferred, but for a 1 line change:

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/qcom/clk-smd-rpm.c                | 53 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
