From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/4] Documentation: pv88080: Move binding document
Date: Fri, 18 Nov 2016 09:38:42 -0600
Message-ID: <20161118153842.bbcmfczxvrwamlqs@rob-hp-laptop>
References: <cover.1479429347.git.eric.jeong@diasemi.com>
 <8d6dc516374bf2c1cf0841aa68a888bca33413a0.1479429347.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8d6dc516374bf2c1cf0841aa68a888bca33413a0.1479429347.git.eric.jeong@diasemi.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: DEVICETREE <devicetree@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, LINUX-GPIO <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 18, 2016 at 09:35:46AM +0900, Eric Jeong wrote:
> 
> From: Eric Jeong <eric.jeong.opensource@diasemi.com>
> 
> The change is to move pv88080 binding document 
> from the regulator directory to mfd binding directory
> for PV88080 PMIC MFD support.
> And, GPIO properties are added.
> 
> 
> Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>
> 
> ---
> This patch applies against linux-next and next-20161117
> 
> Hi,
> 
> Change since PATCH V2
>  - Added property and description for gpio
> 
> Change since PATCH V1
>  - Patch separated from PATCH V1
> 
> Regards,
> Eric Jeong, Dialog Semiconductor Ltd.
> 
> 
>  .../bindings/{regulator => mfd}/pv88080.txt        |   16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/{regulator => mfd}/pv88080.txt (79%)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/pv88080.txt b/Documentation/devicetree/bindings/mfd/pv88080.txt
> similarity index 79%
> rename from Documentation/devicetree/bindings/regulator/pv88080.txt
> rename to Documentation/devicetree/bindings/mfd/pv88080.txt
> index e6e4b9c8..7e24f95 100644
> --- a/Documentation/devicetree/bindings/regulator/pv88080.txt
> +++ b/Documentation/devicetree/bindings/mfd/pv88080.txt
> @@ -1,4 +1,4 @@
> -* Powerventure Semiconductor PV88080 Voltage Regulator
> +* Powerventure Semiconductor PV88080 PMIC
>  
>  Required properties:
>  - compatible: Must be one of the following, depending on the
> @@ -16,8 +16,15 @@ Required properties:
>    standard binding for regulators; see regulator.txt.
>    BUCK1, BUCK2, BUCK3 and HVBUCK.
>  
> +- gpio-controller: Marks the device node as a GPIO controller.
> +- #gpio-cells: Should be 2. See gpio.txt in this directory
> +  for a description of the cells format.
> +
>  Optional properties:
> +- ngpios : Number of in-use slots of available slots for GPIO.
> +  Maximum is 2.
>  - Any optional property defined in regulator.txt
> +  and gpio.txt for more information.
>  
>  Example:
>  
> @@ -27,6 +34,13 @@ Example:
>  		interrupt-parent = <&gpio>;
>  		interrupts = <24 24>;
>  
> +		gpioex {

gpio-controller {

> +			compatible = "pvs,pv88080-gpio";

Is this documented?

> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			ngpios = <2>;
> +		};
> +
>  		regulators {
>  			BUCK1 {
>  				regulator-name = "buck1";
> -- 
> end-of-patch for PATCH V3
> 
