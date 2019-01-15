From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 01/14] dt-bindings: pinctrl: qcom-pmic-gpio: add
 qcom,pmi8998-gpio binding
Date: Tue, 15 Jan 2019 14:07:08 -0600
Message-ID: <20190115200708.GA20288@bogus>
References: <20190113154716.5145-1-masneyb@onstation.org>
 <20190113154716.5145-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190113154716.5145-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 13 Jan 2019 10:47:03 -0500, Brian Masney wrote:
> Add support for the PMI8998 GPIO variant to the Qualcomm PMIC GPIO
> binding document.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> This is a new patch introduced in V4.
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
