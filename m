From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] regulator: pwm: DT: Add ramp delay for exponential
 voltage transition
Date: Mon, 14 Nov 2016 09:48:07 -0600
Message-ID: <20161114154807.j4oo4veslhknauxy@rob-hp-laptop>
References: <1478281075-3498-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478281075-3498-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Aleksandr Frid <afrid@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 04, 2016 at 11:07:54PM +0530, Laxman Dewangan wrote:
> Some PWM regulator has the exponential transition in voltage change as
> opposite to fixed slew-rate linear transition on other regulators.
> For such PWM regulators, add the property for providing the delay
> from DT node.
> 
> Add DT binding details of the new property
> "pwm-regulator-voltage-ramp-time-us" added for providing voltage
> transition delay.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Douglas Anderson <dianders@chromium.org>
> CC: Aleksandr Frid <afrid@nvidia.com>
> 
> ---
> This patch is continuation of discussion on patch
> 	regulator: pwm: Fix regulator ramp delay for continuous mode
> https://patchwork.kernel.org/patch/9216857/
> where is it discussed to have separate property for PWM which has
> exponential voltage transition.
> ---
>  Documentation/devicetree/bindings/regulator/pwm-regulator.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> index 3aeba9f..a163f42 100644
> --- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> @@ -54,6 +54,16 @@ Optional properties:
>  --------------------
>  - enable-gpios:		GPIO to use to enable/disable the regulator
>  
> +- pwm-regulator-voltage-ramp-time-us: Integer, voltage ramp time in

This is a really long name. Drop the 'pwm-regulator-' part as it is 
redundant. The fact that it is PWM reg specific is captured as it is 
documented that way.

Rob
