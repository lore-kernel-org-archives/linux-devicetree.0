From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: qcom: Add MSM8976/56 Global Clock Controller (GCC)
 driver
Date: Mon, 21 Jan 2019 18:28:39 -0600
Message-ID: <20190122002839.GA22319@bogus>
References: <65fb363366f651e42d3e97792d5990185823cbc3.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <65fb363366f651e42d3e97792d5990185823cbc3.camel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 12, 2019 at 04:03:18PM +0100, AngeloGioacchino Del Regno wrote:
> From 50465f2a4454625aac622bb84dbecdeaf5a50904 Mon Sep 17 00:00:00 2001
> From: "Angelo G. Del Regno" <kholk11@gmail.com>
> Date: Sat, 12 Jan 2019 10:52:18 +0100
> Subject: [PATCH] clk: qcom: Add MSM8976/56 Global Clock Controller (GCC)
>  driver

Looks like your patch is corrupted.

> 
> Add support for the global clock controller found on MSM8976
> and MSM8976 SoCs.
> Since the multimedia clocks are actually in the GCC on these
> SoCs, this will allow drivers to probe and control basically
> all the required clocks.
> 
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +
>  drivers/clk/qcom/Kconfig                      |    8 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/gcc-msm8976.c                | 4208 +++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-msm8976.h  |  293 ++

The binding doc and this header should be in a separate patch.

>  5 files changed, 4511 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-msm8976.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8976.h
