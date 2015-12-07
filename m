From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: add SMP enable-method for Broadcom
 NSP
Date: Mon, 7 Dec 2015 08:16:56 -0600
Message-ID: <20151207141656.GA23414@rob-hp-laptop>
References: <1449316424-14549-1-git-send-email-kapilh@broadcom.com>
 <1449316424-14549-2-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449316424-14549-2-git-send-email-kapilh@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kapil Hali <kapilh@broadcom.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Sat, Dec 05, 2015 at 06:53:40AM -0500, Kapil Hali wrote:
> Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
> Northstar Plus CPU to the 32-bit ARM CPU device tree binding
> documentation file and create a new binding documentation for
> Northstar Plus CPU.
> 
> Signed-off-by: Kapil Hali <kapilh@broadcom.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 39 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
> new file mode 100644
> index 0000000..677ef9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.txt
> @@ -0,0 +1,39 @@
> +Broadcom Northstar Plus SoC CPU Enable Method
> +---------------------------------------------
> +This binding defines the enable method used for starting secondary
> +CPU in the following Broadcom SoCs:
> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88312
> +
> +The enable method is specified by defining the following required
> +properties in the corresponding secondary "cpu" device tree node:
> +  - enable-method = "brcm,bcm-nsp-smp";
> +  - secondary-boot-reg = <...>;
> +
> +The secondary-boot-reg property is a u32 value that specifies the
> +physical address of the register which should hold the common
> +entry point for a secondary CPU. This entry is cpu node specific
> +and should be added per cpu. E.g., in case of NSP (BCM58625) which
> +is a dual core CPU SoC, this entry should be added to cpu1 node.
> +
> +
> +Example:
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			next-level-cache = <&L2>;
> +			reg = <0>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a9";
> +			next-level-cache = <&L2>;
> +			enable-method = "brcm,bcm-nsp-smp";
> +			secondary-boot-reg = <0xffff042c>;
> +			reg = <1>;
> +		};
> +	};
> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
> index 3a07a87..d191554 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.txt
> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
> @@ -190,6 +190,7 @@ nodes to be present and contain the properties described below.
>  			    "allwinner,sun6i-a31"
>  			    "allwinner,sun8i-a23"
>  			    "arm,psci"
> +			    "brcm,bcm-nsp-smp"
>  			    "brcm,brahma-b15"
>  			    "marvell,armada-375-smp"
>  			    "marvell,armada-380-smp"
> -- 
> 2.1.0
> 
