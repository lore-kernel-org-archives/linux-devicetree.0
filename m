From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] pinctrl: qcom: Add msm8998 pinctrl driver
Date: Mon, 9 Jan 2017 23:36:20 -0600
Message-ID: <20170110053620.n6auldzfm4cdth5j@rob-hp-laptop>
References: <1483974019-8235-1-git-send-email-kimran@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483974019-8235-1-git-send-email-kimran@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Imran Khan <kimran@codeaurora.org>
Cc: andy.gross@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 09, 2017 at 08:30:17PM +0530, Imran Khan wrote:
> Add initial pinctrl driver to support pin configuration with
> pinctrl framework for msm8998.
> 
> Signed-off-by: Imran Khan <kimran@codeaurora.org>
> ---
>  .../bindings/pinctrl/qcom,msm8998-pinctrl.txt      |  200 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/qcom/Kconfig                       |    8 +
>  drivers/pinctrl/qcom/Makefile                      |    1 +
>  drivers/pinctrl/qcom/pinctrl-msm8998.c             | 1933 ++++++++++++++++++++
>  4 files changed, 2142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8998.c
