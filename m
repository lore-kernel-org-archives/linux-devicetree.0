From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: qcom: rpmcc: Add support to XO buffered clocks
Date: Mon, 19 Mar 2018 14:41:25 -0700
Message-ID: <152149568591.242365.10167530411419851285@swboyd.mtv.corp.google.com>
References: <20180318144401.21904-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180318144401.21904-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc: david.brown@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting srinivas.kandagatla@linaro.org (2018-03-18 07:44:01)
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> XO is onchip buffer clock to generate 19.2MHz.
> 
> This patch adds support to 5 XO buffer clocks found on PMIC8921,
> these buffer clocks can be controlled from external pin or in
> manual mode.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next
