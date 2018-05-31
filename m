From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: thermal: Add binding document for SR
 thermal
Date: Thu, 31 May 2018 11:48:20 -0500
Message-ID: <20180531164820.GA23074@rob-hp-laptop>
References: <1527486084-4636-1-git-send-email-srinath.mannam@broadcom.com>
 <1527486084-4636-2-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1527486084-4636-2-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Pramod Kumar <pramod.kumar@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 28, 2018 at 11:11:22AM +0530, Srinath Mannam wrote:
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

What type of memory is this?

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

Convince me that you need a node per register. This can all be 
accomplished with a single node and either a single reg entry or a 
series of reg entries.

> +
> +		tmon_ihost1: thermal@8f100004 {
> +			compatible = "brcm,sr-thermal";
> +			reg = <0x8f100004 0x4>;
> +		};
> +
> +		tmon_ihost2: thermal@8f100008 {
> +			compatible = "brcm,sr-thermal";
> +			reg = <0x8f100008 0x4>;
> +		};
> +
> +		tmon_ihost3: thermal@8f10000c {
> +			compatible = "brcm,sr-thermal";
> +			reg = <0x8f10000c 0x4>;
> +		};
> +
> +		tmon_crmu: thermal@8f100010 {
> +			compatible = "brcm,sr-thermal";
> +			reg = <0x8f100010 0x4>;
> +		};
> +
> +		tmon_nitro: thermal@8f100014 {
> +			compatible = "brcm,sr-thermal";
> +			reg = <0x8f100014 0x4>;
> +		};
> +	};
> -- 
> 2.7.4
> 
