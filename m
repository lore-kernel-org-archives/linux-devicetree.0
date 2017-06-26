From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] pinctrl: Add sleep related configuration
Date: Mon, 26 Jun 2017 11:13:48 -0500
Message-ID: <20170626161348.vrtlpat5eof5aa2c@rob-hp-laptop>
References: <62a67526907157d41235403bd05af309fd4db16b.1498045588.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <62a67526907157d41235403bd05af309fd4db16b.1498045588.git.baolin.wang@spreadtrum.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@spreadtrum.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 21, 2017 at 07:55:37PM +0800, Baolin Wang wrote:
> In some scenarios, we should set some pins as input/output/pullup/pulldown
> when the specified system goes into deep sleep mode, then when the system
> goes into deep sleep mode, these pins will be set automatically by hardware.
> 
> Usually we can set the "sleep" state to set sleep related config, but one SoC
> usually has not only one system (especially for mobile SoC), some systems on
> the SoC which did not run linux kernel, they can not select the "sleep" state
> when they go into deep sleep mode.

The wording here is not very clear. I think what you mean is some pins 
are not controlled by any specific driver in the OS, but need to be 
controlled when entering sleep mode.

> Thus we introduce some sleep related config into pinconf-generic for users to
> configure.
> 
> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
> ---
>  - Add this patch since v4.
> ---
>  .../bindings/pinctrl/pinctrl-bindings.txt          |   12 ++++++++++++
>  drivers/pinctrl/pinconf-generic.c                  |   10 ++++++++++
>  include/linux/pinctrl/pinconf-generic.h            |   14 ++++++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> index bf3f7b0..e098059 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -236,6 +236,18 @@ low-power-enable	- enable low power mode
>  low-power-disable	- disable low power mode
>  output-low		- set the pin to output mode with low level
>  output-high		- set the pin to output mode with high level
> +sleep-bias-pull-up	- pull up the pin when the specified system goes into
> +			  deep sleep mode
> +sleep-bias-pull-down	- pull down the pin when the specified system goes into
> +			  deep sleep mode
> +sleep-input-enable	- enable input on pin when the specified system goes
> +			  into deep sleep mode (no effect on output)
> +sleep-intput-disable	- disable input on pin when the specified system goes
> +			  into deep sleep mode (no effect on output)
> +sleep-output-low	- set the pin to output mode with low level when the
> +			  specified system goes into deep sleep mode
> +sleep-output-high	- set the pin to output mode with high level when the
> +			  specified system goes into deep sleep mode
>  slew-rate		- set the slew rate

I don't really like having 2 ways to define pin setup and this doesn't 
scale if I need to define 3 states. Couldn't we create pin state 
definitions and have a pinctrl-n property within the pin controller 
node to handle all the unhandled pins?

Rob
