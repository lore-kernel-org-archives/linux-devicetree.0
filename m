From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: Add binding document for SR
 thermal
Date: Thu, 27 Sep 2018 12:27:58 -0500
Message-ID: <20180927172758.GA17761@bogus>
References: <1538062603-7490-1-git-send-email-srinath.mannam@broadcom.com>
 <1538062603-7490-2-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538062603-7490-2-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>
Cc: daniel.lezcano@linaro.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Pramod Kumar <pramod.kumar@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 09:06:41PM +0530, Srinath Mannam wrote:
> From: Pramod Kumar <pramod.kumar@broadcom.com>
> 
> Add binding document for supported thermal implementation
> in Stingray.
> 
> Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  .../bindings/thermal/brcm,sr-thermal.txt           | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> 
> diff --git a/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> new file mode 100644
> index 0000000..717617b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> @@ -0,0 +1,25 @@
> +* Broadcom Stingray Thermal
> +
> +This binding describes thermal sensors that is part of Stingray SoCs.
> +
> +Required properties:
> +- compatible : Must be "brcm,sr-thermal"
> +- reg : memory where tmon data will be available.
> +- brcm,tmon-mask: A one cell bit mask of valid TMON sources.
> +                  Each bit represents single TMON source.
> +- brcm,max-crit-temp: Maximum supported critical temperature.

We already have a defined binding for setting trip points. 

> +
> +Example:
> +	tmons {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x0 0x8f100000 0x100>;
> +
> +		tmon: thermal@0 {
> +			compatible = "brcm,sr-thermal";
> +			reg = <0 0x40>;
> +			brcm,tmon-mask = <0x3f>;
> +			brcm,max-crit-temp = <105000>;
> +		};
> +	};
> -- 
> 2.7.4
> 
