From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: sdm845-pinctrl: add wakeup interrupt
 parent for GPIO
Date: Fri, 28 Dec 2018 18:07:14 -0600
Message-ID: <20181229000714.GA3654@bogus>
References: <20181219221105.3004-1-ilina@codeaurora.org>
 <20181219221105.3004-5-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181219221105.3004-5-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: sboyd@kernel.org, evgreen@chromium.org, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com, bjorn.andersson@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 19, 2018 at 03:11:02PM -0700, Lina Iyer wrote:
> SDM845 SoC has an always-on interrupt controller (PDC) with select GPIO
> routed to the PDC as interrupts that can be used to wake the system up
> from deep low power modes and suspend.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt    | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
> index 665aadb5ea28..a522ca46667d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
> @@ -29,6 +29,11 @@ SDM845 platform.
>  	Definition: must be 2. Specifying the pin number and flags, as defined
>  		    in <dt-bindings/interrupt-controller/irq.h>
>  
> +- wakeup-parent:
> +	Usage: optional
> +	Value type: <phandle>
> +	Definition: A phandle to the wakeup interrupt controller for the SoC.

Is this really necessary? Is there more than one possible wakeup-parent 
node?

> +
>  - gpio-controller:
>  	Usage: required
>  	Value type: <none>
> @@ -53,7 +58,6 @@ pin, a group, or a list of pins or groups. This configuration can include the
>  mux function to select on those pin(s)/group(s), and various pin configuration
>  parameters, such as pull-up, drive strength, etc.
>  
> -
>  PIN CONFIGURATION NODES:
>  
>  The name of each subnode is not important; all subnodes should be enumerated
> @@ -160,6 +164,7 @@ Example:
>  		#gpio-cells = <2>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
> +		wakeup-parent = <&pdc>;
>  
>  		qup9_active: qup9-active {
>  			mux {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
