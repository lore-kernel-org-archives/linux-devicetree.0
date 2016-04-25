From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 20/41] Documentation: dt: pinctrl: fix spelling mistake
Date: Mon, 25 Apr 2016 08:51:01 -0500
Message-ID: <20160425135101.GA9186@rob-hp-laptop>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
 <1461543878-3639-21-git-send-email-eric@engestrom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461543878-3639-21-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Engestrom <eric@engestrom.ch>
Cc: linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, =?iso-8859-1?Q?Bj=F6rn?= Andersson <bjorn.andersson@sonymobile.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 01:24:17AM +0100, Eric Engestrom wrote:
> Signed-off-by: Eric Engestrom <eric@engestrom.ch>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> index a90c812..a54c39e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> @@ -122,7 +122,7 @@ to specify in a pin configuration subnode:
>  		    2: 1.5uA                    (PMIC_GPIO_PULL_UP_1P5)
>  		    3: 31.5uA                   (PMIC_GPIO_PULL_UP_31P5)
>  		    4: 1.5uA + 30uA boost       (PMIC_GPIO_PULL_UP_1P5_30)
> -		    If this property is ommited 30uA strength will be used if
> +		    If this property is omitted 30uA strength will be used if
>  		    pull up is selected
>  
>  - bias-high-impedance:
> -- 
> 2.8.0
> 
