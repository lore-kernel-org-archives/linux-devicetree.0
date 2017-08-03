From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: spmi-gpio: Add pmi8994 gpio support
Date: Thu, 3 Aug 2017 15:01:41 -0500
Message-ID: <20170803200141.qvzj35zz4nup3ich@rob-hp-laptop>
References: <1501137036-20155-1-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501137036-20155-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: bjorn.andersson@linaro.org, linus.walleij@linaro.org, andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 27, 2017 at 12:00:35PM +0530, Vivek Gautam wrote:
> Update the bindings doc and driver for pmi8994-gpio devices.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
> 
> - Have been using this patch-set on db820c [1] for extcon with
>   usb controller. The usb controller uses one of these gpios
>   for usb-id/vbus detection.
> 
> [1] https://github.com/boddob/linux/tree/for-qcomlt/4.13rc2-merged
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 1 +
>  2 files changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
