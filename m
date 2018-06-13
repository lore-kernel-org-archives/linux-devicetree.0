From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH linux-next v5 07/13] dt-bindings: mfd: Add a document for
 PECI client mfd
Date: Wed, 13 Jun 2018 07:16:37 +0100
Message-ID: <20180613061637.GI5278@dell>
References: <20180601182216.23894-1-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180601182216.23894-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, James Feist <james.feist@linux.intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Joel Stanley <joel@jms.id.au>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-Id: devicetree@vger.kernel.org

All s/mfd/MFD/

> This commit adds a dt-bindings document for PECI client multi-function
> device.

Multi-Function Device

> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: James Feist <james.feist@linux.intel.com>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
> ---
>  .../devicetree/bindings/mfd/peci-client.txt   | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/peci-client.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/peci-client.txt b/Documentation/devicetree/bindings/mfd/peci-client.txt
> new file mode 100644
> index 000000000000..4eb8f6bb6ca4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/peci-client.txt
> @@ -0,0 +1,23 @@
> +* Intel PECI client bindings

Now it the time to expand on what a "PECI client" is.

> +Required properties:
> +- compatible : Should be "intel,peci-client", "simple-mfd".
> +- reg        : Should contain address of a client CPU. Address range of CPU
> +	       clients is starting from 0x30 based on PECI specification.

s/is starting/start/

> +Example:
> +	peci-bus@0 {

0?

> +		#address-cells = <1>;
> +		#size-cells = <0>;

No 'reg' property?

> +		< more properties >

Remove this.

> +		peci-client@30 {
> +			compatible = "intel,peci-client", "simple-mfd";
> +			reg = <0x30>;
> +		};
> +
> +		peci-client@31 {
> +			compatible = "intel,peci-client", "simple-mfd";
> +			reg = <0x31>;
> +		};
> +	};

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
