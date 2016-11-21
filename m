From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] regulator: pwm: DT: Add ramp delay for
 exponential voltage transition
Date: Mon, 21 Nov 2016 10:17:27 -0600
Message-ID: <20161121161727.y6pvydowiyeyy7qs@rob-hp-laptop>
References: <1479479756-10755-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479479756-10755-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Aleksandr Frid <afrid@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 18, 2016 at 08:05:55PM +0530, Laxman Dewangan wrote:
> Some PWM regulator has the exponential transition in voltage change as
> opposite to fixed slew-rate linear transition on other regulators.
> For such PWM regulators, add the property to tell that voltage change
> is exponential and having fixed delay for any level of change.
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
> 
> Changes from V1:
> - Pass the flag to tell that voltage ramp is exponential instead of
>   providing delay.
> ---
>  .../devicetree/bindings/regulator/pwm-regulator.txt          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> index 3aeba9f..2d9ef3a 100644
> --- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
> @@ -54,6 +54,18 @@ Optional properties:
>  --------------------
>  - enable-gpios:		GPIO to use to enable/disable the regulator
>  
> +- voltage-ramp-exponential: Boolean, Some of PWM regulator has the exponential
> +			transition in voltage ramp as opposite to fixed
> +			slew-rate linear transition on other regulators.
> +			For such PWM regulator, presence of this property will
> +			tell that value of the regulator ramp delay provided by
> +			DT property "regulator-ramp-delay" is exponential and
> +			fixed delay for any voltage level change.
> +			If PWM regulator supports the fixed linear slew rate
> +			then this property should be absent from DT node and
> +			property "regulator-ramp-delay" is used as linear slew
> +			rate.

Sorry, but on further thought, I don't think we should mix different 
units for the same property. Also, the fact that the ramp is exponential 
is irrelevant. You just want an absolute delay time rather than a rate, 
right? So instead, how about just "regulator-ramp-time-us". Roughly what 
you had in v1, but not PWM specific.

Rob
