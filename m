From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V1 2/3] pinctrl: qcom: spmi-gpio: Add dtest route for
 digital input
Date: Sun, 18 Jun 2017 09:04:59 -0500
Message-ID: <20170618140459.qfwpiacuha34jmv5@rob-hp-laptop>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
 <20170613061707.13892-3-fenglinw@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170613061707.13892-3-fenglinw@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: fenglinw@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 13, 2017 at 02:16:04PM +0800, fenglinw@codeaurora.org wrote:
> From: Fenglin Wu <fenglinw@codeaurora.org>
> 
> Add property "qcom,dtest-buffer" to specify which dtest rail to feed
> when the pin is configured as a digital input.
> 
> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 15 ++++++++
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 45 ++++++++++++++++++++++
>  include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  6 +++
>  3 files changed, 66 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
