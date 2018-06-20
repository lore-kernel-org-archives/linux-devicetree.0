From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: Add binding document for SR
 thermal
Date: Wed, 20 Jun 2018 13:52:14 -0600
Message-ID: <20180620195214.GA10436@rob-hp-laptop>
References: <1529310679-13482-1-git-send-email-srinath.mannam@broadcom.com>
 <1529310679-13482-2-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529310679-13482-2-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Pramod Kumar <pramod.kumar@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2018 at 02:01:17PM +0530, Srinath Mannam wrote:
> From: Pramod Kumar <pramod.kumar@broadcom.com>
> 
> Add binding document for supported thermal implementation
> in Stingray.
> 
> Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> Reviewed-by: Srinath Mannam <srinath.mannam@broadcom.com>
> ---
>  .../bindings/thermal/brcm,sr-thermal.txt           | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> 
> diff --git a/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> new file mode 100644
> index 0000000..33f9e11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
> @@ -0,0 +1,45 @@
> +* Broadcom Stingray Thermal
> +
> +This binding describes thermal sensors that is part of Stingray SoCs.
> +
> +Required properties:
> +- compatible : Must be "brcm,sr-thermal"
> +- reg : memory where tmon data will be available.
> +
> +Example:
> +	tmons {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		tmon_ihost0: thermal@8f100000 {
> +			compatible = "brcm,sr-thermal";
> +			reg = <0x8f100000 0x4>;
> +		};

You still haven't given me a compelling reason why you need a node per 
register.

You have a single range of registers. Make this 1 node.

Rob
