From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] Documentation: dt: pinctrl: Add pmi8994 gpio
 support
Date: Thu, 3 Aug 2017 18:06:57 -0500
Message-ID: <20170803230657.gyufjtiirkf3hzjd@rob-hp-laptop>
References: <1501247893-30226-1-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501247893-30226-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: bjorn.andersson@linaro.org, linus.walleij@linaro.org, andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org, rnayak@codeaurora.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 28, 2017 at 06:48:12PM +0530, Vivek Gautam wrote:
> Update the binding doc for qcom pmi8994-gpio devices.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> ---
> 
> - Have been testing this patch-set on db820c for extcon with
>   usb controller. The usb controller uses one of these gpios
>   for usb-id/vbus detection.
> 
> Changes since v1:
>  - Dropped "qcom,pmi8994-gpio" compatible addition to the driver
>    since we can use the generic "qcom,spmi-gpio" compatible.
>  - Sorted to add pmi8994-gpio in alphabatical order.
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
